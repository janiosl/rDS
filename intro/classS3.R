#Classes with S3

##============================================================================
##Creating a class
##============================================================================
#Constructor
polygon <- function(n) {
  if (n <= 0) stop("Number of vertices should be greater than zero")
  obj <- list(n = n)
  #Class can be set using class() or attr() function
  attr(obj, "class") <- "polygon"
  
  return(obj)
}


#Inheritance
rectangle <- function(w, h) {
  obj <- polygon(4)
  obj$w <- w
  obj$h <- h
  class(obj) <- append("rectangle", class(obj))
  
  return(obj)
}


square <- function(w) {
  obj <- rectangle(w, w)
  class(obj) <- append("square", class(obj))
  
  return(obj)
}

#Implementing an "interface" (methods)
print.polygon <- function(obj) {
  cat(obj$n, "\n")
}

print.rectangle <- function(obj) {
  cat(obj$w, ",", obj$h, "\n")
}


area <- function(obj) {
  UseMethod("area")
}

area.default <- function(obj) {
  return(0)
}

area.rectangle <- function(obj) {
  return(obj$w * obj$h)
}

area.square <- function(obj) {
  return(obj$w * obj$h)
}

methods(class="default")


##============================================================================
##Using a class
##============================================================================
a <- 3
p <- polygon(5)
r <- rectangle(3, 10)
s <- square(5)

print(a)
print(p)
print(r)
print(s)

print(area(a))
print(area(p))
print(area(r))
print(area(s))

