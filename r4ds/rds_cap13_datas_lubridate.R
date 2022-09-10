#install.packages("lubridate")
library(tidyverse)
library(lubridate)
library(nycflights13)

#Verificando tempos
today() #Data
now() #Data e hora

#Lendo datas a partir de strings
ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")

#Lendo datas a partir de números
ymd(20170131)

#Datas e horas
ymd_hms("2017-01-31 20:11:59")
mdy_hm("01/31/2017 08:01")

ymd(20170131, tz="UTC")

#Exemplo a partir de um dataset com componentes individuais das datas
flights %>% 
  select(year, month, day, hour, minute)

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_datetime(year, month, day, hour, minute))

flights %>% 
  select(year, month, day, hour, minute) %>% 
  mutate(departure = make_date(year, month, day))

#função para tratar o formato de horas no dataset fligths
#Exemplo de horas no dataset
flights[1:5,4]
##======SAÍDA============##
# A tibble: 5 × 1
#dep_time
#<int>
#1      517
#2      533
#3      542
#4      544
#5      554
##======SAÍDA============##


make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day,
                time %/% 100, #Parte inteira da divisão por 100
                time %% 100) #Resto da divisão por 100
}

#Aplicação da função
flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time),
  ) %>% 
  select(origin, dest, ends_with("delay"), ends_with("time"))

flights_dt


#Visualização dos dados de datas e horas
#Visão geral
flights_dt %>% 
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 86400)


#Visão de um dia
flights_dt %>% 
  filter(dep_time < ymd(20130102)) %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 600)


#Mudar de um tipo para outro
today()
as_datetime(today())

now()
as_date(now())

as_datetime(60*60*10)
as_date(365*10+2)

##Exercícios
#Dados inválidos
ymd(c("2010-10-10", "bananas"))

#Time zones
today(tzone="UTC")
today("GMT")
now("GMT")
now()
now("America/New_York")

Sys.timezone()
now("America/Sao_Paulo")
now(tzone="America/Sao_Paulo")

OlsonNames()

#Lendo diferentes datas
d1 <- "January 1, 2010"
mdy(d1)

d2 <- "2015-Mar-07"
ymd(d2)

d3 <- "06-Jun-2017"
dmy(d3)

d4 <- c("August 19 (2015)", "July 1 (2015)")
mdy(d4)

d5 <- "12/30/14"
mdy(d5)
