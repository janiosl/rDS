#====================================
##Análise e visualização báisca
#====================================

library("tidyverse")

#SALVANDO CONJUNTO DE DADOS CSV
#Ação não relacionada ao estudo. Gravando apenas para uso posterior em Python
arquivo = ("D:\\git\\python.ds\\data\\mpg.csv")
write.table(mpg, file=arquivo, row.names=FALSE, quote=FALSE, sep=",")

arquivo = ("D:\\git\\python.ds\\data\\diamonds.csv")
write.table(diamonds, file=arquivo, row.names=FALSE, quote=FALSE, sep=",")


#Análise dos dados. Economia de combustíveis
#=============================================
mpg
summary(mpg)

#Visualização
#=============================================
#Variáveis:
#motor: displ (engine displacement in litres)
#eficiência de combustível: hwy (milhas por galão na estrada)


ggplot(data=mpg)+
  geom_point(mapping = aes(x = displ, y=hwy))


ggplot(data=mpg)+
  geom_point(mapping = aes(x=hwy, y=displ))


ggplot(data=mpg)+
  geom_point(mapping = aes(x=cty, y=displ))


##==============================================
##EXERCÍCIOS
#Gráfico em branco
ggplot(data = mpg)

#234 linhas
carros <- mpg
summary(carros)

#drv -> tipo de tração
?mpg

#Dispersão hwy x cyl
ggplot(data=mpg)+
  geom_point(mapping = aes(x=cyl, y=hwy))

#Gráfico inútil - class vs drv
ggplot(data=mpg) + 
  geom_point(mapping = aes(x=class, y=drv))

##==============================================


#====================================
##Camada visual adicional
#====================================

#Cores
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color=class))


#Uso abaixo (tamanho e transparência) não recomendado, tendo em vista que class não é ordenada
#Warning message:
#  Using size for a discrete variable is not advised.


#Tamanho
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


#Transparência
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


#Formato
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


#Cores sem conexão com valores
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, size = class, alpha=class), color = "blue")


#====================================
##Facetas em visual adicional
#====================================

#Uma variável
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~ class, nrow = 2)

#Mais de uma variável
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)



#====================================
##Ajuste dos objetos geométricos.
#====================================

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))



ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

#Múltiplas visualizações juntas
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  geom_smooth(mapping = aes(x = displ, y = hwy))


#Múltiplas visualizações juntas - evitando erros
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#Múltiplas visualizações com conjuntos de dados diferentes
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"),
              se = FALSE)

#====================================
##Transformações estatísticas
#====================================
?diamonds

summary(diamonds)

#Usando a geometria
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#Criando o mesmo gráfico com a transf. estatística padrão
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

#Criando o mesmo gráfico com o conjunto de dados anterior e mudando y
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))


#Gerando resumo estatístico visual
ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median)


#Criar dados de exemplo
demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

summary(demo)

#Criando o mesmo gráfico com a transf. estatística diferente
ggplot(data = demo) + 
  geom_bar(mapping = aes(x=a, y=b),
           stat = "identity")


#====================================
##Ajustes de posição
#====================================
#Colorir bordas das barras
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))


#Colorir preenchimento das barras
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

#Colorir preenchimento com empilhamento automático*
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#* Mudança da forma de preenchimento depende da variável escolhida com referência

#Evitando overplotting (sobreposição de pontos) em gráfico de dispersão
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             position = "jitter") #Adiciona ruído aletório e miniza overplotting

#Gráfico normal para comparação
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#Forma simplificada (sem necessidade do argumento jitter)
ggplot(data = mpg) + 
  geom_jitter(mapping = aes(x = displ, y = hwy))



#====================================
##Ajustes das coordenadas
#====================================

#Trocar eixos x e y
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() + 
  coord_flip()

#Proporção em gráficos de mapas
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white",
               color = "black")

ggplot(nz, aes(long, lat, group = group)) + 
  geom_polygon(fill = "white",
               color = "black") +
  coord_quickmap()


#Coordenada polar
#Construção do gráfico
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) + 
  labs(x = NULL, y = NULL)

#Visualização com coordenadas normais de barras
bar + coord_flip()

#Visualização com coordenadas polares
bar + coord_polar()


