##==================================================================
##Carga de dados de arquivos CSV
##Este estudo � uma continua��o do c�digo abaixo:
## https://github.com/janiosl/rDS/blob/main/intro/rcc/03_cargaDados.r
##==================================================================

##==============================
#Carga dos dados
##==============================
#Endere�o do arquivo na internet
arquivo <- "https://github.com/janiosl/python.ds/raw/master/data/petroleo.csv"

#O endere�o acima pode ser substitu�do pelo nome de um arquivo local
#Para isso � preciso configurar o diret�rio de trabalho atual

#Leitura do arquivo CSV
dados <- read.csv(arquivo)


##==============================
#Confer�ncia e an�lise dos dados
##==============================
#Confer�ncia dos dados carregados
View(dados)

#An�lise e tratamento dos dados
mean(dados$INFLACAO)
sum(dados$CUSTO_PETROLEO)
dados$DATA <- NULL