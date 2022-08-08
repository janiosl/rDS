library(nycflights13)
library(tidyverse)

?flights

#SALVANDO CONJUNTO DE DADOS CSV
#Ação não relacionada ao estudo. Gravando apenas para uso posterior em Python
arquivo = ("D:\\git\\python.ds\\data\\flights.csv")
write.table(flights, file=arquivo, row.names=FALSE, quote=FALSE, sep=",")

View(flights)

#====================================
##Operação de filtro
#====================================
filter(flights,
       month == 1,
       day == 1)

jan1 <- filter(flights,
               month == 1,
               day == 1)

#Operação com OR
filter(flights,
       month == 11 | month ==12)

filter(flights,
       month %in% c(11,12))

#Operação combinadas
filter(flights,
       !(arr_delay > 120 | dep_delay > 120)) #Voos sem atraso maior que 120 na chegada ou partida


#Valores faltantes
df <- tibble(x = c(1, NA, 3))

filter(df, x > 1)

filter(df,
       is.na(x) | x > 1)

##====================
##EXERCÍCIOS
##====================

#* Atraso maior ou igual a 2 horas na checaga
filter(flights,
       dep_delay >= 120)
 
#* Foram para Houston (IAH ou HOU)
houston <- filter(flights,
       dest == "IAH" | dest == "HOU")

#* Foram operadorados pela United, American ou Delta
companies <- filter(flights,
       carrier %in% c("AA", "UA", "DL"))

#* Partiram em julho, agosto ou setembro
filter(flights,
       month %in% c(7, 8, 9))

#* Chegaram com mais de duas horas de atraso, mas não saíram atrasado
filter(flights,
       arr_delay >= 120 & dep_delay <= 0)

#* Atrasaram mais de uma hora, mas compensaram mais de 30 minutos no trajeto
filter(flights,
       dep_delay > 60 & arr_delay < 30)

#* Saíram entre meia noite e 6
madrugada <- filter(flights,
       dep_time >= 2400 | dep_time <= 600)

#* Uso between
#* dep_time faltante
filter(flights,
       is.na(dep_time))

summary(flights)

#* 
#* 
