##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#PAINÉIS GRÁFICOS

##====================================================================


##===================================================
##PARES GRÁFICOS
##===================================================
data(iris)
dados <- iris[, 1:4] 
str(dados)

#Função para preenchimento de dados adicionais do painel
panel.cor <- function(x, y, ...) {
  par(usr = c(0, 1, 0, 1))
  res <- cor.test(x, y, ...)
  txt <- as.character(round(res$estimate, 2)) 
  txt2 <- paste("p =", round(res$p.value, 3)) 
  text(0.5, 0.7, txt, cex = 2)
  text(0.5, 0.25, txt2, cex = 1.5)
}

#Função para criação de gráficos de histograma na diagonal do painel
panel.hist <- function(x, ...) {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts
  y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "black", border = "white", ...)
}

pairs(dados,
      upper.panel = panel.cor, 
      diag.panel = panel.hist)


##===================================================
##PAINÉIS
##===================================================
#Painel simples 2x2
op <- par(mfrow = c(2, 2), #Define conjunto de gráficos 2x2
          las = 1)

plot(anscombe$x1, anscombe$y1, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x2, anscombe$y2, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x3, anscombe$y3, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x4, anscombe$y4, xlim = c(0, 20), ylim = c(0, 14))

par(op) # Restaurar parâmetros gráficos originais.

#Painel ajustando margens entre os gráficos
op <- par(mfrow = c(2, 2), 
          las = 1, 
          mar = c(4, 4, 0.5, 0.5),  #Margem interna
          oma = c(1, 1, 2.5, 1))    #Margem externa

plot(anscombe$x1, anscombe$y1, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x2, anscombe$y2, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x3, anscombe$y3, xlim = c(0, 20), ylim = c(0, 14)) 
plot(anscombe$x4, anscombe$y4, xlim = c(0, 20), ylim = c(0, 14))

par(op) # Restaurar parâmetros gráficos originais.


##===================================================
##SUBGRÁFICOS
##===================================================
#Gráfico principal
curve(dnorm(x, 20, 1), 
      from = 10, to = 25, 
      ylab = "Densidade probabilística", xlab = "Valor de x",
      main = "Distribuição Normal - Média 20; SD = 1",
      cex.main = 0.8)

#Configuração do espaço para o subgráfico
op <- par(fig = c(0.3, 0.55, 0.6, 0.8), 
          new = TRUE, 
          mar = c(0, 0, 0, 0))

#Gráfico secundário
curve(pnorm(x, 20, 1), 
      from = 15, to = 25, 
      xlab = "", ylab = "", 
      xaxt = "n", yaxt = "n")

axis(1, at = c(16, 24))
axis(2, at = c(0, 1))

par(op) # Resetar parâmetros gráficos

