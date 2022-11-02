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


daily %>% 
  filter(resid < -100)

daily %>% 
  ggplot(aes(date, resid)) +
  geom_ref_line(h = 0, colour = "red") +
  geom_line(color = "grey50") + 
  geom_smooth(se = FALSE, span = 0.20)


#Efeito sazonal (sábados)
daily %>% 
  filter(wday == "sáb") %>% 
  ggplot(aes(date, n)) + 
  geom_point() +
  geom_line() +
  scale_x_date(
    NULL,
    date_breaks = "1 month",
    date_labels = "%b"
  )

#Análise de efeito de períodos de férias
term <- function(date){
  cut(date,
      breaks = ymd(20130101, 20130605, 20130825, 20140101),
      labels = c("spring", "summer", "fall")
      )
}

daily <- daily %>% 
  mutate(term = term(date))

daily

daily %>% 
  filter(wday == "sáb") %>% 
  ggplot(aes(date, n, color = term)) + 
  geom_point(alpha = 1/3) + 
  geom_line() +
  scale_x_date(
    NULL,
    date_breaks = "1 month",
    date_labels = "%b"
  )

#Analisar variável (período/term) com dias da semana
daily %>% 
  ggplot(aes(wday, n, color = term)) + 
  geom_boxplot()


#Comparar modelo com e sem influência de term
mod1 <- lm(n ~ wday, data = daily)
mod2 <- lm(n ~ wday * term, data = daily)
mod1
mod2

daily %>% 
  gather_residuals(without_term = mod1, with_term = mod2) %>% 
  ggplot(aes(date, resid, color = model)) + 
  geom_line(alpha = 0.75)

grid <- daily %>% 
  data_grid(wday, term) %>% 
  add_predictions(mod2, "n")
grid

ggplot(daily, aes(wday, n)) + 
  geom_boxplot() + 
  geom_point(data = grid, color = "red", size = 4, alpha = 0.8) + 
  facet_wrap(~ term)

#Criar modelo robusto a outliers
library(MASS)
mod3 <- rlm(n ~ wday * term, data = daily)

daily %>% 
  add_residuals(mod2, "resid") %>% 
  ggplot(aes(date, resid)) + 
  geom_hline(yintercept = 0, size = 2, color = "green") + 
  geom_line()
