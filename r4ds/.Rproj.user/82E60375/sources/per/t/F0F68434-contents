library(tidyverse)
library(modelr)
options(na.action = na.warn)

grid <- sim1 %>% 
  data_grid(x)
grid

#Modelo explicado no estudo anterior
sim1_mod <- lm(y ~ x, data = sim1)


#Adicionando predições do modelo
grid <- grid %>% 
  add_predictions(sim1_mod)

grid

#Visualização
ggplot(sim1, aes(x)) + 
  geom_point(aes(y = y)) + 
  geom_line(
    aes(y = pred),
    data = grid,
    color = "red",
    size = 1
  )


#Adicionando resíduos do modelo
sim1 <- sim1 %>% 
  add_residuals(sim1_mod)

sim1

#Visualização dos resíduos
ggplot(sim1, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1, aes(x, resid)) + 
  geom_ref_line(h = 0) + 
  geom_point()
