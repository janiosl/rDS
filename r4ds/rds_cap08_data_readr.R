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

##========================
##Analisando vetor
##========================
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))
str(parse_date(c("2010-01-01", "1979-10-14")))

#Argumentos adicionais
parse_integer(c("1", "231", ".", "456"), na = ".")

x <- parse_integer(c("123", "231", "abc", "456.77"))
x

#Análise de problemas no parse
problems(x)
