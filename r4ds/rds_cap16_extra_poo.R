## R OO --> http://adv-r.had.co.nz/OO-essentials.html
# Base Types --------------------------------------------------------------

#Function is C structure
#Analysis of a R function
f <- function() {}

typeof(f)
is.function(f)
is.primitive(f)

#Analysis of a primitive function
typeof(sum)
is.function(sum)
is.primitive(sum)

#Check if an object is a pure base type (is.object returns FALSE)
is.object(f)
is.object(sum)


# S3 OO -------------------------------------------------------------------

#Check if an object is a S3 type
df <- data.frame(x = 1:10, y = letters[1:10])

is.object(df) #Must be TRUE
isS4(df) #Must be FALSE

is.object(df) & !isS4(df) #Must be TRUE

#Check using pryr to simplify analysis
library(pryr)
otype(df) #Data frame is a S3 class
otype(df$x) #Numeric vector is a base object
otype(df$y) #Factor is a S3 class

#Analysis of a function to identify call for methods
mean
ftype(mean)

sum
ftype(sum)

cbind
ftype(cbind)

methods("mean")
methods("t.test")

#Creating S3 class
foo <- structure(list(), class = "foo")

cl <- list()
class(cl) <- "cl"


class(foo)
inherits(foo, "foo")
inherits(foo, "cl")

class(cl)
inherits(cl, "cl")
inherits(cl, "foo")

#Class constructor
foo <- function(x) {
  if (!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class = "foo")
}

#Methods and generic
f <- function(x) UseMethod("f")
f

f.a <- function(x) "Class a"
a <- structure(list(), class = "a")
class(a)
f(a)

mean.a <- function(x) "a"
mean(a)

#Method dispatch
f <- function(x) UseMethod("f")
f.a <- function(x) "Class a"
f.default <- function(x) "Unknown class"

#Using with a known class
f(structure(list(), class = "a"))

# No method for b class, so uses method for a class
f(structure(list(), class = c("b", "a")))

# No method for c class, so falls back to default
f(structure(list(), class = "c"))



# Example S3 ----------------------------------------------------------------

#class for data population
pop <- structure(list(), class = "pop")
pop <- function(x) {
  if (!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class = "pop")
}

#Class for data sample
amo <- structure(list(), class = "amo")
amo <- function(x) {
  if (!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class = "amo")
}

#Generic function and methods
media <- function(x) UseMethod("media")
class(media)

media.default <- function(x) {
  sum(x[[1]])/length(x[[1]])
}

media.numeric <- function(x) {
  sum(x) / length(x)
}


variancia <- function(x) UseMethod("variancia")


#Methods for specific classes
variancia.pop <- function(x) {
  "Variância da populução usa n"
  #Acrescentar código da variancia populacional
  return(sum((x[[1]] - media(x))^2)/length(x[[1]]))
}

variancia.amo <- function(x) {
  "Variância da amostra usa n-1"
  #Acrescentar código da variância amostral
  return(sum((x[[1]] - media(x))^2)/(length(x[[1]])-1))
  
}
variancia.default <- function(x) {
  "Classe desconhecida"
}

#Apply classes and methods
p <- pop(sample(1:1000, 30))
class(p)
typeof(p)
p

#Test for numeric rule
#ns <- pop(c("a", "b", "c"))

a <- amo(sample(p[[1]],3))
class(a)
typeof(a)
a

media(p)
media(a)
media(c(1,2,3))
media(c(5,13,25))

variancia(p)
variancia(a)
variancia(c(1,2,3))

var(a[[1]])


a2 <- amo(p[[1]])
a2

var(p[[1]])
variancia(a2)


pesos <- c(2.64, 2.38, 2.30, 2.69, 2.32, 2.66, 2.36, 2.70, 2.49, 1.56,
           2.33, 2.26, 2.15, 2.45, 2.02, 2.73, 3.09, 2.47, 2.44, 2.79)

mean(pesos)
media(pesos)

#Iguais pois usa a fórmula da variância amostral
var(pesos)
variancia(pesos)

pesos_a <- amo(pesos)
pesos_a

#Iguais pois usa a fórmula da variância amostral
var(pesos_a[[1]])
variancia(pesos_a)

pesos_p <- pop(pesos)
pesos_p

#Diferentes, pois um usa variância amostral e o outro populacional
var(pesos_p[[1]])
variancia(pesos_p)


# S4 OO -------------------------------------------------------------------

#Recognising S4 Objects
library(stats4)

y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
nLL <- function(lambda) - sum(dpois(y, lambda, log = TRUE))
fit <- mle(nLL, start = list(lambda = 5), nobs = length(y))

isS4(fit)
typeof(fit)
otype(fit)

# S4 generic
isS4(nobs)
ftype(nobs)

is(fit)
is(fit, "mle")

#Defining classes and creating objects
setClass("Person",
         slots = list(name = "character", age = "numeric"))
setClass("Employee",
         slots = list(boss = "Person"),
         contains = "Person")

alice <- new("Person", name = "Alice", age = 40)
john <- new("Employee", name = "John", age = 20, boss = alice)

alice
john

alice@age

slot(john, "boss")

#S4 object that contains (inherits from) an S3 class or a base type
setClass("RangedNumeric",
         contains = "numeric",
         slots = list(min = "numeric", max = "numeric"))
rn <- new("RangedNumeric", 1:10, min = 1, max = 10)
rn@min

rn@.Data

#Creating new methods and generics
setGeneric("union")


setMethod("union",
          c(x = "data.frame", y = "data.frame"),
          function(x, y) {
            unique(rbind(x, y))
          }
)


# From methods: takes generic name and class names
selectMethod("nobs", list("mle"))

# From pryr: takes an unevaluated function call
method_from_call(nobs(fit))
