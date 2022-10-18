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
