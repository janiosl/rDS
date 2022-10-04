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


#Example
pop <- structure(list(), class = "pop")
pop <- function(x) {
  if (!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class = "pop")
}

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

variancia.pop <- function(x) {
  "Variância da populução usa n"
  #Acrescentar código da variancia populacional
  return(sum(diff(x[[1]])^2)/(length(x[[1]])))
}

variancia.amo <- function(x) {
  "Variância da amostra usa n-1"
  #Acrescentar código da variância amostral
  return(sum(diff(x[[1]])^2)/(length(x[[1]])-1))
  
}
variancia.default <- function(x) {
  "Classe desconhecida"
}

#Apply classes and methods
p <- pop(c(1,2,3,4,5,6,7,8,9,
           10,11,12,13,14,15,16,17,18,19,
           20,21,22,23,24,25,26,27,28,29,
           30,31,32,33,34,35,36,37,38,39))
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

a
a[[1]]
diff(a[[1]])
diff(a[[1]])^2
sum(diff(a[[1]])^2)

sum(diff(a[[1]])^2)/(length(a[[1]])-1)
var(a[[1]])

p[[1]]
diff(p[[1]])
diff(p[[1]])^2
sum(diff(p[[1]])^2)/(length(p[[1]]))

x <- c(1,2,3,4,5,6,7,8,9,
       10,11,12,13,14,15,16,17,18,19,
       20,21,22,23,24,25,26,27,28,29,
       30,31,32,33,34,35,36,37,38,39)

a2 <- amo(x)
a2

variancia(a2)
