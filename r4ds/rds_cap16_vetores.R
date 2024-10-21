library(tidyverse)


# Atributos básicos de vetores --------------------------------------------

##Tipos
typeof(letters)
typeof(1:10)

##Tamanho
x <- list("a", "b", 1:10)
length(x)

y <- c(1:10)
y
length(y)



# Vetores atômicos --------------------------------------------------------

#Vetor lógico
#A partir de expressão lógica
1:10 %% 3 == 0

v <- c(1,2,3,4,5,6,NA,8)
v

vl <- v > 3
vl

#Manual
c(TRUE, TRUE, FALSE, NA)

#Vetor numérico
typeof(1)
typeof(1L)
typeof(0.5)

#Alerta -> Double são aproximações
x <- sqrt(2) ^ 2
x
x - 2

#Comparações de ponto flutuante
x == 2
near(x, 2)
near(x, 3)

#Valores especiais
#NA, NaN, Inf, -Inf
c(-1, 0, 1) / 0

#Operações lógicas com valores especiais
y = c(0, Inf, -Inf, NA, NaN)
y
is.finite(y)
is.infinite(y)
is.na(y)
is.nan(y)

#Conversão
as.integer(c(TRUE, FALSE, FALSE, TRUE))
as.logical(c(1,0,0,1,3,-1,0))

x <- sample(20, 100, replace = TRUE)
x

y <- x > 10
y

#Quantidade de verdadeiros
sum(y)

#Proporção de verdadeiros
mean(y)

#Operações entre vetores e escalares
#Não há escalar real no R, por isso as operações são naturalmente vetorizadas
v <- sample(10)
v
v + 100

v <- runif(10)
v

v > 0.5

v1 <- sample(10)
v2 <- sample(10)
v1
v2
v1 + v2

#Vetores com dimensões diferentes
#Vetor maior é múltiplo do menor
1:10
1:2
1:10 + 1:2

#Vetor maior NÃO é múltiplo do menor
1:10 + 1:3

#Reciclagem 
#De maneira implícita não pode ser feita
#tibble(x = 1:4, y = 1:2)

#De maneira explícita pode ser feita
tibble(x = 1:4, y = rep(1:2, 2))
tibble(x = 1:4, y = rep(1:2, each = 2))


#Vetores nomeados
c(x = 1, y = 2, z = 4)
vetor_nomeado = c(1,2,3)
vetor_nomeado
set_names(vetor_nomeado, c("a", "b", "c"))


#Subconjuntos
x <- c("one", "two", "three", "four", "five")
x

#Filtro por posição
x[c(3,2,5)]
x[c(1,1,5,5,5,2)]

#Eliminação por posição
#Não misturar negativo com positivo
x[c(-1,-3,-5)]


#Filtro lógico
x <- c(10,3,NA,5,8,1,NA)
x[!is.na(x)]
x[x %% 2 == 0]

#Filtro em vetor nomeado
x <- c(abc = 1, def = 2, xyz = 3)
x[c("xyz", "def")]
x["abc"]


# Vetores recursivos (listas) ---------------------------------------------

x <- list(1,2,3)
x

str(x)

x_named <- list(a = 1, b = 2, c = 3)
x_named
str(x_named)

#Valores heterogêneos
y <- list("a", 1L, 1.5, TRUE)
y
str(y)

#Lista de listas
z <- list(list(1,2),
          list(3,4))
str(z)
z

a <- list(a = 1:3,
          b = "a string",
          c = pi,
          d = list(1,-5))

str(a)

#Subconjuntos de listas
#Sublista [ -> Sempre retorna uma sublista
str(a[1:2])
str(a[4])
str(a[3])

#Componente único [[ -> Remove um nível de hierarquia
str(y[[1]])
str(y[[4]])
str(a[[1]])
str(a[[4]])
str(a[[4]][[1]])
str(a[[4]][[2]])

#Elementos nomeados $ -> funciona como [[ sem aspas
a$a
a[["a"]]
x_named$c
x_named[["c"]]

str(a$d[[2]])

#Atributos
x <- 1:10
str(x)

attr(x, "greeting")
x
attr(x, "greeting") <- "Hi!"
x
attr(x, "farewell") <- "Bye"

attributes(x)

str(x)


# Vetores aumentados ------------------------------------------------------
##Fatores
x <- factor(c("ab", "cd", "ab"),
             levels = c("ab", "cd", "ef"))

typeof(x)
attributes(x)
x

##Datas e horas
#Data
x <- as.Date("1971-01-01")


unclass(x)
typeof(x)
attributes(x)
x

#Data e hora
x <- lubridate::ymd_hm("1970-01-01 01:00")
unclass(x)
typeof(x)
attributes(x)
x

attr(x, "tzone") <- "US/Pacific"
x

attr(x, "tzone") <- "America/Sao_Paulo"
x

#Data e hora de listas nomeadas
y <- as.POSIXlt(x)
typeof(y)
attributes(y)

#Convertendo de volta de lt para data normal
lubridate::as_datetime(y)

##Tibbles
tb <- tibble::tibble(x = 1:5,
                     y = 5:1)
tb

typeof(tb)
attributes(tb)

##Data frame
df <- data.frame(x = 1:5,
                 y = 5:1)

df

typeof(df)
attributes(df)
