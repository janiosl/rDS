library(tidyverse)
library(nycflights13)

#Datasets
airlines
airports
planes
weather

#Chegam de exclusividade nas chaves
planes %>%
  count(tailnum) %>%
  filter(n > 1)

weather %>%
  count(year, month, day, hour, origin) %>%
  filter(n > 1)


#Tabelas sem chave primária
flights %>% 
  count(year, month, day, flight) %>%
  filter(n > 1)

flights %>% 
  count(year, month, day, tailnum) %>%
  filter(n > 1)

##====================================
##Mutate join
##====================================
#Subset para facilitar a compreensão do exemplo
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)

flights2

flights2 %>%
  select(-origin, -dest) %>%
  left_join(airlines, by = "carrier")
