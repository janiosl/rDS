#========================================
#Compara��es l�gicas em R
#========================================

#Cria��o de vari�veis para compara��o
a <- 2
b <- 3
c <- 5

#Compara��o de igualdade e desigualdade
a == b   #Verifica se os valores s�o iguais
a == 2   #Verifica se os valores s�o iguais
a != b   #Verifica se os valores s�o diferentes
c == a+b #Verifica se c � igual � soma de a+b
a == c-b #Verifica se a � igual � diferen�a c-b
a+b != 5 #Verifica se a soma de a+b � diferente de c


#Compara��o de "menor que" e "menor ou igual"
a < b  #Verifica se a � menor que b
a <= b #Verifica se a � menor ou igual a b
a <= 2 #Verifica se a � menor ou igual a 2

#Compara��o de "maior que" e "maior ou igual"
c > 2
c >= b
b > c


#Cl�usula OU
#Retorna TRUE se qualquer uma das express�es for verdadeira
a < b | a+b == c
a > b | a+b == c
a > b | a+b != c

#Cl�usula E
#Retorna TRUE apenas se ambas express�es forem verdadeira
a > b && a+b != c
a < b && a+b == c
a > b && a+b == c
