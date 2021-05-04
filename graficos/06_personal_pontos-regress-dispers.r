##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS PERSONALIZADOS

##====================================================================


##==============================================
##PONTOS, REGRESSÕES E DISPERSÃO
##==============================================
data(anscombe)
dados <- anscombe
str(dados)

#Modelo de Regressão Linear
mod <- lm(y1 ~ x1, data = dados)
mod

#Dispersão e Regressão
plot(dados$x1, dados$y1,
     xlab = "Anscombe x1", ylab = "Anscombe y1", 
     las = 1,
     ylim = c(3, 12),
     pch = 19,
     bty = "l",
     main="Regressão Linear")

abline(mod, col="blue")

legend(x="topleft",
       legend="Regressão Linear",
       lty=1,
       lwd=1,
       bty="n",
       col="blue")


#Regressão Linear - Reta limitada pelos valores de x

# Primeiro passo é gerar um novo intervalo para a variável preditora
# Nesse caso a nova varíavel são 100 pontos, do limite mínimo e máximo da variável original
new <- data.frame(x1 = seq(min(dados$x1), max(dados$x1), length.out = 100))
fitted <- predict(mod, new, interval = "confidence") # Valores preditos para o novo intervalo
head(fitted) # Primeiras 6 linhas da tabela

plot(dados$x1, dados$y1,
     xlab = "Anscombe x1", ylab = "Anscombe y1", 
     las = 1,
     ylim = c(3, 12),
     pch = 19,
     bty = "l",
     main="Regressão Linear")

lines(new$x1, fitted[, "fit"], lty = 1, col="blue")

legend(x="topleft",
       legend="Regressão Linear",
       lty=1,
       lwd=1,
       bty="n",
       col="blue")


#Regressão Linear - Área do intervalo de confiança
plot(dados$x1, dados$y1,
     xlab = "Anscombe x1", ylab = "Anscombe y1", 
     las = 1,
     ylim = c(3, 12),
     pch = 19,
     bty = "l")

lines(new$x1, fitted[, "fit"], lty = 1, col="blue")

lines(new$x1, fitted[, "lwr"], lty = 3, col="blue")
lines(new$x1, fitted[, "upr"], lty = 3, col="blue")

coord <- data.frame(x = c(new$x1, rev(new$x1)), y = c(fitted[, "lwr"], rev(fitted[, "upr"])))
head(coord) # Coordenadas da área do polígono


polygon(coord, border = NA, col = adjustcolor("blue", alpha = 0.2))



#Ajustes não lineares
set.seed(1)
dados <- data.frame(dx = 1:100, 
                    dy = 0.4 + (4.8 * log(1:100)) + rnorm(100, 0, 1)) 
str(dados)

# Modelos
mod1 <- lm(dy ~ 1, data = dados) # Média
mod2 <- lm(dy ~ dx, data = dados) # Linear
mod3 <- nls(dy ~ a + b * log(dx), data = dados, start = list(a = 0, b = 0)) # Logaritmo 
mod4 <- nls(dy ~ a + b/dx, data = dados, start = list(a = 0, b = 0)) # Assintótico


# Organização dos coeficientes
coeficientes <- data.frame(m1 = paste("y = ", round(coefficients(mod1)[1], 2), sep = ""), 
                           m2 = paste("y = ", round(coefficients(mod2)[1], 2), 
                                      " + (", round(coefficients(mod2)[2], 2), "*x)", sep = ""), 
                           m3 = paste("y = ", round(coefficients(mod3)[1], 2), 
                                      " + (", round(coefficients(mod3)[2],2),
                                      "*log(x))", sep = ""), 
                           m4 = paste("y = ", round(coefficients(mod4)[1], 2), " + (",
                                      round(coefficients(mod4)[2], 2), "/x)", sep = ""))
coeficientes # Coeficientes para cada modelo

#Visualização dos dados
plot(dy ~ dx, 
     data = dados, 
     ylim = c(-10, 25), 
     pch = 21, 
     cex = 0.8,
     bty = "o",
     ylab = "y", xlab = "x")


#Visualização das curvas dos modelos
# Funções de cada modelo
fmod1 <- function(x) 17.97 + (0 * x) 
fmod2 <- function(x) 11.04 + (0.14 * x) 
fmod3 <- function(x) 0.5 + (4.8 * log(x))
fmod4 <- function(x) 19.51 + (-29.64/x)

plot(dy ~ dx, 
     data = dados, 
     ylim = c(-10, 25), 
     pch = 21, 
     cex = 0.8,
     bty = "o",
     ylab = "y", xlab = "x")

curve(fmod1, from = 1, to = 100, 
      add = TRUE,
      lty = 3,
      lwd = 1.5,
      col="blue")

curve(fmod2, from = 1, to = 100,
      add = TRUE,
      lty = 2,
      lwd = 1.5,
      col="red")

curve(fmod3, from = 1, to = 100,
      add = TRUE,
      lty = 1,
      lwd = 1.5,
      col="green")

curve(fmod4, from = 1, to = 100,
      add = TRUE,
      lty = 6,
      lwd = 1.5,
      col="orange")

legend("bottomright", 
       legend = c(paste(coeficientes$m1), 
                  paste(coeficientes$m2),
                  paste(coeficientes$m3), 
                  paste(coeficientes$m4)), 
       bty = "n", 
       lty = c(3, 2, 1, 6), 
       lwd = 1.5,
       col=c("blue", "red", "green", "orange"))

##==============================================
##PCA E CONSTRUÇÃO DA DISPERSÃO
##==============================================
data(USArrests)
str(USArrests)

#Análise de componentes principais - PCA
install.packages("FactoMineR")
require(FactoMineR)

Rpca <- PCA(USArrests, graph = FALSE) # PCA
str(Rpca$eig) # Autovalores
str(Rpca$var$coord) # Correlação com os eixos
str(Rpca$ind$coord) # Scores das unidades amostrais

dados_unidades <- Rpca$ind$coord[, 1:2]
str(dados_unidades) # Scores das unidades amostrais para os dois primeiros eixos

dados_variaveis <- Rpca$var$coord[, 1:2]
str(dados_variaveis) # Correlação das variáveis para os dois primeiros eixos


op <- par(mar = c(4, 4, 3, 3))

plot(dados_unidades, 
     pch = 19, 
     cex = 0.6, 
     ylab = "PCA 2 (24.74%)", xlab = "PCA 1 (62.01%)", 
     xlim = c(-3.2, 3.2), ylim = c(-2.5, 2.5),
     las = 1)

op <- par(new = TRUE)

plot(dados_variaveis, 
     xlab = "", ylab = "",
     xaxt = "n", yaxt = "n",
     type = "n",
     ylim = c(-1.2, 1.2), xlim = c(-1.2, 1.2))

axis(side = 4, las = 1)

axis(side = 3)

text(dados_variaveis, 
     labels = rownames(dados_variaveis), 
     cex = 0.6, 
     adj = 0)

arrows(x0 = 0, 
       y = 0, 
       x1 = dados_variaveis[, 1], 
       y1 = dados_variaveis[, 2], 
       length = 0.1)

abline(h = 0, 
       v = 0, 
       lty = 3)


par(op) # Restaurar parâmetros gráficos originais.
