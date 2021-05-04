##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS PERSONALIZADOS

##====================================================================


##===================================================
##MATPLOT - Gráfico de matriz, gráfico de interação
##===================================================

install.packages("AICcmodavg")
require(AICcmodavg) 
data(iron) 
str(iron)

dados <- tapply(iron[, 3], list(iron[, 1], iron[, 2]), mean)
dados

#Gráfico de interação entre variáveis
matplot(dados, 
        type = "b",
        xlim = c(0.8, 3.2), ylim = c(1, 5), 
        lty = 3,
        lwd = 1,
        pch = c(15, 19, 17),
        col = "black",
        xaxt = "n",
        xlab = "Tipo de panela", ylab = "Quantidade de ferro (mg/100g)")

axis(side = 1, 
     at = 1:3,
     labels = c("Alumínio", "Barro", "Ferro"))

legend("topleft",
       legend = c("Legumes", "Carne", "Vegetais"),
       pch = c(15, 19, 17),
       bty = "n",
       inset = 0.04,
       title = "Tipo de alimento")




##===================================================
##GRÁFICO DE PONTOS COM BARRAS DE ERRO
##===================================================
data(InsectSprays) 
str(InsectSprays)

dados <- tapply(InsectSprays$count, InsectSprays$spray, mean) 
dados

dados_sd <- tapply(InsectSprays$count, InsectSprays$spray, sd) 
dados_sd


#Gráfico vazio para definir limites
plot(1:6, dados, 
     type = "n", 
     xaxt = "n",
     ylim = c(0, 25), xlim = c(0.5, 6.5),
     bty = "l",
     xaxs = "i", yaxs = "i",
     ylab = "Número de insetos encontrados", xlab = "Inseticidas", 
     las = 1,
     main = "Eficácia de inseticida")

axis(side = 1, 
     at = 1:6,
     labels = rownames(dados))


#Construção do gráfico
require(plotrix)

plotCI(1:6, dados, 
       uiw = dados_sd,
       add = TRUE,
       pch = 19,
       lwd = 0.5)



##===================================================
##GRÁFICO DE LINHAS COM DUAS ESCALAS
##===================================================
data(airquality) 
dados <- airquality
str(dados)


#Gráfico com dados na primeira escala
op <- par(mar = c(3, 4, 4, 4))

plot(dados$Temp, type = "l",
     lty = 3,
     ylim = c(30, 100),
     lwd = 1.4,
     xaxt = "n",
     ylab = "Temperatura (F)", xlab = "")


#Transformação do eixo x de contínuo para categórico
axis(side = 1,
     at = c(1, cumsum(table(dados[, 5]))), 
     label = c("M", "J", "J", "A", "S", "O"))


#Criação do novo gráfico sobreposto ao primeiro
op <- par(new = TRUE)

plot(dados$Ozone, 
     type = "l",
     xlab = "", ylab = "",
     yaxt = "n", xaxt = "n",
     lty = 1)

#Adicionando o novo eixo
axis(side = 4, las = 3)

mtext(text = "Ozônio (ppb)", 
      side = 4,
      las = 0,
      line = 3)


#Adicionando título e legenda
title(main = "New York", line = 1.5)

title(main = "1973", line = 0.5,
      cex = 0.8,
      font.main = 1)

legend("topleft",
       legend = c("Temperatura", "Ozônio"), 
       lty = c(3, 1),
       lwd = c(1.4, 1),
       bty = "n",
       ncol = 2)

par(op) # Resetar parâmetros gráficos
