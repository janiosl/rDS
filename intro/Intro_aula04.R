#Carga de dataset da biblioteca ISwR
library(ISwR)
data("thuesen")
head(thuesen)

#Using lapply function. Return in a list
obj <- lapply(thuesen, mean, na.rm=TRUE)
obj

obj2 <- sapply(thuesen, mean, na.rm=TRUE)
obj2

#Converter data frame em matriz
m <- as.matrix(thuesen)

#Processamento por linha
apply(m, 1, min, na.rm=TRUE)

#Processamento por coluna
apply(m, 2, min, na.rm=TRUE)

#Trabalhando com funções no R
#Vectors with data
intake.pre = c(5260, 5470, 5640, 6180, 6390,
               + 6515, 6808, 7515, 7515, 8230, 8770)

intake.post = c(3910, 4220, 3885, 5160, 5645,
                + 4680, 5265, 5975, 6790, 6900, 7335)

#Creating a data frame from vectors
d = data.frame(intake.pre, intake.post)

#Creating a function
twice <- function(x, a = NULL) {
  return(x * 2)
}

#Use of the custom function
twice(5)

#Using the function with vectors
twice(intake.pre)

#Using with data frame
twice(d)

#Creating another function
mymean <- function(x) {
  y <- mean(x)
  return(y)
}

mymean(intake.post)

#EXercise
#Create a data frame using height and weight and using apply compute the bmi
#Use a custom function for this goal
weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
d = data.frame(weight, height)

bmi <- function(w, h) {
  b = w / h^2
  return(b)
}


bmiF = list(bmi(d$weight, d$height))
