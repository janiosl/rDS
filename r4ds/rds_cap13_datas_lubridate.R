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
