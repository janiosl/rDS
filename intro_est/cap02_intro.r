# Variáveis ---------------------------------------------------------------
a <- 2
b <- 2
a+b
c <- a+b


# Operações matemáticas ---------------------------------------------------
#Operações básicas
b+c
c-a
c*b

c/2

#Potência
c**b
c^b


#Raiz
#Raiz quadrada
sqrt(25)

#Cálculo direto
25**(1/2)
81**(1/2)
8**(1/3)
27**(1/3)


# Vetores -----------------------------------------------------------------
vetor <- c(1,3,5,7)
sum(vetor)
min(vetor)
max(vetor)

length(vetor)


# Repetições (loop) -------------------------------------------------------
for (i in 1:length(vetor)){
  print(i)
}


# Estruturas compostas - Data frame ---------------------------------------
#Dados de origem
receita <- c(100000,120000,110000,200000,230000)
despesa <- c(90000,150000,80000,140000,150000)

#Construção do data frame
resultados <- data.frame(ano=2020:2024,
                         receita=receita,
                         despesa=despesa)

#Exibição
resultados

resultados$receita
resultados$despesa

#Criar coluna calculada
resultados$lucro_bruto <- resultados$receita - resultados$despesa
head(resultados)

length(resultados)
length(resultados$ano)
nrow(resultados)


# Lógica condicional ------------------------------------------------------
lb <- 1

#Lógica simples (condição e alternativa)
if (lb>0){
  print("Empresa com lucro")
} else {
  print("Empresa sem lucro")
}


#Condições múltiplas
if (lb>0){
  print("Empresa com lucro")
} else if (lb==0) {
  print("Resultado neutro")
} else {
  print("Empresa com prejuízo")
}


#Exercício - Resolvido
#Criar uma coluna chamada resultado
#Preencher com "Lucro" ou "Sem lucro", conforme o valor da
#coluna lucro_bruto
resultados$resultado <- NA
resultados


resultados[1,]
resultados[,c("resultado")]
resultados[1,c("resultado")]
resultados$lucro_bruto[1]
resultados$resultado[1]

for (i in 1:nrow(resultados)){
  if (resultados$lucro_bruto[i]>0){
    r <- "Lucro"
  } else {
    r <- "Sem lucro"
  }
  resultados$resultado[i] <- r
}

resultados


#Exercício 1
#Criar uma coluna com vetor lógico (TRUE / FALSE) para existência de lucro
resultados$lucro <- resultados$lucro_bruto > 0
resultados

#Exercício 2
#Refazer o exercício resolvido usando a coluna lógica como referência
resultados$resultado <- NA #Zerar coluna
resultados

resultados$resultado[resultados$lucro == FALSE] = "Sem Lucro"
resultados$resultado[resultados$lucro == TRUE] = "Lucro"
resultados

#Exercício 3
#Refazer o exercício resolvido mudando as opções para "Lucro",
#"Neutro" e "Prejuízo"
resultados$resultado <- NA #Zerar coluna
resultados


#Exercício 4
#Criar uma coluna para verificar auemnto de receita de um ano para outro
resultados$aumento_rec <- NA
resultados

for (i in 2:nrow(resultados)) {
  if(resultados$receita[i] > resultados$receita[i-1]){
    resultados$aumento_rec[i] <- TRUE
  } else {
    resultados$aumento_rec[i] <- FALSE
  }
}

resultados


# Análises consolidadas e cumulativas ---------------------------------------------------
#Consolidados
sum(resultados$receita)
min(resultados$receita)
max(resultados$receita)

#Cumulativa
cumsum(resultados$receita)
diff(resultados$receita)

plot(as.ts(resultados$receita))
plot(as.ts(cumsum(resultados$receita)))

plot(as.ts(resultados$lucro_bruto), ylim=c(min(resultados$lucro_bruto)-10000,260000), col="green")
lines(resultados$receita, col="blue")
lines(resultados$despesa, col="red")
abline(h=0, lty=2)

legend(x="top", legend = c("Receita", "Despesa", "Lucro Bruto"), col=c("blue", "red", "green"), lty=1, bty="n")


# Trabalhando com arquivos ------------------------------------------------
#Definir diretório de trabalho
#Consultar diretório atual
getwd()
p="GitHub/rDS/intro_est"

setwd(dir = p)
getwd()

#Salvar dados como arquivo
arquivo = "resultados.csv"
write.csv(resultados,
          file = arquivo,
          row.names = FALSE)

#Carregar dados de arquivo
entrada <- "resultados.csv"
dados <- read.csv(file = entrada)
