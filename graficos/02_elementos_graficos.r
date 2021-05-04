##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#ELEMENTOS GRÁFICOS - ATRAVÉS DA DESCONTRUÇÃO PASSO A PASSO

##====================================================================

data("anscombe")
dados <- anscombe


##============================================
##REMOVENDO ELEMENTOS DO GRÁFICO
##============================================
plot(dados$x1, dados$y1)


#Modificando o tipo
#Pontos e linhas
plot(dados$x1, dados$y1, 
     type = "b", 
     xlab = "", ylab = "")


#Gráfico "vazio" - Remove pontos
plot(dados$x1, dados$y1, 
     type = "n", 
     xlab = "", ylab = "")

#Remove eixos
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n")

#Remove a caixa ao redor do gráfico
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")
