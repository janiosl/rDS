#Trabalhando com strings

weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
subject = c("A", "B", "C", "D", "E", "F")

#Usando código estilo tradicional
mensagem <- rep("", length(subject))

for (i in 1:length(subject)) {
  mensagem[i] <- sprintf("The height of %s is %.2f. The weight of %s is %d.",
                         subject[i], height[i], subject[i], weight[i])
}

#Usando padrão de uso do R
#Apagar mensagem para realizar o código de forma mais eficiente
rm(mensagem)

mensagem <- sprintf("The height of %s is %.2f. The weight of %s is %d.",
                    subject, height, subject, weight)


#Trabalhando com fatores
pain = c(0, 3, 2, 2, 1)

#Converter vetor para fator - Variável categórica
fpain = factor(pain, levels=0:3)
levels(fpain) = c("none", "mild", "medium", "severe")

#Visualizar os níveis numericamente
as.numeric(fpain)

#Exemplo de fatores com condições
#Usando lógica de programação tradicional
lev <- rep("", length(height))

for (i in 1:length(height)) {
  if (height[i] < 1.7)
    lev[i] <- "short"
  else if (height[i] <1.9)
    lev[i] <- "medium"
  else
    lev[i] <- "tall"
}

#Conferir consumo de memória dos dois métodos
#install.packages(pryr)
library(pryr)
object_size(lev)
#Resultado: 264 B


#Usando operações de vetores e fatores R
#Separando os vetores em níveis
rm(lev)
lev <- cut(height,
           breaks=c(0, 1.7, 1.9, .Machine$double.xmax),
           ordered=TRUE)

#Criando nomeclatura para os níveis
levels(lev) <- c("short", "medium", "tall")

object_size(lev)
#Resultado: 728 B
