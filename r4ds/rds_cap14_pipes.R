library(magrittr)

##================================================================
##Abordagens alternativas ao pipe
##================================================================
##Abordagem de objetos intermediários
diamonds <- ggplot2::diamonds
diamonds2 <- diamonds %>% 
  dplyr::mutate(price_per_carat = price / carat)

#install.packages("pryr")
pryr::object_size(diamonds)
pryr::object_size(diamonds2)
pryr::object_size(diamonds, diamonds2)

diamonds$carat[1] <- NA
#Repetir linhas 8, 9 e 10 após rodar a alteração acima


##Problema no uso de pipe
#Funções que usam ambiente temporário
assign("x", 10)
x

"x" %>% assign(100)
x

#Definição explícita do ambiente
env <- environment()
"x" %>% assign(100, envir = env)
x

#Funções com lazy evaluation
tryCatch(stop("!"), error = function(e) "An error")

stop("!") %>% 
  tryCatch(error = function(e) "An error")
#ATENÇÃO: O erro previsto no livro não ocorreu - verificar
#talvez o funcionamento de tryCatch ou do pipe tenham sido atualizados


#Uso de Tee para retornar valores intermediários
#Com pipe %>% 
rnorm(100) %>% 
  matrix(ncol = 2) %>% 
  plot() %>% 
  str() #Imprime NULL no prompt, pois não há retorno

#Com Tee %T>%
rnorm(100) %>% 
  matrix(ncol = 2) %T>% 
  plot() %>% 
  str() #Imprime a matriz no prompt

#Uso de %$% para acessar colunas como variáveis
mtcars %$% #Expande as colunas como variáveis
  cor(disp, mpg) #Uso das variáveis em funções R Base

#Atribuição direta
#Explícita
mtcars

mtcars <- mtcars %>% transform(cyl = cyl * 2)
mtcars

#Direta (implícita)
mtcars %<>% transform(cyl = cyl * 2)
mtcars
