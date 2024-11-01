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
                 binwidth = 0.5)

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

##================================
##Covariância
##================================
#Análise simplificada (e ruim) usando contagem
ggplot(data = diamonds, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(color = cut),
                binwidth = 500)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

#Melhoria mudando de contagem simples para densidade
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(color = cut),
                binwidth = 500)

#Análise mais detalhada com boxplot múltiplos
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()


#Reordenação de variável categórica para facilitar a análise
#Exemplo original não ordenado
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#Exemplo reordenado
#reorder -> variável, base de ordenação, métrica de ordenação
ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median),
                                 y = hwy)) +
  geom_boxplot()

#Girando o gráfico para facilitar visualização de legendas longas
ggplot(data = mpg, mapping = aes(x = reorder(class, hwy, FUN = median),
                                 y = hwy)) +
  geom_boxplot() +
  coord_flip()


#Duas variáveis categóricas
ggplot(data = diamonds) + 
  geom_count(mapping = aes(x = cut, y = color))


diamonds %>% 
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))



ggplot(data = mpg) + 
  geom_count(mapping = aes(x = class, y = fl))


mpg %>%
  count(class, fl) %>%
  ggplot(mapping = aes(x = class, y = fl)) + 
  geom_tile(mapping = aes(fill = n))


#Duas variáveis contínuas
#Relação entre quilates e preço
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price))

#Versão melhor com transparência
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price),
             alpha = 1 / 100)



#Outras opções para datasets grandes
ggplot(data = smaller) + 
  geom_bin2d(mapping = aes(x = carat, y = price))


#install.packages("hexbin")
library(hexbin)

ggplot(data = smaller) + 
  geom_hex(mapping = aes(x = carat, y = price))


ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))


#Formas de tornar os boxplot proporcionais aos tamanhos dos bins
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1, varwidith = TRUE)))


ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))

ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))

