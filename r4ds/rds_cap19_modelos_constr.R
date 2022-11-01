#Bibliotecas e configuração NA
library(tidyverse)
library(modelr)
options(na.action = na.warn)
library(lubridate)
#Datasets
library(nycflights13)


# Preços e qualidade de diamantes -----------------------------------------

ggplot(diamonds, aes(cut, price)) + geom_boxplot()
ggplot(diamonds, aes(color, price)) + geom_boxplot()
ggplot(diamonds, aes(clarity, price)) + geom_boxplot()

