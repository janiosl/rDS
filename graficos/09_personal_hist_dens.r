##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS PERSONALIZADOS

##====================================================================


##===================================================
##HISTOGRAMA
##===================================================

data(faithful) 
dados <- faithful
str(dados)

hist(dados$waiting, 
     las = 1,
     col = "black",
     border = "white")



hist(dados$waiting, 
     las = 1,
     col = "black",
     border = "white",
     breaks = c(40, 50, 60, 70, 80,90, 100),
     xlab = "Tempo de espera (m)", ylab = "Frequência", 
     main = "")

#Personalização dos limites das classes
hist(dados$waiting, 
     las = 1,
     col = "black",
     border = "white",
     breaks = c(40, 50, 60, 70, 80,90, 100),
     xlab = "Tempo de espera (m)", ylab = "Frequência", 
     main = "")


op <- par(yaxs = "i")

hist(dados$waiting, las = 1,
     col = "black",
     border = "white",
     breaks = c(40:100),
     xlab = "Tempo de espera (m)", ylab = "Frequência", 
     main = "Old Faithful")

box(bty = "l")

par(op) # Resetar parâmetros gráficos


#Histograma com densidades
hist(dados$waiting, 
     prob = TRUE,
     las = 1,
     xlab = "Tempo de espera (m)", ylab = "Densidade",
     main = "Old Faithful")

lines(density(dados$waiting), 
      lwd = 4)

box(bty = "l")
