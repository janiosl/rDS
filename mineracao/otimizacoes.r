#===============================================
#Performance analysis with profvis
#Desenvolvido por: Janio Lima
#Dicas de uso no Canal Youtube Python DS:
#https://www.youtube.com/channel/UCdpQJDGrM3Xj58ZFF-2UNBA
#===============================================

#Dataset
#Try with 100.000 observations
df <- data.frame(time=c(1:1000000),
                 observations=c(rnorm(1000000)))

hist(df$observations)
summary(df)
dim(df)

#Run it again after change observations and before continue tests
df$double <- rep(NaN, length(df$observations))

#Basic tests
for (i in 1:length(df$observations)) {
  df$double[i] <- df$observations[i] * 2
}

dx <- function(x) {
  d <- x * 2
  return(d)
}

dx(2)

for (i in 1:length(df$observations)) {
  df$double[i] <- dx(df$observations[i])
}

df$double_app <- sapply(df$observations, FUN = dx)

install.packages("profvis")
library(profvis)

#profvis - Basic use
profvis({
  a <- 2
  b <- 3
  a + b
})


profvis({
  for (i in 1:length(df$observations)) {
    df$double[i] <- df$observations[i] * 2
  }
  
  df$double_app <- sapply(df$observations, FUN = dx)
})


#Change dataset to 1.000.000 observations before continue...

#Subset
subdf <- subset(df, time <= 50000, select = c(time, observations, double))


#Comparison between different methods using data frame
profvis({
  for (i in 1:length(subdf$observations)) {
    subdf$double[i] <- dx(subdf$observations[i])
  }
  
  subdf$double_otm <- subdf$observations * 2
  
  subdf$double_app <- sapply(subdf$observations, FUN = dx)
})

#Matrix
subdf.mtx <- as.matrix(subset(df, time <= 50000, select = c(time, observations, double)))

for (i in 1:length(subdf.mtx[,1])) {
  subdf.mtx[i, "double"] <- subdf.mtx[i, "observations"] * 2
}

#Comparison between different methods and data structures
profvis({
  for (i in 1:length(subdf$observations)) {
    subdf$double[i] <- subdf$observations[i] * 2
  }
  
  for (i in 1:length(subdf.mtx[,1])) {
    subdf.mtx[i, "double"] <- subdf.mtx[i, "observations"] * 2
  }

})



#Dataset completo
df.mtx <- as.matrix(df)

p <- profvis({
  for (i in 1:length(df$observations)) {
    df$double[i] <- df$observations[i] * 2
  }
  
  for (i in 1:length(df.mtx[,1])) {
    df.mtx[i, "double"] <- df.mtx[i, "observations"] * 2
  }
})

htmlwidgets::saveWidget(p, "prof_teste_20200111.html")
