x <- 2 #variable assignment
x #variable evaluation

y <- 1
x + y
z <- x + y

is.numeric(x)

weight = c(60, 72, 57, 90, 95, 72) #vector with six observations

weight[1]
weight[6]
length(weight)

height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)

#imc calculation
weight[1]/(height[1]^2)

#Código usando padrão de linguagens tradicionais (C, Java, Python, etc.)
bmi <- rep(0, length(weight)) #Cria um vetor com 6 observações de valor 0

for (i in 1:length(weight)) {
  bmi[i] <- weight[i]/(height[i]^2)
}

#Código usando padrão R - mais objetivo e eficiente
bmi <- weight / (height^2)

#Código usando padrão de linguagens tradicionais (C, Java, Python, etc.)
soma <- 0
for (i in 1:length(bmi)) {
  soma <- soma + bmi[i]
}
media <- soma / length(bmi)

#Código usando padrão R - mais objetivo e eficiente
#Funções estatísticas básicas
mean(bmi)
sd(bmi)

#Gráficos
#Plotando os pontos de altura e peso
plot(height, weight)

#Calculando e plotando uma linha de imc
hh = c(1.65, 1.7, 1.75, 1.8, 1.85, 1.9)
lines(hh, 22.5 * hh^2)

#EXERCÍCIO
#Fórmula de desvio padrão
#Raiz quadrada do somatório das observações - média ao quadrado, dividido por n-1

#Calcular desvio padrão com loop
soma <- 0
for (i in 1:length(bmi)) {
  soma <- soma + (bmi[i] - (media))^2
}
desvio = sqrt(soma / (length(bmi)-1))
desvio

#Calcular desvio padrão com operações de vetores
desvioR = sd(bmi)
desvio

#Teste deve ser feito quando a distribuição é normal
t.test(bmi, mu=22.5)

t.test(bmi, mu=15)

#Vetores nomeados
x = c(A=10, B=NA, C=13)

#Cálculo com valores NA retorna valor ausente
mean(x)

#Alteração de parâmetros para desconsiderar valores ausentes
mean(x, na.rm=TRUE)

names(x)

x["B"] <- 3

#Operação por escalar do velor
x["B"] * x

#Alterar nomes dos vetores
names(x) = c("red", "green", "blue")

#Carregar pacotes
require(ggplot2)
library(ggplot2)

#Instalar pacotes
install.packages("ggplot2")
install.packages("TSPred")
install.packages("STMotif")