caminho <- "D:\\R\\R_Estatistica_Basica"
setwd(caminho)

library(readxl)

##===============
#Loading dataset
##===============
#Arquivo gerado a partir de: https://www.ime.usp.br/~pam/Dados_EB.xls
#Tabela constante na aba/planilha: Tabela 2.1
#Para uso basta salvar esta aba/planilha como um novo arquivo ou adaptar o código abaixo
arquivo <- "Tabela_21.xlsx"
tab2_1 <- read_excel(arquivo)
colnames(tab2_1) <- c("estado_civil", "grau_instrucao", "n_filhos",
                     "salarios", "idade_anos", "idade_meses", "regiao_procedencia")

names(tab2_1)

##================================
#Simple analysis and aggregations
##================================
summary(tab2_1)

library(tidyverse)
library(dbplyr)
por_gi <- tab2_1 %>% group_by(grau_instrucao)
summarise(.data=por_gi, idade_media=mean(idade_anos))
summarise(.data=por_gi, salarios_media=mean(salarios))


#Creating frequency tables

#Education
ni <- table(tab2_1$grau_instrucao)
fi <- prop.table(ni)
p_fi <- 100*prop.table(ni)

ni <- c(ni, sum(ni))
fi <- c(fi, sum(fi))
p_fi <- c(p_fi, sum(fi))

names(ni)[4] <- "Total"

tab2_2 <- cbind(ni,
                fi=round(fi, digits = 2),
                p_fi=round(p_fi, digits = 2))
tab2_2

tab2_3<-as.data.frame(
  t(rbind(
    ni=c(650,1020,330,2000),
    p_fi=c(32.5,51,16.5,1)
  ))
  ,row.names =c("Fundamental","Médio","Superior","Total")
)

tab2_3


#Salary  
ni<-table(cut(tab2_1$salarios, breaks = seq(4,24,by=4),right=FALSE)) # Frequencias por categorias

tab2_4 <- rbind(ni, p_fi = 100*prop.table(ni)) # Frequencias relativas em %


tab2_4 <- as.data.frame(
  t(cbind(
    tab2_4,
    c(sum(tab2_4[1,]),sum(tab2_4[2,])
    ))),row.names =c(colnames(tab2_4),"Total")) #Construcao da tabela

tab2_4<-transform(tab2_4,p_fi=round(p_fi,digits=2))

tab2_4

##===============
#CHARTS
##===============

#Bar chart of employees education
barplot(tab2_2[1:3,1],
        main = "Grau de Instrução dos Empregados",
        ylim = c(0,25),
        ylab = "Quantidade de empregados",
        xlab = "Grau de Instrução",
        col = c("lightsteelblue", "lightsteelblue4", "lightsteelblue"),
        las = 1,
        border=NA)


#Sector chart of employees education
labs<-paste(1:3,"(",tab2_2[1:3,1],";",round(tab2_2[1:3,3],1),"%)",sep="")
pie(table(tab2_1$grau_instrucao),
    labels=labs,
    col = c("powderblue", "lightsteelblue4", "lightsteelblue"),
    main="Gráfico de setores para Y: Grau de instrução",
    border=NA
    )

legend(-1.1,-0.8,legend=c("1=Fundamental, 2=Médio, 3=Superior"),border=NA,box.col=NA)


#Bar chart of number of children
barplot(
  table(tab2_1$n_filhos),
  ylab="Frequência",
  cex.names=0.7,
  col="powderblue",
  main="Figura 2.4: Gráfico em barras para a variável Z: Numero de filhos.",
  border=NA,
  xlab = "Número de filhos")


#Histogram of employees salaries
hist(tab2_1$salarios,
  col = "lightsteelblue4",
  main = "Histograma da variável Salário",
  xlab = "Salário",
  ylab = "Frequência")


#Histogram of number of children
hist(tab2_1$n_filhos,
     col = "powderblue",
     main = "Histograma da variável Salário",
     xlab = "Salário",
     ylab = "Frequência")


#Exemplo de análise de dados

#Carregar "Área de trabalho" -> Dados anteriores para o ambiente atual
#Dados disponíveis em https://www.ime.usp.br/~pam/dados.RData
load("dados.RData")

#Conferência dos dados
head(cd_notas)

summary(cd_notas)

#Histograma
hist(cd_notas$nota,
     col = "lightsteelblue4",
     xlab = "Notas", ylab = "Frequência",
     border = "white",
     main = "Histograma para o CD-Notas")

#Gráfico de dispersão unidimensional
stripchart(cd_notas$nota,
           method = "stack", offset = 2, at=0,
           pch = 19, col="lightsteelblue4",
           ylab = NA,
           cex = 0.5,
           main = "Gráfico de dispersão unidimensional para CD-Notas")

#Diagrama (textual) de ramos e folhas
stem(cd_notas$nota)


#Conferência dos dados
head(cd_poluicao)
summary(cd_poluicao)

#Plot time series
plot.ts(cd_poluicao$temp,
     xlab = "Tempo (dias)", ylab = "Temperatura",
     main = "Série temporal de temperatura em SP"
     )


#Histograma
hist(cd_poluicao$temp,
     col = "lightsteelblue4",
     xlab = "Temperatura", ylab = "Frequência",
     border = "white",
     main = "Histograma para temperatura em SP")

#Gráfico de dispersão unidimensional
stripchart(cd_poluicao$temp,
           method = "stack", offset = 2, at=0,
           pch = 19, col="lightsteelblue4",
           ylab = NA,
           cex = 0.5,
           main = "Histograma para temperatura em SP")

