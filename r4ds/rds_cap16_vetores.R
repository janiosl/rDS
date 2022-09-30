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

x[c(3,2,5)]
x[c(1,1,5,5,5,2)]

