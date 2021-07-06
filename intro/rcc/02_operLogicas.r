#========================================
#Comparações lógicas em R
#========================================

#Criação de variáveis para comparação
a <- 2
b <- 3
c <- 5

#Comparação de igualdade e desigualdade
a == b   #Verifica se os valores são iguais
a == 2   #Verifica se os valores são iguais
a != b   #Verifica se os valores são diferentes
c == a+b #Verifica se c é igual à soma de a+b
a == c-b #Verifica se a é igual à diferença c-b
a+b != 5 #Verifica se a soma de a+b é diferente de c


#Comparação de "menor que" e "menor ou igual"
a < b  #Verifica se a é menor que b
a <= b #Verifica se a é menor ou igual a b
a <= 2 #Verifica se a é menor ou igual a 2

#Comparação de "maior que" e "maior ou igual"
c > 2
c >= b
b > c


#Cláusula OU
#Retorna TRUE se qualquer uma das expressões for verdadeira
a < b | a+b == c
a > b | a+b == c
a > b | a+b != c

#Cláusula E
#Retorna TRUE apenas se ambas expressões forem verdadeira
a > b && a+b != c
a < b && a+b == c
a > b && a+b == c
