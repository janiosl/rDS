#==========================
#Meu primeiro Script R
#==========================

print("Ol� R")

#Cria��o de vari�veis
numero1 <- 2
numero2 <- 7

#Execu��o das opera��es aritm�ticas b�sicas
#Resultados armazenados em vari�veis
soma <- numero1 + numero2
dife <- numero1 - numero2
mult <- numero1 * numero2
divi <- numero1 / numero2

#Exibi��o dos resultados
print(soma)
print(dife)
print(mult)
print(divi)

#Outras opera��es
#Resultados exibidos no console
#Exponencia��o (** ou ^ executam a mesma opera��o)

#Eleva��o ao quadrado
numero1 ** 2
numero1 ^ 2

numero2 ** 2
numero2 ^ 2

#Eleva��o ao cubo
numero1 ** 3
numero1 ^ 3

numero2 ** 3
numero2 ^ 3

#Raiz quadrada
sqrt(numero1)
sqrt(numero2)

#Opera��es com conjuntos de dados
#Cria��o de um vetor de inteiros
dados <- c(1, 2, 3, 4)

#C�lculo de medidas dos dados
mean(dados)   #M�dia
sd(dados)     #Desvio padr�o
sum(dados)    #Soma dos dados
min(dados)    #Valor m�nimo
max(dados)    #Valor m�ximo
length(dados) #Contagem de itens
