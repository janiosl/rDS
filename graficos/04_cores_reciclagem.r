##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#CORES E RECICLAGEM

##====================================================================
dados <- data.frame(x = 1:10, y = 1:10, fator = as.factor(rep(c("A", "B"), each = 5)))
str(dados)

#Gráfico básico inicial
plot(dados$x, dados$y, 
     pch = 19, 
     col = "black")

#Uso de cores diferentes para observações
plot(dados$x, dados$y, 
     pch = 19, 
     col = c("black", "black", 
             "deeppink", "deeppink",
             "grey", "grey",
             "blue", "blue",
             "red", "red"))


#Adaptação "automática" das cores disponíveis aos dados
plot(dados$x, dados$y, 
     pch = 19, 
     col = c("black", "red"))


#Cores definidas com base no valor de uma variável
plot(dados$x, dados$y, 
     pch = 19, 
     col = dados$y)


#Cores definidas de acordo com uma classe (variável categórica)
plot(dados$x, dados$y, 
     pch = 19, 
     col = dados$fator)


#Mudança das características do símbolo (tamanho) de acordo com escla de uma variável
require(scales)

plot(dados$x, dados$y, 
     pch = 19, 
     col = dados$fator,
     cex = scales::rescale(dados$x, 
                           to = c(0.5, 2.5)))

