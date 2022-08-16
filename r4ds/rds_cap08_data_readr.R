library(tidyverse)
library(readr)

heights <- read_csv("data/heights.csv")
heights

read_csv(
  "a,b,c
  1,2,3
  4,5,6"
)
