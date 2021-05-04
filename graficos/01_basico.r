##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS BÁSICOS

##====================================================================

data("anscombe")
dados <- anscombe
str(dados)

##============================================
##USOS DA FUNÇÃO plot() - Gráficos básicos
##============================================
#Dispersão de duas variáveis
plot(dados$x1, dados$y1)

#Série de observações de uma variável
plot(dados$x1)

#Gráfico de barras
plot(as.factor(dados$x1))

#Boxplot
plot(as.factor(dados$x1), dados$y1)

#Painel gráfico
plot(dados)


##============================================
##USOS DA FUNÇÃO par() - Parâmetros gráficos
##============================================
#Verificar opções
ls(par())


##============================================
##ALTERANDO EIXOS
##============================================
#Nomeando eixos
plot(dados$x1, dados$y,
     xlab = "Variável preditora", ylab = "Variável resposta", #Rótulos dos eixos
     main = "Anscombe"                                        #Título principal do gráfico
     )


#Alterando orientação dos ticks, limites dos eixos e tamanho da fonte dos eixos
plot(dados$x1, dados$y1, 
     xlab = "Variável preditora", ylab = "Variável resposta",  
     main = "Anscombe",
     las = 1,                            #Orientação dos ticks
     xlim = c(0, 16), ylim = c(0, 12),   #Limites de x e y
     xaxs = "i", yaxs = "i",             #Método para cálculo dos limites dos eixos
     cex.axis = 1)                       #Tamanho da fonte dos eixos

#Opções:
#las: 0 paralelo, 1 horizontal, 2 perpendicular, 3 vertical
#xaxs e yaxs: r expande os eixos além do limite i finaliza os eixos exatamente no limite


plot(dados$x1, dados$y1, 
     xlab = "Variável preditora", ylab = "Variável resposta", 
     main = "Anscombe",
     las = 1, 
     xlim = c(0, 16), ylim = c(0, 12), 
     xaxs = "i", yaxs = "i", 
     cex.axis = 1, 
     xaxp = c(0, 16,8), yaxp = c(0, 12, 6),   #Quantidade e posição de separadores dos eixos
     tck = 0.01,                              #Comprimento dos separadores (ticks) dos eixos
     mgp = c(1.5, 0.5, 0))                    #margem onde são mostrados os textos do eixos, valores dos eixos e próprio eixo.


#Opções
#tck valor define o tamanho. Negativos exibem o tick na parte externa, valores positivos na parte interna
#mgp: margem c(rótulo, valores, eixo)

#EXemplos mudando os valores de mgp

#MUDANDO MARGEM DO TEXTO DOS EIXOS
#=================================
plot(dados$x1, dados$y1, 
     xlab = "Variável preditora", ylab = "Variável resposta", 
     main = "Anscombe",
     las = 1, 
     xlim = c(0, 16), ylim = c(0, 12), 
     xaxs = "i", yaxs = "i", 
     cex.axis = 1, 
     xaxp = c(0, 16,8), yaxp = c(0, 12, 6),   #Quantidade e posição de separadores dos eixos
     tck = 0.01,                              #Comprimento dos separadores (ticks) dos eixos
     mgp = c(2, 0.5, 0))


#MUDANDO MARGEM DOs VALORES DO EIXO
#====================================
plot(dados$x1, dados$y1, 
     xlab = "Variável preditora", ylab = "Variável resposta", 
     main = "Anscombe",
     las = 1, 
     xlim = c(0, 16), ylim = c(0, 12), 
     xaxs = "i", yaxs = "i", 
     cex.axis = 1, 
     xaxp = c(0, 16,8), yaxp = c(0, 12, 6),   #Quantidade e posição de separadores dos eixos
     tck = 0.01,                              #Comprimento dos separadores (ticks) dos eixos
     mgp = c(2, 1, 0))


#MUDANDO MARGEM DO PRÓPRIO EIXO
#====================================
plot(dados$x1, dados$y1, 
     xlab = "Variável preditora", ylab = "Variável resposta", 
     main = "Anscombe",
     las = 1, 
     xlim = c(0, 16), ylim = c(0, 12), 
     xaxs = "i", yaxs = "i", 
     cex.axis = 1, 
     xaxp = c(0, 16,8), yaxp = c(0, 12, 6),   #Quantidade e posição de separadores dos eixos
     tck = 0.01,                              #Comprimento dos separadores (ticks) dos eixos
     mgp = c(2, 1, 0.5))
