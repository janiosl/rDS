#Classes with S3

polygon <- function(n) {
  if (n < 0) stop("Number of vertices should be greater than zero")
  obj <- list(n = n)
  #Class can be set using class() or attr() function
  attr(obj, "class") <- "polygon"
  
  return(obj)
}