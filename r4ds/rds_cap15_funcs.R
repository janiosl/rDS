##================================================================
##Reprodução de código com funções
##================================================================

#Dataset de exemplo - colunas com valores aleatórios
df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df


# Abordagem de repetição de código ----------------------------------------

#Reescalar uma coluna para rage 0 a 1
df$a_ <- (df$a - min(df$a, na.rm = TRUE)) /
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))

df

#Para repetir a operação para demais colunas o código pode ser copiado
#Depois de copiar devem ser alteradas as referências apontando para a coluna
#correta. Contudo, esta abordagem é muito arriscada. Uma letra errada e...



# Abordagem usando função -------------------------------------------------

rescale01 <- function(x) {
  #Sem tratamento de infinito
  #rng <- range(x, na.rm = TRUE)
  
  #Com tratamento de infinito
  rng <- range(x, na.rm = TRUE, finite = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

rescale01(c(0, 5, 10))

rescale01(df$a)

df$b_ <- rescale01(df$b)
df$c_ <- rescale01(df$c)
df$d_ <- rescale01(df$d)

df

#Correção de erros uma única vez
x <- c(1:10, Inf)
x

rescale01(x)
#Saída com erro, pois o valor Inf (infinito) não é tratado
#[1]   0   0   0   0   0   0   0   0   0   0 NaN

#Repetição após tratamento do erro na função
rescale01(x)
#Saída correta
#[1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
#[8] 0.7777778 0.8888889 1.0000000       Inf


# Execução condicional ----------------------------------------------------
has_name <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !is.na(nms) && nms != ""
  }
}

#Aplicação da função

x <- c(1,2,3)
x
names(x)

has_name(x)

y <- tibble::tribble(
  ~col1, ~col2, ~col3,
  #----/------/-------
  1, 2, 3,
  2, 3, 4,
  3, 4, 5
)

y
names(y)
has_name(y)


#Condições inválidas
#if (c(TRUE, FALSE)) {} #Não roda
#if (NA) {} #Não roda
identical(0L, 0) #Roda, mas o resultado não é intuitivo

#Múltiplas condições
op <- "plus"

opr <- function(x, y, op="plus"){
  switch (op,
    plus = x + y,
    minus = x - y,
    times = x * y,
    divide = x / y,
    stop("Operação desconhecida")
  )
}

a <- 2
b <- 2

opr(a,b)
opr(a,b,"minus")
opr(a,b,"times")
opr(a,b,"divide")

opr(10,7,"minus")
opr(10,7,"times")
opr(10,7,"plus")

# Argumentos de funções ----------------------------------------------------
mean_c <- function(x, conf = 0.95) {
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - conf
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

x <- runif(100) #Dados de exemplo distribuição uniforme
x
plot(x)
hist(x)

mean_c(x)

mean_c(x, 0.99)
