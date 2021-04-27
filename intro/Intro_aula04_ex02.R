intake.pre = c(5260, 5470, 5640, 6180, 6390,
               + 6515, 6808, 7515, 7515, 8230, 8770)

intake.post = c(3910, 4220, 3885, 5160, 5645,
                + 4680, 5265, 5975, 6790, 6900, 7335)

d = data.frame(intake.pre, intake.post)

#Ordenação de valores
d$intake.pre
sort(d$intake.pre)

d$intake.post
sort(d$intake.post)

#Exibir a ordem dos valores do vetor
order(d$intake.post)
#Armazenar a ordem
o <- order(d$intake.post)

#Usar a ordem para ordenar/exibir outro vetor
d$intake.pre[o]

#Create new data frame ordered by o
d.sorted = d[o,]
d.sorted

#Exercise
#Create a data frame based on weight and height
weight = c(60, 72, 57, 90, 95, 72)
height = c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
d_ex = data.frame(weight, height)

#Sort it according to the weight
oW = order(d_ex$weight)
oW

d_ex2 = d_ex[oW, ]
d_ex2
