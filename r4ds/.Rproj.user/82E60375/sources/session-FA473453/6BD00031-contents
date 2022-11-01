#Bibliotecas e configuração NA
library(tidyverse)
library(modelr)
options(na.action = na.warn)
library(lubridate)
#Datasets
library(nycflights13)


# Preços e qualidade de diamantes -----------------------------------------

ggplot(diamonds, aes(cut, price)) + geom_boxplot()
ggplot(diamonds, aes(color, price)) + geom_boxplot()
ggplot(diamonds, aes(clarity, price)) + geom_boxplot()

#Peso e quilates e sua influência no preço
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 50)

#Transformações
diamonds2 <- diamonds %>%
  #Menor ou igual a 2 quilates
  filter(carat <= 2.5) %>% 
  #Mapamento de variáveis log de preço e quilates
  mutate(lprice = log2(price), lcarat = log2(carat))

#Visualização com dataset transformado - Preço ~ quilates
ggplot(diamonds2, aes(lcarat, lprice)) +
  geom_hex(bins = 50)


#Modelagem
mod_diamonds <- lm(lprice ~ lcarat, data = diamonds2)
mod_diamonds

#Análise do modelo
grid <- diamonds2 %>% 
  data_grid(carat = seq_range(carat, 20)) %>% #Add sample
  mutate(lcarat = log2(carat)) %>%  #Log sample
  add_predictions(mod_diamonds, "lprice") %>%  #Predict log
  mutate(price = 2 ^ lprice) #predict original scale

grid

#Visualização das predições
ggplot(diamonds2, aes(carat, price)) + 
  geom_hex(bins = 50) + 
  geom_line(data = grid, color = "red", size = 1)



# Exercício mpg -----------------------------------------------------------

head(mpg)
ggplot(mpg, aes(hwy, displ)) + 
  geom_hex(bins = 20)

mpg2 <- mpg %>% 
  mutate(lhwy = log2(hwy), ldispl = log2(displ),
         zhwy = scale(hwy), zdispl = scale(displ))

head(mpg2)
#Visualização com transformação logaritimica
ggplot(mpg2, aes(lhwy, ldispl)) + 
  geom_hex(bins = 20)

#Visualização com padronização z-score
ggplot(mpg2, aes(zhwy, zdispl)) + 
  geom_hex(bins = 20)


model <- lm(lhwy ~ ldispl, data = mpg2)
model

grid_mpg <- mpg2 %>% 
  data_grid(displ = seq_range(displ, 30)) %>% 
  mutate(ldispl = log2(displ)) %>% 
  add_predictions(model, "lhwy") %>% 
  mutate(hwy = 2 ^ lhwy)

grid_mpg


#Visualização das predições
ggplot(mpg2, aes(displ, hwy)) + 
  geom_hex(bins = 20) +
  geom_line(data = grid_mpg, color = "red", size = 1)



# Continuação avaliação de preços -----------------------------------------

diamonds2 <- diamonds2 %>% 
  add_residuals(mod_diamonds, "lresid")

ggplot(diamonds2, aes(lcarat, lresid)) + 
  geom_hex(bins = 50)


ggplot(diamonds2, aes(cut, lresid)) + geom_boxplot()
ggplot(diamonds2, aes(color, lresid)) + geom_boxplot()
ggplot(diamonds2, aes(clarity, lresid)) + geom_boxplot()

#Adição de novas variáveis no modelo
mod_diamonds2 <- lm(
  lprice ~ lcarat + color + cut + clarity,
  data = diamonds2
)

mod_diamonds2

grid <- diamonds2 %>% 
  data_grid(cut, .model = mod_diamonds2) %>% 
  add_predictions(mod_diamonds2)

grid

ggplot(grid, aes(cut, pred)) + 
  geom_point()

diamonds2 <- diamonds2 %>% 
  add_residuals(mod_diamonds2, "lresid2")

ggplot(diamonds2, aes(lcarat, lresid2)) + 
  geom_hex(bins = 50)

#Valores incomuns
diamonds2 %>% 
  filter(abs(lresid2) > 1) %>% 
  add_predictions(mod_diamonds2) %>% 
  mutate(pred = round(2 ^ pred)) %>% 
  select(price, pred, carat:table, x:z) %>% 
  arrange(price)
