library(tidyverse)
library(lubridate)
library(nycflights13)

##==================================
##Componentes de tempo
##==================================

#Obtenção de componentes internos
datetime <- ymd_hms(now())
datetime

#Ano e mÊs
year(datetime)
month(datetime)

#Dias
mday(datetime) #Dia do mês
yday(datetime) #Dia do ano
wday(datetime) #Dia da semana

#Retorno textual
month(datetime, label = TRUE)
month(datetime, label = TRUE, abbr = FALSE)

wday(datetime, label = TRUE)
wday(datetime, label = TRUE, abbr = FALSE)





#Retomada do dataset do estudo anterior
make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day,
                time %/% 100, #Parte inteira da divisão por 100
                time %% 100) #Resto da divisão por 100
}

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

#Voos por dia da semana
flights_dt %>% 
  mutate(wday = wday(dep_time, label = TRUE)) %>% 
  ggplot(aes(x = wday)) +
  geom_bar()

#Atraso por minutos de cada hora - decolagem
flights_dt %>% 
  mutate(minute = minute(dep_time)) %>% 
  group_by(minute) %>% 
  summarize(
    avg_delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  ) %>% 
  ggplot(aes(minute, avg_delay)) +
  geom_line()

#Atraso por minutos de cada hora - agendamento decolagem
flights_dt %>% 
  mutate(minute = minute(sched_dep_time)) %>% 
  group_by(minute) %>% 
  summarize(
    avg_delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  ) %>% 
  #ggplot(aes(minute, avg_delay)) + #Atraso médio
  ggplot(aes(minute, n)) + #Quantidade
  geom_line()

#Arredondamento
?round_date

flights_dt %>% 
  count(week = floor_date(dep_time, "week")) %>% 
  ggplot(aes(week, n)) +
  geom_line()

#Configuração/alteração de componentes
datetime
year(datetime) <- 1981
month(datetime) <- 1
day(datetime) <- 31
hour(datetime) <- 15
minute(datetime) <- 0
second(datetime) <- 0
datetime

wday(datetime, label = TRUE, abbr = FALSE)

new_datetime <- update(datetime, year = 2007, month = 12, mday = 20,
       hour = 20, minute = 0, second = 0)

new_datetime

#Atualiza as datas para o início de cada ano
flights_dt %>% 
  mutate(dep_hour = update(dep_time, yday = 1)) %>% 
  ggplot(aes(dep_hour)) +
  geom_freqpoly(binwidth = 300)

##==================================
##Intervalos de tempo
##==================================
#Durações
#Padrão R -> difftime
#Adaptado dependendo dos objetos comparados
h_age <- today() - ymd(19810131)
h_age

#Usando lubridate
#Sempre calculado em segundos
as.duration(h_age)

#Construtores de durações
dseconds(15)
dminutes(10)
dhours(c(12,14))
ddays(0:5)
dweeks(3)
dyears(1)

#Operações com durações
2 * dyears(1)
dyears(1) + dweeks(12) + dhours(15)

tomorrow <- today() + ddays(1)
tomorrow

lastyear <- today() - dyears(1)
lastyear


#Cuidado ao usar
#Erros de cálculos com dias desiguais, fuso horário, horário de verão
one_pm <- ymd_hms("2016-03-12 13:00:00",
                  tz = "America/New_York")
one_pm

one_pm + ddays(1)

#Períodos
#Calculados em tempos "humanos"
one_pm + days(1)

#Construtores de períodos
seconds(15)
minutes(10)
hours(c(12,24))
days(7)
months(1:6)
weeks(3)
years(1)


#Operações com períodos
10 * (months(6) + days(1))
days(50) + hours(25) + minutes(2)

#Diferença de 1 ano
ymd("2016-01-01") + dyears(1) #Durações
ymd("2016-01-01") + years(1) #Períodos


#Aplicando ao dataset de voos
#Problemas de inconsistência -> Voos parecem chegar antes de partir
flights_dt %>% 
  filter(arr_time < dep_time)

flights_dt %>% 
  filter(arr_time < dep_time)

#Voos chegam no dia seguinte, mas foi usado o mesmo dia da partida
#Correção adicionando 1 dia
flights_dt <- flights_dt %>% 
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )

flights_dt
View(flights_dt)

flights_dt %>% 
  filter(overnight, arr_time < dep_time)


#Intervalos
#ste tipo de operação pode dar problema dependendo da quantidade de dias no ano
dyears(1) / ddays(365)
years(1) / days(1)

#Para calcular intervalos deve ser colocada uma data de início
#Nos exemplos abaixo foi usado today() como início
next_year <- today() + years(1)
next_year

(today() %--% next_year) / ddays(1)
(today() %--% next_year) / days(1)
(today() %--% next_year) %/% days(1)
