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
serie <- structure(list(), class = "serie")

serie <- function(x) {
  if (!is.numeric(x)) stop("The serie must be numeric")
  structure(list(x), class = "serie")
}

s <- serie(c(1,2,3))
class(s)
typeof(s)

ns <- serie(c("a", "b", "c"))

media <- function(x) UseMethod("media")
class(media)
