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

##Abordagem de repetição de código
#Reescalar uma coluna para rage 0 a 1
df$a <- (df$a - min(df$a, na.rm = TRUE)) /
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))

df

#Para repetir a operação para demais colunas o código pode ser copiado
#Depois de copiar devem ser alteradas as referências apontando para a coluna
#correta. Contudo, esta abordagem é muito arriscada. Uma letra errada e...

