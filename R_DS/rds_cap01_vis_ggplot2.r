library("tidyverse")

#SALVANDO CONJUNTO DE DADOS CSV
#Ação não relacionada ao estudo. Gravando apenas para uso posterior em Python
arquivo = ("D:\\git\\python.ds\\data\\mpg.csv")
write.table(mpg, file=arquivo, row.names=FALSE, quote=FALSE, sep=",")

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
