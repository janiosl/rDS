##==================================================================
##Carga de dados de arquivos CSV
##Este estudo é uma continuação do código abaixo:
## https://github.com/janiosl/rDS/blob/main/intro/rcc/03_cargaDados.r
##==================================================================

##==============================
#Carga dos dados
##==============================
#Endereço do arquivo na internet
arquivo <- "https://github.com/janiosl/python.ds/raw/master/data/petroleo.csv"

#O endereço acima pode ser substituído pelo nome de um arquivo local
#Para isso é preciso configurar o diretório de trabalho atual

#Leitura do arquivo CSV
dados <- read.csv(arquivo)


##==============================
#Conferência e análise dos dados
##==============================
#Conferência dos dados carregados
View(dados)

#Análise e tratamento dos dados
mean(dados$INFLACAO)
sum(dados$CUSTO_PETROLEO)
dados$DATA <- NULL