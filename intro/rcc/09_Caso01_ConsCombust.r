##==================================
##
##ANÁLISE DE CONSUMO DE COMBUSTÍVEL
##
##==================================
##Estudo baseado em: https://github.com/janiosl/python.ds/blob/master/estatistica/casoCarros_Consumo.ipynb
##Tutorial para reprodução do estudo em Python: https://youtu.be/PPaLUYeRlJc
##Estudo dos conceitos estatísticos empregados: https://youtu.be/yW5mqf7k82k

##==================================
##PREPARAÇÃO DO AMBIENTE
##==================================

#Configuração do diretório de trabalho
caminho <- "D:\\R\\R_Crash_Course"
setwd(caminho)

#Carga do conjunto de dados a partir do GitHub do PythonDS
arquivo <- 'https://raw.githubusercontent.com/janiosl/python.ds/master/data/mpg.csv'

library(readr)
carros <- read_csv(arquivo)


##==================================
##1 ANÁLISE PRELIMINAR DOS DADOS
##==================================
#Verficando primeiros registros
head(carros)

#Visualizando sumário estatístico
summary(carros)



##==================================
##1.1 CONSUMO DE COMBUSTÍVEL
##==================================
#Amplitude do consumo (milhas por galão na estrada)
max(carros$hwy) - min(carros$hwy)

library(tidyverse)
library(dbplyr)

#Agrupamento dos dados por fabricante
por_manuf <- carros %>% group_by(manufacturer)
por_manuf

##=============================================
#Uso do agrupamento para calcular consumo médio
##=============================================
c_mean <- summarise(.data=por_manuf, consumo=mean(hwy))
c_mean

#Visualização dos dados ordenados
c_mean <- c_mean[order(c_mean$consumo, decreasing = FALSE),]
c_mean

max(c_mean$consumo)
min(c_mean$consumo)

#Gráfico de barras
barplot(c_mean$consumo,
        col="lightsteelblue4",
        border = NA,
        beside = TRUE, 
        ylim = c(0, 35),
        width = 0.7,
        ylab = "Média de consumo na estrada",
        xlab = "Marcas",
        names = c_mean$manufacturer, 
        main = "Consumo médio por marcas (milhas por galão)")

##================================================
#Uso do agrupamento para calcular consumo mediano
##================================================
#Cálculo da mediana por marca
c_med <- summarise(.data=por_manuf, consumo=median(hwy))
#Ordenação
c_med <- c_med[order(c_med$consumo, decreasing = FALSE),]
c_med

#Identificação do maior consumo
max(c_med$consumo)


#Gráfico de barras
barplot(c_med$consumo,
        col="orange",
        border = NA,
        beside = TRUE, 
        width = 0.7, 
        ylim = c(0, 35),
        ylab = "Média de consumo na estrada",
        xlab = "Marcas",
        names = c_med$manufacturer, 
        main = "Mediana de consumo por marcas (milhas por galão)")


##==================================
##Análise da distribuição do consumo
##==================================
#Histograma do consumo
hist(carros$hwy,
     col="powderblue",
     main="Histograma de Consumo (Geral)",
     xlab="Faixas de consumo",
     ylab = "Quantidade de observações")

#Boxplot do consumo
boxplot(carros$hwy,
        ylab="Milhas por galão",
        main="Diagrama de caixa do consumo (geral)")



##==================================
##1.2 DETALHAMENTO DO MELHOR CONSUMO
##==================================
#Filtros por valores e uso de vetores lógicos para filtro
#Busca do valor gurgel no dataset
carros$manufacturer=="gurgel"

#Criação de um subset
c <- carros[1:5,c("manufacturer", "trans")]
c

#Aplicação de filtro baseado em vetor lógico
c[c(FALSE, TRUE, FALSE, TRUE, TRUE),]

#Filtrando apenas registros da marca Honda
honda <- carros[carros$manufacturer=="honda",]

#Conferindo os dados do subset
head(honda)
summary(honda)

#Análise das estatísticas básicas do consumo
#Simplificado
summary(honda$hwy)

#Manual
#Média
mean(honda$hwy)

#Amplitude do consumo
max(honda$hwy) - min(honda$hwy)


#Desvio padrão
sd(honda$hwy)

#Boxplot do consumo
boxplot(honda$hwy,
        ylab="Milhas por galão",
        main="Diagrama de caixa do consumo (Honda)")


##==================================
##1.3 EXERCÍCIOS
##==================================
#Crie um novo subconjunto de dados de consumo da marca Jeep.

#Calcule o consumo médio na cidade para esta marca, a amplitude e o desvio padrão deste consumo.
#Avalie se essas medidas indicam que a maioria dos modelos da
#marca tem consumo similar ou há grandes diferenças.

#Gere o gráfico Boxplot para este subconjunto de dados

#Avalie se a distribuição dos dados, baseada na análise do Boxplot,
#indica similaridades ou diferenças em relação ao conjunto completo de carros e à marca Honda


#TÓPICOS FUTUROS...
##===============================================
##2 RELAÇÃO ENTRE VARIÁVEIS DO CONJUNTO DE DADOS
##===============================================




##==================================
##3 MODELO DE REGRESSÃO LINEAR
##==================================



##==============================================================
##3.1 Criação e treinamento do modelo de aprendizado de máquina
##==============================================================




##==============================================================
##3.2 Aplicação do modelo para visualização da Regressão Linear
##==============================================================



##==============================================================
##3.3 Previsão e avaliação do modelo
##==============================================================

