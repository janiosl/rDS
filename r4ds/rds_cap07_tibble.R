#install.packages("tidyverse")
#install.packages("nycflights13")
library(tidyverse)

##==================================
##Conjuntos de dados do tipo tibble
##==================================


#Transformar data.frame em tibble
as_tibble(iris)

#Criar tibble
tibble(x = 1:5,
       y = 1,
       z = x ^ 2 + y)

#Criar tible com colunas com nomes incomuns
tb <- tibble(':)' = "smile",
             ' ' = "space",
             '2000' = "number")

tb

#Criar tible por código
trb <- tribble(
  ~x, ~y, ~z,
  #--/--/----
  "a", 2, 3.6,
  "b", 1, 8.5
)

trb

#Visualização otimizada de tibbles
ex <- tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

#Padrão: apenas 10 linhas e as colunas que couberem na tela
ex

ex %>%
  print(n = 50, width = Inf)

#Visualização direta
nycflights13::flights

#Personalização da visualização
nycflights13::flights %>%
  print(n = 10, width = Inf)

##===========================
##Subconjuntos
##===========================
df <- tibble(
  x = runif(5),
  y = runif(5)
)

df

#Filtros por coluna
df$x
df$y
df[["x"]]
df[[1]]

#Filtros dentro de um pipe
df %>% .$x
df %>% .$y
df %>% .[[1]]


##===========================
##Converter em data.frame
##===========================
as.data.frame(df)
class(as.data.frame(df))
class(df)
