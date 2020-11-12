#Trabalhando com arquivos
wine = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
                  header = TRUE,
                  sep = ",")


head(wine)

#Salvar dados no formato RData
setwd("your path")
getwd()

save(wine, file="wine.RData")

#Testando arquivo salvo
rm(wine)

#Carregar arquivo
load("wine.RData")
View(wine)

#Gravar um dataframe no formato csv
write.table(wine, file="wine.csv", row.names = FALSE, quote = FALSE)


#Exercise
#Create a data frame from the weight and height dataset
#Create a data frame based on weight and height
weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
health = data.frame(weight, height)

#Save it in RData, CSV and RDS
#RData
save(health, file="health.RData")

#CSV
write.table(health, file="health.csv", row.names=FALSE, quote=FALSE, sep=",")

#RDS
saveRDS(health, file="health.rds")
#Consultar a forma de uso da função abaixo
#write_rds(health, path="health.rds")


#Read saved RDS, RData and CSV
load("health.RData")
h = read.csv("health.csv")
hRDS = readRDS("health.rds")

#Conferência
View(health)
View(h)
View(hRDS)

#Leitura/criação de tabela a partir de string simples
data <- read.table(text = "Year Months Flights Delays
                   2016 Jan-Mar 11 6
                   2016 Apr-Jun 12 5
                   2016 Jul-Sep 13 3
                   2016 Oct-Dec 12 5
                   2017 Jan-Mar 10 4
                   2017 Apr-Jun 9 3
                   2017 Jul-Sep 11 4
                   2017 Oct-Dec 25 15
                   2018 Jan-Mar 14 3
                   2018 Apr-Jun 12 5
                   2018 Jul-Sep 13 3
                   2018 Oct-Dec 15 4",
                   header=TRUE, sep="")

View(data)

data$OnTime <- data$Flights - data$Delays
data$Perc <- round(100 * data$Delays / data$Flights)

create_dataset <- function() {
  #Função apenas cria o dataset de voos
  data <- read.table(text = "Year Months Flights Delays
                   2016 Jan-Mar 11 6
                   2016 Apr-Jun 12 5
                   2016 Jul-Sep 13 3
                   2016 Oct-Dec 12 5
                   2017 Jan-Mar 10 4
                   2017 Apr-Jun 9 3
                   2017 Jul-Sep 11 4
                   2017 Oct-Dec 25 15
                   2018 Jan-Mar 14 3
                   2018 Apr-Jun 12 5
                   2018 Jul-Sep 13 3
                   2018 Oct-Dec 15 4",
                     header=TRUE, sep="")
  
  data$OnTime <- data$Flights - data$Delays
  data$Perc <- round(100 * data$Delays / data$Flights)
  
  return(data)
}

data <- create_dataset()
head(data)
