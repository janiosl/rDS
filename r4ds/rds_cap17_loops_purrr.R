library(tidyverse)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df


# Loop for básico ---------------------------------------------------------

output <- vector("double", ncol(df))

for (i in seq_along(df)) {
  output[[i]] <- median(df[[i]])
}

output

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

for (i in seq_along(df)) {
  df[[i]] <- rescale01(df[[i]])
}

#Comprimento desconhecido
means <- c(0,1,2)

out <- vector("list", length(means))

for (i in seq_along(means)) {
  n <- sample(100, 1)
  out[[i]] <- rnorm(n, means[[i]])
}

str(out)
str(unlist(out))


# Loop while --------------------------------------------------------------
#Função cara ou coroa
flip <- function() sample(c("T", "H"), 1)
flips <- 0
nheads <- 0

#Loop enquanto coroas < 3
while (nheads < 3) {
  if (flip() == "H") {
    nheads <- nheads + 1
  } else {
    nheads <- 0
  }
  flips <- flips + 1
}

flips


# Abordagem funcional -----------------------------------------------------

#Iteração e função como argumento de outra função
col_summary <- function(df, fun){
  out <- vector("double", length(df))
  for (i in seq_along(df)) {
    out[i] <- fun(df[[i]])
  }
  out
}

col_summary(df, median)
col_summary(df, mean)


# Funções Map -------------------------------------------------------------

map_dbl(df, mean)
map_dbl(df, median)

#Map usando pipe
df %>% map_dbl(mean)

df %>% map_dbl(median)

df %>% map_dbl(sd)


#Tratamento de falhas
safe_log <- safely(log) #Cria versão segura da função
safe_log(10)

safe_log("a")

#Map + Safe
x <- list(1, 10, "a")
y <- x %>% map(safely(log))

str(y)

#Separação dos resultados (results e errors)
y <- y %>% transpose()
str(y)
y$result


#Possibly
x <- list(1, 10, "a")
x %>% map_dbl(possibly(log, NA_real_))

#Quietly
x <- list(1, -1)
x %>% map(quietly(log)) %>% str()


# Map com múltiplos argumentos --------------------------------------------

#Variando apenas a média no map
mu <- list(5, 10, -3)
mu %>% 
  map(rnorm, n = 5) %>% 
  str()

#Variando média e desvio padrão
sigma <- list(1,5,10)

map2(mu, sigma, rnorm, n = 5)

#Variando mais argumentos com pmap
n <- list(1,3,5)

args1 <- list(n,mu,sigma)
args1

args1 %>% 
  pmap(rnorm) %>% 
  str()

#Nomeando argumentos
args2 <- list(mean = mu, sd = sigma, n = n)
args2

args2 %>% 
  pmap(rnorm) %>% 
  str()

#Usando data frame
params <- tribble(
  ~mean, ~sd, ~n,
  #-----/----/-----
  5, 1, 1,
  10, 5, 3,
  -3, 10, 5
)

params

params %>% 
  pmap(rnorm)


# Mapeando múltiplas funções ----------------------------------------------

f <- c("runif", "rnorm", "rpois")

param <- list(
  list(min = -1, max = 1),
  list(sd = 5),
  list(lambda = 10)
)

invoke_map(f, param, n = 5) %>% str()

#Organizando funções e argumentos
sim <- tribble(
  ~f, ~param,
  #---/------
  "runif", list(min = -1, max =1),
  "rnorm", list(sd = 5),
  "rpois", list(lambda = 10)
)

sim

sim %>% 
  mutate(sim = invoke_map(f, param, n = 10))


# Reduce e Acumulate ------------------------------------------------------

dfs <- list(
  age = tibble(name = "John", age = 30),
  sex = tibble(name = c("John", "Mary"), sex = c("M", "F")),
  trt = tibble(name = "Mary", treatment = "A")
)

dfs

df <- dfs %>% reduce(full_join)
df

df %>% 
  filter(name == "Mary") %>% 
  mutate(age = 27)


vs <- list(
  c(1,3,5),
  c(1,3,5,7),
  c(1,3,5,7,9)
)

vs

vs %>% reduce(intersect)

