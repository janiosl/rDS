library(nycflights13)
library(tidyverse)

#====================================
##Combinação de operações
#====================================

#Operações isoladas com dataframes intermediários

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))


delay <- filter(delay,
                count  > 20,
                dest != "HNL")


ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3)  +
  geom_smooth(se = FALSE)

#Usando combinação de operações com pipe

delays <-  flights %>%
  group_by(dest) %>%
  summarize(count = n(),
            dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(count > 20, dest != "HNL")


ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count, color = "blue"), alpha = 1/3)  +
  geom_smooth(se = FALSE, aes(color = "red"))


#====================================
##Valores ausentes
#====================================
#Sem tratamento
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

#Com tratamento
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))

#Tratamento prévio e guarda em um novo dataset
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay),
         !is.na(arr_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))
#========================================
#Uso de contagens para suporte à análise
#========================================
delays <- not_cancelled %>% 
  group_by(tailnum) %>%
  summarize(delay = mean(arr_delay))

ggplot(data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)



delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE),
            n = n())

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)


delays %>% 
  filter(n > 25) %>%
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

#Exemplo de análise de rebatidas no beisebol
#install.packages("Lahman")
batting <- as_tibble(Lahman::Batting)

batters <- batting %>%
  group_by(playerID) %>%
  summarize(ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE), #Média de rebatidas
            ab = sum(AB, na.rm = TRUE)) #Quantidade de tentativas

batting
batters

batters %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point()+
  geom_smooth(se = FALSE)

#====================================
##Resumo estatístico
#====================================
#Médias
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    #average delay
    avg_delay1 = mean(arr_delay),
    #average positive delay
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

?mpg

by_manuf <- mpg %>%
  group_by(manufacturer, drv) %>%
  summarize(avg_cty = mean(cty),
            number = n())

View(by_manuf)

ggplot(data = by_manuf, mapping = aes(x = avg_cty, y = number)) + 
  geom_point(mapping = aes(color="red")) +
  geom_smooth()

#Desvio padrão
not_cancelled %>%
  group_by(dest) %>% 
  summarize(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))


#Classificação
not_cancelled %>% 
  group_by(year, month, day) %>%
  summarize(
    first = min(dep_time),
    last = max(dep_time)
  )

#Posição
x <- c(1,1,2,3,5,8,13,21)

first(x) #Primeiro elemento
last(x) #Segundo elemento
nth(x, 3) #Elemento 3
nth(x, 7)
nth(x,10)

not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )

not_cancelled %>%
  group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r))

#Contagens

#Quais destinos tem mais companinhas
not_cancelled %>%
  group_by(dest) %>%
  summarize(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))

#Contagem simples
not_cancelled %>%
  count(dest)

#Contagem com peso
not_cancelled %>%
  count(dest, wt = distance)

#Usar lógica para contar
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(n_early = sum(dep_time < 500)) #Soma 1 para cada TRUE

#Usar lógica para calcular proporção
not_cancelled %>%
  group_by(year, month, day) %>%
  summarize(hour_per = mean(arr_delay > 60))

#Agrupamento de múltiplas variáveis
daily <- group_by(flights, year, month, day)

(per_day <- summarize(daily, flights = n()))
(per_month <- summarize(per_day, flights = sum(flights)))
(per_year <- summarize(per_month, flights = sum(flights)))

#Desagrupar
daily %>%
  ungroup() %>%
  summarize(flights = n())
