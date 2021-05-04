##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS PERSONALIZADOS

##====================================================================


##==============================================
##BARRAS
##==============================================

#install.packages("ade4")
require(ade4)

data(tortues)
str(tortues)

dados <- rbind(tapply(tortues[, 1], tortues[, 4], mean), 
               tapply(tortues[, 2], tortues[, 4], mean), 
               tapply(tortues[, 1], tortues[, 4], mean))
rownames(dados) <- names(tortues)[1:3] 
dados

dados_sd <- rbind(tapply(tortues[, 1], tortues[, 4], sd), 
                  tapply(tortues[, 2], tortues[, 4], sd), 
                  tapply(tortues[, 3], tortues[, 4], sd))
rownames(dados_sd) <- names(tortues)[1:3]
dados_sd

#Gráfico de barras
barplot(dados, 
        beside = TRUE, 
        width = 0.7, 
        ylim = c(0, 180), 
        las = 1,
        legend = c("Comprimento","Largura", "Altura"), 
        args.legend = list(x = "top", 
                           bty = "n", 
                           ncol = 3), 
        names = c("Machos","Fêmeas"), 
        main = "Tartarugas")



#Uso de plotrix para gerar gráficos de barras com informações complementares
require(plotrix)

#Geração do objeto com dados do primeiro gráfico
xx <- barplot(dados, beside = TRUE, 
              width = 0.7, 
              ylim = c(0, 180), 
              las = 1, 
              legend = c("Comprimento","Largura", "Altura"), 
              args.legend = list(x = "top",
                                 bty = "n", 
                                 ncol = 3), 
              names = c("Machos","Fêmeas"), 
              main = "Tartarugas", 
              xaxs = "r")
xx

#Geração do gráfico completo
plotCI(x = xx, y = dados,
       uiw = dados_sd,
       liw = 0,
       add = TRUE,
       pch = NA)

##==============================================
##BARRAS EMPILHADAS
##==============================================

dados <- data.frame(Mulheres = c(0.328, 0.461, 0.159, 0.052), 
                    Homens  = c(0.351, 0.464, 0.146, 0.039)) 
rownames(dados) <- c("0-19", "20-49", "50-69", "70+")
dados <- as.matrix(dados)
dados

barplot(dados, 
        col = c("white", "black", "grey", "black"), 
        density = c(0, 20, 50, 200), 
        angle = c(0,45, 135, 0), 
        ylab = "Proporção", 
        las = 1, 
        xaxs = "i",
        main = "População Brasileira (2010)",
        ylim = c(0, 1), xlim = c(0, 3.5))


barplot(dados, 
        col = c("white", "black", "grey", "black"), 
        density = c(0, 20, 50, 200), 
        angle = c(0,45, 135, 0), 
        ylab = "Proporção", 
        las = 1, 
        xaxs = "i",
        main = "População Brasileira (2010)",
        ylim = c(0, 1), xlim = c(0, 3.5),
        legend = rownames(dados), 
        args.legend = list(x = "right", 
                           bty = "n", 
                           title = "Faixa etária"))

axis(side = 1, label = FALSE, tck = 0)
