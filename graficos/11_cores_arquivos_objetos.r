##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#TÓPICOS EXTRA

##====================================================================

##===================================================
##Cores
##===================================================

#Dados de exemplo
set.seed(100)
dados <- data.frame(x = runif(50))
dados$y <- cos(dados$x)
str(dados)

# Definir 100 intervalos entre o mínimo e máximo da variável x
intervalos <- seq(min(dados$x, na.rm = TRUE), 
                  max(dados$x, na.rm = TRUE), 
                  length.out = 100)

str(intervalos)


require(fields)
require(RColorBrewer)

# Definir uma cor para cada um dos intervalos previamente definidos
cores <- two.colors(length(intervalos), start = "blue", end = "red", middle = "green")
str(cores)


# Variável x é categorizada em um dos intervalos previamente definidos
quaisintervalos <- findInterval(dados$x, 
                                intervalos)


#Aplicação
plot(dados$x, dados$y, 
     pch = 19,
     col = cores[quaisintervalos])

# A legenda ocupará toda a área definida pelo argumento fig
op <- par(fig = c(0.82, 0.85, 0.5, 0.75), 
          new = TRUE, 
          mar = c(0,0,0,0))

# Opções para escala de cores na orientação vertical. 
# Ver próximo bloco de códigos para orientação horizontal.
# As próximas 7 linhas do comando não precisam ser alteradas para uma legenda vertical
nl <- length(intervalos)
nc <- 1
image(nc, intervalos, matrix(intervalos, nc, nl), 
      col = cores,
      xlab = "", ylab = "",
      xaxt = "n", yaxt = "n", 
      add = FALSE)

# Adicionar eixos
axis(2, at = c(0.2, 0.8))

# Adicionar título. Como a margem foram removidas, a função mtext é usada neste caso.
mtext("Escala") 

par(op) # Resetar parâmetros gráficos


#Mesmo gráfico com a legenda de cores na horizontal
plot(dados$x, dados$y, 
     pch = 19,
     col = cores[quaisintervalos])

op <- par(fig = c(0.2, 0.5, 0.32, 0.35), 
          new = TRUE, 
          mar = c(0,0,0,0))

# Opções para escala de cores na orientação hoziontal. 
# Ver bloco anterior de código para orientação vertical.
# As próximas 7 linhas do comando não precisam ser alteradas para uma legenda hoziontal.
nl <- 1
nc <- length(intervalos)
image(intervalos, nc, matrix(intervalos, nc, nl), 
      col = cores, 
      xlab = "", ylab = "",
      xaxt = "n", yaxt = "n", 
      add = FALSE)

# Adicionar eixos
axis(1, at = c(0.2, 0.8))

# Adicionar título. Como a margem foi removida, a função mtext é usada neste caso.
mtext("Escala")

par(op) # Resetar parâmetros gráficos


##===================================================
##Exportar gráficos como imagem
##===================================================

data(anscombe) 
dados <- anscombe

setwd("D:\\R\\R_Graph\\target\\")

#Define a saída do gráfico para arquivo
png("Anscombe.png", 
    res = 200, 
    height = 600, 
    width = 600) 

plot(dados$x1, dados$y1, 
     xlab = "Variável independente", ylab = "Variável dependente", 
     main = "Anscombe",
     las = 1,
     xlim = c(0, 16), ylim = c(0, 12),
     xaxs = "i", yaxs = "i",
     xaxp = c(0, 16, 8), 
     yaxp = c(0, 12, 6), 
     tck = 0.01,
     mgp = c(1.5, 0.5, 0))

#Encerra o processo de gravação
dev.off()

#Saída como imagem vetorial
pdf("Anscombe.pdf", 
    width = 6, 
    height = 6) 

plot(dados$x1, dados$y1,
     xlab = "Variável independente", ylab = "Variável dependente", 
     main = "Anscombe",
     las = 1,
     xlim = c(0, 16), ylim = c(0, 12),
     xaxs = "i", yaxs = "i",
     xaxp = c(0, 16, 8), 
     yaxp = c(0, 12, 6), 
     tck = 0.01,
     mgp = c(1.5, 0.5, 0))

dev.off()


##===================================================
##Exportar gráficos como objeto
##===================================================
dados <- data.frame(x = 1:10, y = 1:10)
str(dados)

plot(dados$x, dados$y, 
     pch = 19,
     col = "tomato2", 
     cex = 1.5)

title(main = "Exemplo")


pl <- recordPlot() # Gráfico salvo no objeto pl 
pl # Gráfico originalmente salvo é repetido com todas as opções utilizadas
