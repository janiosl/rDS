##====================================================================
#CURSO DE GRÁFICOS EM R
#https://vanderleidebastiani.github.io/tutoriais/Graficos_com_R.html

#GRÁFICOS PERSONALIZADOS

##====================================================================


##==============================================
##BOXPLOT
##==============================================
data(PlantGrowth) 
dados <- PlantGrowth 
str(dados)

# ANOVA 
mod <- lm(weight ~ group, data = dados) 
summary.aov(mod)

# Tukey
TukeyHSD(aov(weight ~ group, data = dados))

#Boxplot
boxplot(weight ~ group, 
        data = dados, 
        ylab = "Peso seco", xlab = "Tratamentos",
        main = "Rendimento",
        boxwex = 0.7,
        las = 1,
        ylim = c(3.5, 6.5))

text(x = c(2, 3), 
     y = c(6.2, 6.45), 
     labels = "*", 
     cex = 1.5)


#Personalização do boxplot
dados$group <- factor(dados$group, 
                      levels = c("ctrl", "trt2", "trt1")) 
str(dados)

boxplot(weight ~ group, 
        data = dados, 
        ylab = "Peso seco", xlab = "Tratamentos", 
        main = "Rendimento", 
        las = 1, 
        ylim = c(3.5, 6.5),
        col = "black",
        border = "white",
        whiskcol = "black",
        staplecol = "black",
        outcol = "black",
        outpch = 19,
        boxwex = 0.4)


#Personalização 2 do boxplot
boxplot(weight ~ group, 
        data = dados, 
        ylab = "Peso seco", xlab = "Tratamentos", 
        main = "Rendimento",
        las = 1,
        ylim = c(3.5, 6.5),
        col = "black",
        border = "white",
        whiskcol = "black",
        staplecol = "black",
        outcol = "black",
        medcol = "black",
        outpch = 19,
        range = 0,
        boxwex = 0.4,
        names = c("Controle","T2", "T1"))


##==============================================
##BOXPLOT
##==============================================
install.packages("beanplot")
require(beanplot)
data(ToothGrowth)
dados <- ToothGrowth
dados$dose <- as.factor(dados$dose)
str(dados)

beanplot(len ~ dose, 
         data = dados,
         boxwex = 0.4, 
         at = 1:3 - 0.15,
         subset = supp == "VC", 
         col = adjustcolor("grey", alpha.f = 0.2), 
         ylim = c(0, 40), 
         xlab = "Dose de vitamina C (mg/dia)",
         ylab = "Comprimento do dente",
         log = "",
         las = 1,
         what = c(0,1,1,1),
         beanlines = "median",
         xaxt = "n")

beanplot(len ~ dose, data = dados,
         boxwex = 0.4, 
         at = 1:3 + 0.15,
         subset = supp == "OJ", 
         col = adjustcolor("grey", alpha.f = 0.8),
         what = c(0,1,1,1),
         xaxt = "n",
         add = TRUE
)

axis(side = 1, 
     at = 1:3, 
     label = levels(dados$dose), 
     lwd = 0, 
     lwd.ticks = 1)

legend("topleft", 
       bty = "n", 
       legend = c("Ácido ascórbico", "Suco de laranja"),
       fill = c(adjustcolor("grey", alpha.f = 0.2), 
                adjustcolor("grey", alpha.f = 0.8)))
