library(tidyverse)
library(nycflights13)

#====================================
##Distribuição dos dados
#====================================

#Distribuição - variável categórica
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

diamonds %>%
  count(cut)

#Distribuição - variável contínua
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat),
                 bandwidth = 0.5)

diamonds %>%
  count(cut_width(carat, 0.5))

smaller <- diamonds %>%
  filter(carat < 3) #Apenas diamantes abaixo de 3 quilates

ggplot(data = smaller) +
  geom_histogram(mapping = aes(x = carat),
                 binwidth = 0.1) #Menor tamanho das classes de freq.

#Múltiplos histogramas
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)

#Nível mais detalhado (mais classes de frequência)
ggplot(data = smaller,
       mapping = aes(x = carat, color = cut)) + 
  geom_histogram(binwidth = 0.01)


#Exemplo de histograma de erupções de geises 
ggplot(data = faithful,
       mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)


#Valores incomuns
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

#Zoom em coordenadas específicas para avaliar detalhes
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unsual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  arrange(y)

unsual

summary(diamonds)
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = x, binwidth = 0.1))

diamonds %>%
  count(cut_width(x, 0.1))

ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price, binwidth = 1000))

summary(diamonds$price)

diamonds %>%
  filter(carat == 1) %>%
  summarize(n = n())

#Tratamento de valores "estranhos"
diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

#Zoom em coordenadas específicas para avaliar detalhes
ggplot(data = diamonds2) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)


flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_minute = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_minute / 60
  ) %>%
  ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(color = cancelled),
                binwidth = 1/4)
