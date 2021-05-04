##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#DETALHES DE PARÂMETROS - ATRAVÉS DA RECONSTRUÇÃO PASSO A PASSO

##====================================================================

data("anscombe")
dados <- anscombe

##============================================
##RECONSTRUINDO ELEMENTOS DO GRÁFICO
##============================================


##ADICIONANDO PONTOS A UM GRÁFICO EXISTENTE
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23,     #Símbolo dos pontos
       cex = 1.3)    #Tamanho dos símbolos


##ADICIONANDO CONTORNOS
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")    #Tipo de contorno da caixa



##ADICIONANDO EIXOS
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")

#Adição dos eixos
axis(side = 1)  #Posição do eixo

axis(side = 2, #Posição do eixo
     las = 1)  #Orientação do eixo



##ADICIONANDO LINHAS
##============================================
#Criando a reta de ajustamento com a Regressão Linear
#Modelo
mod <- lm(dados$y1 ~ dados$x1)
mod # Modelo linear

#Predição de valores de y
ypredito <- predict(mod)
ypredito # Valores preditos pelos modelo linear


#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")

#Adição dos eixos
axis(side = 1)

axis(side = 2, 
     las = 1)

#Adição de linha
lines(x = dados$x1, y = ypredito, 
      lty = 2, #Tipo de linha
      lwd = 1, #Tipo de linha
      col="red")




##ADICIONANDO LEGENDAS
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")

#Adição dos eixos
axis(side = 1)

axis(side = 2, 
     las = 1)

#Adição de linha
lines(x = dados$x1, y = ypredito, 
      lty = 2, 
      lwd = 1,
      col="red")

#Adição de legendas
legend(x = "topleft",                 #Posição da legenda
       legend = "Regressão linear",   #Legenda
       lty = 2, lwd = 1,              #Configurações do símbolo (neste caso linha)
       bty = "n",                     #Caixa ao redor da legenda "n" = nenhuma
       col="red")




##ADICIONANDO LINHA SIMPLES
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")

#Adição dos eixos
axis(side = 1)

axis(side = 2, 
     las = 1)

#Adição de linha
lines(x = dados$x1, y = ypredito, 
      lty = 2, 
      lwd = 1,
      col="red")

#Adição de legendas
legend(x = "topleft",                 
       legend = "Regressão linear",   
       lty = 2, lwd = 1,              
       bty = "n",                     
       col="red")

#Adição da linha simples na posição horizonal 7.5
abline(h = 7.5, #Posição horizontal
       lty = 3) #Tipo de linha


#Adição da linha simples na posição vertical 10
abline(v = 10,  #Posição vertical
       lty = 3, 
       col = "blue")




##ADICIONANDO SETAS
##============================================
#Criação do gráfico original "vazio"
plot(dados$x1, dados$y1, type = "n", 
     xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", 
     bty = "n")

#Adição dos pontos
points(x = dados$x1, y = dados$y1, 
       pch = 23, 
       cex = 1.3)

#Adição da caixa de contorno
box(bty = "l")

#Adição dos eixos
axis(side = 1)

axis(side = 2, 
     las = 1)

#Adição de linha
lines(x = dados$x1, y = ypredito, 
      lty = 2, 
      lwd = 1,
      col="red")

#Adição de legendas
legend(x = "topleft",                 
       legend = "Regressão linear",   
       lty = 2, lwd = 1,              
       bty = "n",                     
       col="red")

#Adição da linha simples na posição horizonal 7.5
abline(h = 7.5, #Posição horizontal
       lty = 3) #Tipo de linha


#Adição da linha simples na posição vertical 10
abline(v = 10,  #Posição vertical
       lty = 3, 
       col = "blue")

#Adição de setas para apontar coordenadas no gráfico
arrows(x0 = 5.5, y0 = 8,   #Origem da seta
       x1 = 5.5, y1 = 7.5, #Destino da seta
       length = 0.1,       #Comprimento da ponta da seta
       col="green")



##OBSERVAÇÃO:
#Nas etapas anteriores o gráfico gerado é sempre o mesmo, apenas adicionado de um elemento novo a cada
#etapa. A partir deste ponto adicionaremos apenas o novo elemento, contudo para o gráfico ser construído
#completamente o código completo do gráfico é necessário

##ADICIONANDO TEXTO
##============================================
#Adicionando a palavra média acima da seta desenhada
text(x = 5.5, y = 8.3, #Posição do texto
     labels = "Média")


##ADICIONANDO SEGMENTOS
##============================================
#Adicionando um segmento de reta abaixo do texto da etapa anterior
segments(x0 = 5, y0 = 8.1, #Início do segmento de reta
         x1 = 6, y1 = 8.1) #Término do segmeno de reta


##ADICIONANDO GRADES AO GRÁFICO
##============================================
grid(nx = NULL, ny = NULL, 
     lty = 3, 
     lwd = 1, 
     col = "gray")


##ADICIONANDO TÍTULOS
##============================================
title(main = "Anscombe", 
      xlab = "X1", ylab = "Y1", 
      font.main = 3)


##ADICIONANDO POLÍGONOS
##============================================
polygon(x = c(8.5, 12, 12, 8.5), y = c(6.5, 6.5, 9, 9), #Coordenadas da figura
        col = adjustcolor("blue", alpha.f = 0.2),       #Cor e nível de transparência
        density = NULL,                                 #Densidade do sombreamento
        border = NA)                                    #Cor da borda



##========================================================================
##IDENTIFICAR UMA COORDENADA NO GRÁFICO PARA POSICIONAMENTO DE ELEMENTOS
##========================================================================
#Rodar a função
#Clicar no local desejado
#Verificar a saída no terminal com as coordenadas x e y
#n = número de pontos desejados antes de encerrar a captura de coordenadas
locator(n = 4, labels = "Cliquei aqui")




##ADICIONANDO EM PONTOS CAPTURADOS
##============================================
coord = locator(n = 4, labels = "Cliquei aqui")

polygon(x = coord$x, y =coord$y, #Coordenadas da figura
        col = adjustcolor("green", alpha.f = 0.2),
        density = NULL,
        border = NA)

