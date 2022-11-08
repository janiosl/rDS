library(modelr)
library(tidyverse)

#Dataset Expectativa de vida
library(gapminder)
gapminder


# Exploração inicial e modelagem de um país -------------------------------
gapminder %>% 
  ggplot(aes(year, lifeExp, group = country)) + 
  geom_line(alpha = 1/3)

br <- filter(gapminder, country == "Brazil")
br

br %>% 
  ggplot(aes(year, lifeExp)) + 
  geom_line() + 
  ggtitle("BR Full data = ")

br_mod <- lm(lifeExp ~ year, data = br)
br_mod

br %>% 
  add_predictions(br_mod) %>% 
  ggplot(aes(year, pred)) + 
  geom_line() + 
  ggtitle("BR Linear trend +")

br %>% 
  add_residuals(br_mod) %>% 
  ggplot(aes(year, resid)) +
  geom_hline(yintercept = 0, color = "red", size = 3) + 
  geom_line() + 
  ggtitle("BR Remaining pattern")


# Dados aninhados ---------------------------------------------------------

by_country <- gapminder %>% 
  group_by(country, continent) %>% 
  nest()

by_country

#Função para modelar cada país
country_model <- function(df) {
  lm(lifeExp ~ year, data = df)
}

models <- map(by_country$data, country_model)

#Adicionar os modelos aos dados aninhados
by_country <- by_country %>% 
  mutate(model = map(data, country_model))

by_country

by_country$data[[15]]
by_country$model[[15]]

by_country %>% 
  filter(continent == "Europe")

#Calcular resíduos
by_country <- by_country %>% 
  mutate(resids = map2(data, model, add_residuals))

by_country

by_country$data[[1]]
by_country$model[[1]]
by_country$resids[[1]]

by_country <- by_country %>% 
  mutate(preds = map2(data, model, add_predictions))

by_country
by_country$preds[[1]]


# Desanhinhar para analisar -----------------------------------------------

#Análise dos resíduos
resids <- unnest(by_country, resids)
resids

resids %>% 
  ggplot(aes(year, resid)) + 
  geom_line(aes(group = country), alpha = 1/3) + 
  geom_smooth(se = FALSE)


resids %>% 
  ggplot(aes(year, resid, group = country)) +
  geom_line(alpha = 1/3) + 
  facet_wrap(~continent)


#Qualidade do modelo
library(broom)
glance(br_mod)

by_country %>% 
  mutate(glance = map(model, glance)) %>% 
  unnest(glance)

#Suprimir colunas iniciais na saída (NÃO FUNCIONA -> RESULTADO IGUAL AO ANTERIOR)
glance_metrics <- by_country %>% 
  mutate(glance = map(model, glance)) %>% 
  unnest(glance, .drop = TRUE)
#.drop argument of `unnest()` is deprecated as of tidyr 1.0.0.
#All list-columns are now preserved.

glance_metrics

#Analisar piores r2
glance_metrics %>% 
  arrange(r.squared)

glance_metrics %>% 
  ggplot(aes(continent, r.squared)) + 
  geom_jitter(width = 0.5)

bad_fit <- filter(glance_metrics, r.squared < 0.25)

gapminder %>% 
  semi_join(bad_fit, by = "country") %>% 
  ggplot(aes(year, lifeExp, color = country)) + 
  geom_line()

