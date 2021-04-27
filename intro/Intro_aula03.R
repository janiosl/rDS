#Listas
#Vetores para criação da lista
weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
bmi <- weight / (height^2)

#Criação da lista
myexp <- list(weight, height, bmi)

#Slicing
slice <- myexp[1]
slice <- myexp[c(1, 3)]

#Acesso
h <- myexp[[1]]

#Nomes de variáveis com .
#Estas variáveis não tem nenhuma relação entre si
intake.pre = c(5260, 5470, 5640, 6180, 6390,
               + 6515, 6808, 7515, 7515, 8230, 8770)

intake.post = c(3910, 4220, 3885, 5160, 5645,
                + 4680, 5265, 5975, 6790, 6900, 7335)

#Criação normal de uma lista a partir dos vetores
mylist <- list()
mylist[[1]] <- intake.pre
mylist[[2]] <- intake.post


#Criação de uma lista com atributos
mylist = list(before=intake.pre, after=intake.post)

#Acessar elementos pelos atributos
mylist$before
mylist$after

#Exercício
#1 - Criar lista com elementos individuais de intake.pre e intake.post
list_pre <- c(intake.pre)
list_post <- c(intake.post)
ex_list <- list(pre=list_pre, post=list_post)

#2 - Filter on first list, elements between 6000 and 7000
#Forma errada - fiz baseada na leitura dos valores para identificar a posição
ex_list[[1]][c(4:7)]

#Verificar uma forma lógica (filtrando o conteúdo e não a posição)
ex_list$pre[ex_list$pre > 6000 & ex_list$pre < 7000]

#Vetor booleano
#Checar valor de um vetor com expressão lógica
intake.pre > 7000

#Checar valores nas posições
intake.pre[c(1, 3)]

#Criar vetor booleano
bool <- intake.pre > 7000

#Usar vetor booleano para filtrar valores
intake.pre[bool]
intake.post[bool]

#Usar a expressão diretamente
intake.post[intake.pre > 7000]
intake.post[intake.pre > 7000 | intake.pre < 6000] #Conditional operator OR
intake.post[intake.pre > 6000 & intake.pre < 7000] #Conditional operator AND

#Trabalhando com dataframe
d = data.frame(intake.pre, intake.post)

#Recuperando valores do dataframe
d[1, 1] #Filter by a column and a row (col 1, row 1)
d$intake.pre[5] #Filter by a value in a vetor
d[intake.pre > 7000 | intake.pre < 6000,] #Filter by logic expression
d[intake.pre > 7000 | intake.pre < 6000, 1] #Filter by logic expression and using a defined column
d[intake.pre > 7000 | intake.pre < 6000, c(1, 2)] #Filter by logic expression and using a defined column
d[intake.pre > 7000 | intake.pre < 6000, c("intake.pre", "intake.post")] #Filter by logic expression and using a defined column by its name

#Exercício
#Create a data frame based on weight and height used on previous classes
dHealth = data.frame(height, weight)
dHealth

#Filter the data frame between 1.7 and 1.9 (height)
dFilter = dHealth[dHealth$height > 1.7 & dHealth$height < 1.9, ]
dFilter


#Compute the bmi for filtered data frame and add this attribute on data frame
dFilter["bmi"] <- dFilter$weight / (dFilter$height^2)
dFilter

#Outra solução
dHealth["bmi"] <- 0
dHealth$bmi[dHealth$height <= 1.7 | dHealth$height >= 1.9] <- NaN
