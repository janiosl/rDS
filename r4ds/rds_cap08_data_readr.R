library(tidyverse)
library(readr)

heights <- read_csv("data/heights.csv")
heights

read_csv(
  "a,b,c
  1,2,3
  4,5,6"
)

meta <- read_csv("metadados.csv",
                 skip = 2)
meta

comments <- read_csv("comments.csv",
                     comment = "#")
comments

noTitle <- read_csv("noTitle.csv",
                    col_names = FALSE)
noTitle

putTitle <- read_csv("noTitle.csv",
                     col_names = c("x", "y", "z"))
putTitle

#Tratamento de valores ausentes
#Sem tratamento
read_csv("a,b,c\n1,2,.")
read_csv("a,b,c\n1,2,-")


#Com tratamento
read_csv("a,b,c\n1,2,.", na = ".")
read_csv("a,b,c\n1,2,-", na = "-")

