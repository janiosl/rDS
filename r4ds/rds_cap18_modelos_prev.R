library(tidyverse)
library(modelr)
options(na.action = na.warn)


# Visualização de modelos -------------------------------------------------


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


# Fórmulas e famílias de modelos ------------------------------------------

#Variáveis categóricas
df <- tribble(
  ~sex,    ~response,
  #--------/---------
  "male",   1,
  "female", 2,
  "male",   1
)

df

#Analisando como um modelo com var. categórica é construído
model_matrix(df, response ~ sex)

#Exemplo com dataset sim2
ggplot(sim2) +
  geom_point(aes(x,y))

mod2 <- lm(y ~ x, data = sim2)
mod2

grid <- sim2 %>% 
  data_grid(x) %>% 
  add_predictions(mod2)

grid

#Visualização do modelo
ggplot(sim2, aes(x)) +
  geom_point(aes(y = y)) +
  geom_point(
    data = grid,
    aes(y = pred),
    color = "red",
    size = 4,
    alpha = 1/2
  )


# Interações entre variáveis ----------------------------------------------



#Variáveis contínuas e categóricas 
ggplot(sim3, aes(x1, y)) +
  geom_point(aes(color = x2))

#Modelos possíveis
mod1 <- lm(y ~ x1 + x2, data = sim3)
mod2 <- lm(y ~ x1 * x2, data = sim3)

mod1
mod2

#Predição com ambos modelos
grid <- sim3 %>% 
  data_grid(x1, x2) %>% 
  gather_predictions(mod1, mod2)

grid

#Visualização dos modelos
ggplot(sim3, aes(x1, y, color = x2)) +
  geom_point() +
  geom_line(data = grid, aes(y = pred)) +
  facet_wrap(~ model)

#Cálculo dos resíduos
sim3 <- sim3 %>% 
  gather_residuals(mod1, mod2)

#Visualização dos resíduos
ggplot(sim3, aes(x1, resid, color = x2)) +
  geom_point() +
  facet_grid(model ~ x2)


#Duas variáveis contínuas
mod1 <- lm(y ~ x1 + x2, data = sim4)
mod2 <- lm(y ~ x1 * x2, data = sim4)

mod1
mod2

grid <- sim4 %>% 
  data_grid(
    x1 = seq_range(x1, 5),
    x2 = seq_range(x2, 5)
  ) %>% gather_predictions(mod1, mod2)

grid

#Visualização dos modelos
#Predição baseada na cor
ggplot(grid, aes(x1, x2)) +
  geom_tile(aes(fill = pred)) +
  facet_wrap(~ model)

#Linhas de predição
ggplot(grid, aes(x1, pred, color = x2, group = x2)) +
  geom_line() +
  facet_wrap(~ model)

ggplot(grid, aes(x2, pred, color = x1, group = x1)) +
  geom_line() +
  facet_wrap(~ model)


# Valores faltantes -------------------------------------------------------

df <- tribble(
  ~x, ~y,
  #---/----
  1, 2.2,
  2, NA,
  3, 3.5,
  4, 8.3,
  NA, 10
)

df

lm(y ~ x, data = df)

mod <- lm(y ~ x, data = df, na.action = na.exclude)
mod
nobs(mod)
