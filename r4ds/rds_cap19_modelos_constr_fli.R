#Bibliotecas e configuração NA
library(tidyverse)
library(modelr)
options(na.action = na.warn)
library(lubridate)
#Datasets
library(nycflights13)

daily <- flights %>% 
  mutate(date = make_date(year, month, day)) %>% 
  group_by(date) %>% 
  summarize(n = n())

ggplot(daily, aes(date, n)) + 
  geom_line()

#Efeito dia da semana
daily <- daily %>% 
  mutate(wday = wday(date, label = TRUE))

ggplot(daily, aes(wday, n)) + 
  geom_boxplot()

#Modelar efeito do dia da semana
mod <- lm(n ~ wday, data = daily)
mod

grid <- daily %>% 
  data_grid(wday) %>% 
  add_predictions(mod, "n")

grid

ggplot(daily, aes(wday, n)) + 
  geom_boxplot() + 
  geom_point(data = grid, color = "red", size = 10, alpha = 1/5)

#Análise dos resíduos do modelo
daily <- daily %>% 
  add_residuals(mod)

daily %>% 
  ggplot(aes(date, resid)) +
  geom_ref_line(h = 0, colour = "green") +
  geom_line()

ggplot(daily, aes(date, resid, color = wday)) +
  geom_ref_line(h = 0, colour = "green") +
  geom_line()
