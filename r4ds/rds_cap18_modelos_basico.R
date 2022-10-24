library(tidyverse)
library(modelr)
options(na.action = na.warn)

#Visualização básica dos dados de exemplo
ggplot(sim1, aes(x,y)) + 
  geom_point()

#Observar como modelos lineares aleatórios se ajustam aos dados
models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)


ggplot(sim1, aes(x, y)) + 
  geom_abline(
    aes(intercept = a1, slope = a2),
    data = models, alpha = 1/4
  ) + 
  geom_point()

#Função calcula modelo
model <- function(a, data) {
  a[1] + data$x * a[2]
}

model(c(7, 1.5), sim1)

#Cálculo da distância entre previsão e real baseado em RMSE
measure_distance <- function(mod, data) {
  diff <- data$y - model(mod, data)
  sqrt(mean(diff ^ 2))
}

measure_distance(c(7, 1.5), sim1)

#Avaliar os diversos modelos aleatórios
sim1_dist <- function(a1, a2) {
  measure_distance(c(a1,a2), sim1)
}

models <- models %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

models

#Visualização dos melhores modelos (menor RMSE)
ggplot(sim1, aes(x,y)) +
  geom_point(size = 2, color = "grey30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(models, rank(dist) <= 10)
  )


#Visualização de todos os modelos com destaque para os melhores
ggplot(models, aes(a1, a2)) + 
  geom_point(
    data = filter(models, rank(dist) <= 10),
    size = 4, color = "red"
  ) + 
  geom_point(aes(colour = -dist))


#Busca em grade de modelos
#Modelos dentro do espaço dos melhores da busca aleatória
#Valores gerados como um grid uniformemente espaçado
grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
) %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))


#Visualização de melhores modelos dentro do grid
grid %>% 
  ggplot(aes(a1, a2)) + 
  geom_point(
    data = filter(grid, rank(dist) <= 10),
    size = 4, colour = "red"
  ) + 
  geom_point(aes(color = -dist))


