library(nycflights13)
library(tidyverse)

?flights

#SALVANDO CONJUNTO DE DADOS CSV
#Ação não relacionada ao estudo. Gravando apenas para uso posterior em Python
#arquivo = ("D:\\git\\python.ds\\data\\flights.csv")
#write.table(flights, file=arquivo, row.names=FALSE, quote=FALSE, sep=",")

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

##====================
##Ordenar linhas
##====================
#Ascendente
arrange(flights,
        year, month, day)

#Descendente
arrange(flights,
        desc(arr_delay))

#Ordenação com valores faltantes
df <- tibble(x = c(5, NA, 2))
arrange(df, x)
arrange(df, desc(x))

##====================
##EXERCÍCIOS
##====================

#* NA
#* Voos mais atrasados e voos que sairam mais cedo
arrange(flights,
        desc(dep_delay))

arrange(flights,
        dep_delay)

#* Voos mais rápidos
arrange(flights,
        air_time)


##====================
##Selecionar colunas
##====================
select(flights,
       year, month, day)

#Aninhando operações
arrange(select(flights, air_time),
        air_time)

#Seleção de intervalo
select(flights,
       year:day)

#Seleção por exclusão de colunas
df <- select(flights,
             -(year:day))

rename(flights,
       tail_num = tailnum)

select(flights,
       time_hour, air_time, #Coloca a selação no início da tabela
       everything()) #Mantém todas as demais colunas após a seleção


vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights,
       one_of(vars))

select(flights,
       contains("delay"))

select(flights,
       contains("TIME"))


##================================
##Adicionando colunas calculadas
##================================
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time)

View(flights_sml)

mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

#Referência a colunas criadas na mesma operação mutate
flights_sml <- mutate(flights_sml,
       gain = arr_delay - dep_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours)

#Mantendo apenas colunas criadas na operação
transmute(flights_sml,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours)


##================================
##Funções e operações úteis
##================================
#Operação entre vetores e escalares
x <- c(1,2,3,4)

x / sum(x)
x - mean(x)
x + x**2

#Aritmética modular
transmute(flights,
          hour = dep_time %/% 100,
          minute = dep_time %% 100)

#Aninhando operações e usando as colunas internamente
mutate(select(flights,
       dep_time),
       hour_time = dep_time %/% 100,
       minute = dep_time %% 100)

#Leading e lagging
x <- 1:10

lead(x)
lag(x)

#Acumulação e rolagem
cumsum(x)

cummean(x)

#Comparações lógicas
x == 2
x != 2
is.na(x)
x >= 3

#Classificação/rank
x <- c(2, 2, 3, NA, 0, 1, 10) 
min_rank(x)
min_rank(desc(x))


row_number(x)
dense_rank(x)


#Agrupamento
summarize(flights,
          delay = mean(dep_delay, na.rm = TRUE))

by_da <- group_by(flights,
                  year, month, day)

summarize(by_da,
          delay = mean(dep_delay, na.rm = TRUE))
