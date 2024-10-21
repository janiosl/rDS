#install.packages("forcats")
library(tidyverse)
library(forcats)

#Exemplo
#Caracteres simples (sem fatores)
x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar")
sort(x1)

#Uso de fatores
#Preparar níveis
month_levels <- c(
  "Jan", "Fev", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

#Criar um fator
y1 <- factor(x1, levels = month_levels)
y1
sort(y1)

#Criar um fator com algum valor inválid
y2 <- factor(x2, levels = month_levels)
y2
sort(y2)

#Verificar erros explicitamente
parse_factor(x2, levels = month_levels)

#Usar ordem original como levels
x3 <- c("AAA", "AA", "A",
        "BBB", "BB", "B",
        "A", "BB", "AAA", "B")

y3 <- factor(x3, levels = unique(x3))
y3
sort(y3)

