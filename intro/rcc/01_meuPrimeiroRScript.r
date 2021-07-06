#==========================
#Meu primeiro Script R
#==========================

print("Olá R")

#Criação de variáveis
numero1 <- 2
numero2 <- 7

#Execução das operações aritméticas básicas
#Resultados armazenados em variáveis
soma <- numero1 + numero2
dife <- numero1 - numero2
mult <- numero1 * numero2
divi <- numero1 / numero2

#Exibição dos resultados
print(soma)
print(dife)
print(mult)
print(divi)

#Outras operações
#Resultados exibidos no console
#Exponenciação (** ou ^ executam a mesma operação)

#Elevação ao quadrado
numero1 ** 2
numero1 ^ 2

numero2 ** 2
numero2 ^ 2

#Elevação ao cubo
numero1 ** 3
numero1 ^ 3

numero2 ** 3
numero2 ^ 3

#Raiz quadrada
sqrt(numero1)
sqrt(numero2)

#Operações com conjuntos de dados
#Criação de um vetor de inteiros
dados <- c(1, 2, 3, 4)

#Cálculo de medidas dos dados
mean(dados)   #Média
sd(dados)     #Desvio padrão
sum(dados)    #Soma dos dados
min(dados)    #Valor mínimo
max(dados)    #Valor máximo
length(dados) #Contagem de itens
