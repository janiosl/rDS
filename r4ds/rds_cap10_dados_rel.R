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
##====================================
##Mutate join
##====================================
##====================================
#Subset para facilitar a compreensão do exemplo
flights2 <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)

flights2

flights2 %>%
  select(-origin, -dest) %>%
  left_join(airlines, by = "carrier")

##====================================
#Operações de join
##====================================
x <- tribble(
  ~key, ~val_x,
  #----/----
  1, "x1",
  2, "x2",
  3, "x3"
)

x

y <- tribble(
  ~key, ~val_y,
  #----/----
  1, "y1",
  2, "y2",
  4, "y3"
)

y

#Inner join: observações comuns às duas tabelas
x %>%
  inner_join(y, by = "key")

#Outer join: operações que aparecem em ao menos uma das tabelas
#União pela esquerda
x %>%
  left_join(y, by = "key")


#União pela direita
x %>%
  right_join(y, by = "key")

#União completa
x %>%
  full_join(y, by = "key")

##====================================
##Chaves duplicadas
##====================================
#Uma das tabelas com keys duplicadas
x <- tribble(
  ~key, ~value_x,
  #----/----
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4",
)

y <- tribble(
  ~key, ~value_y,
  #----/----
  1, "y1",
  2, "y2",
)

x
y

x %>% 
  left_join(y, by = "key")

#Ambas as tabelas com keys duplicadas
x <- tribble(
  ~key, ~value_x,
  #----/----
  1, "x1",
  2, "x2",
  2, "x3",
  3, "x4",
)

y <- tribble(
  ~key, ~value_y,
  #----/----
  1, "y1",
  2, "y2",
  2, "y3",
  3, "y4",
)

x
y

x %>% 
  left_join(y, by = "key")

##====================================
#Definição de colunas com chave
##====================================
#Sem chave (by = NULL) -> Natural join
#Todas combinações possíveis são feitas
flights2
weather

flights2 %>%
  left_join(weather)

#Chave explícita
#Despreza outras combinações diferentes do valor de by
#Colunas com mesmo nome, mas não usadas no join são desambiguadas com .x e .y
#Verificar a desambiguação de year
flights2 %>%
  left_join(planes, by = "tailnum")


#Chave explícita com nomes diferentes
flights2 %>%
  left_join(airports, by = c("dest" = "faa"))


flights2 %>%
  left_join(airports, by = c("origin" = "faa"))

##====================================
##====================================
##Filtering join
##====================================
##====================================

#Identificação de destinos mais populares
top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)

top_dest


#Voos que foram para destinos populares
#Usando filtros
flights %>%
  filter(dest %in% top_dest$dest)


#Usando semi join
#Combina mantendo apenas as linhas com em x que tem cominação em y
flights %>%
  semi_join(top_dest)


#Anti join inverte a ordem, procurando linhas não tem uma combinação
flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(tailnum, sort = TRUE)


##====================================
##====================================
##Operações de conjuntos
##====================================
##====================================

df1 <- tribble(
  ~x, ~y,
  #---/---
  1, 1,
  2, 1
)

df2 <- tribble(
  ~x, ~y,
  #---/---
  1, 1,
  1, 2
)
df1
df2

intersect(df1, df2)
union(df1, df2)
setdiff(df1, df2)
setdiff(df2, df1)
