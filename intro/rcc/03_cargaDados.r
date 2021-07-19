##=========================================
#Configuração inicial (diretório e arquivo)
##=========================================
caminho <- "D:\\R\\R_Crash_Course"
setwd(caminho)
arquivo <- "Dados_EB.xls"


##=========================================
#Carga simples de dados
##=========================================
library(readxl)
dados <- read_excel(arquivo)

#Visualização simplificada dos dados
dados

#Visualização das primeiras linhas
head(dados)

#Visualização tabular dos dados
View(dados)


##=========================================
#Lidando com problemas na carga
##=========================================
#Definição da planilha a ser carregada
dados <- read_excel(arquivo, sheet="Tabela 2.1")

#Pular linhas sem conteúdo
dados <- read_excel(arquivo, sheet="Tabela 2.1", skip=1)

#Nomear colunas
colnames(dados2) <- c("estado_civil", "grau_instrucao", "n_filhos", "salarios", "idade_anos", "idade_meses", "regiao_procedencia")

#Eliminando colunas desnecessárias
dados$N <- NULL


##=========================================
#Analisando dados carregados
##=========================================
#Acessando um coluna dos dados
dados$estado_civil
dados$grau_instrucao

#Realizando cálculos em colunas
mean(dados$n_filhos)
mean(dados$salarios)

#Tratando dados ausentes
mean(dados$n_filhos, na.rm = TRUE)


##=========================================
#Carga com planilha já tratada previamente
##=========================================
arquivo2 <- "info_time.xlsx"
dados2 <- read_excel(arquivo2)
colnames(dados2) <- c("estado_civil", "grau_instrucao", "n_filhos", "salarios", "idade_anos", "idade_meses", "regiao_procedencia")

View(dados2)

