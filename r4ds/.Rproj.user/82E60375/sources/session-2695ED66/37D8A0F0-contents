library(tidyverse)

##===================================
##Juntar com gather
##===================================
#Tabelas usam valores da variável year como colunas
table4a <- tribble(
  ~country, ~"1999", ~"2000",
  ##====/====/====
  "Afeganistão", 745, 2666,
  "Brasil", 37737, 80488,
  "China", 212258, 213766
  ) %>% mutate(
    across("1999", as.integer),
    across("2000", as.integer))


table4b <- tribble(
  ~country, ~"1999", ~"2000",
  ##====/====/====
  "Afeganistão", 19987071, 20595360,
  "Brasil", 172006362, 174504898,
  "China", 1272915272, 1280428583
) %>% mutate(
  across("1999", as.integer),
  across("2000", as.integer))



table4a
table4b

#Ajustando tabelas para torná-las "tidy"
td4a <- table4a %>% 
  gather('1999', '2000',    #Colunas originais
         key = "year",     #Nome da coluna que receberá as colunas antigas
         value = "cases")  #Nome da coluna que receberá os valores

td4b <- table4b %>% 
  gather('1999', '2000',
         key = "year",
         value = "population")

#Unir ambas tabelas em uma nova
td4_j <- left_join(td4a, td4b)
td4_j

##===================================
##Espalhar com spred
##===================================
#Tabela usa mais de uma linha para cada observação (país/ano)
table2 <- tribble(
  ~country, ~year, ~type, ~count,
  #====/====/====/====
  "Afeganistão", 1999, "cases", 745,
  "Afeganistão", 1999, "population", 19987071,
  "Afeganistão", 2000, "cases", 2666,
  "Afeganistão", 2000, "population", 20595360,
  "Brasil", 1999, "cases", 37737,
  "Brasil", 1999, "population", 172006362,
  "Brasil", 2000, "cases", 80488,
  "Brasil", 2000, "population", 174504898,
  "China", 1999, "cases", 212258,
  "China", 1999, "population", 1272915272,
  "China", 2000, "cases", 213766,
  "China", 2000, "population", 1280428583) %>%
  mutate(across("year", as.integer),
         across("count", as.integer))

table2

#Distribuindo os valores e colunas de maneira tidy
spread(table2,
       key = type,
       value = count)


##Exercícios
#2 - O código falha porque 1999 e 2000 estão digitados como inteiros
table4a %>%
  gather(1999, 2000, key = "year", value = "cases")



#4 - Identificar e executar o ajuste necessário na tabela
preg <- tribble(
  ~pregnant, ~male, ~female,
  #----/----/---
  "yes", NA, 10,
  "no", 20, 12
) %>%
  mutate(across(male, as.integer),
         across(female, as.integer))

preg

preg %>% gather(male, female,
                key = "gender",
                value = "count")

##===================================
##Separar dados
##===================================
#Tabela contém mais de um dado na mesma coluna
table3 <- tribble(
  ~country, ~year, ~rate,
  #----/----/----
  "Afeganistão",  1999, "745/19987071",
  "Afeganistão",  2000, "2666/20595360",
  "Brasil",       1999,  "37737/172006362",
  "Brasil",       2000,  "80488/174504898",
  "China",        1999, "212258/1272915272",
  "China",        2000, "213766/1280428583") %>%
  mutate(
    across(year, as.integer)
  )

table3

table3 %>%
  separate(rate, into = c("cases", "population"))

#Declaração específica do caractere separador
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/")

#Conversão das novas colunas em tipos de dados adequados
table3 %>%
  separate(rate,
           into = c("cases", "population"),
           sep = "/",
           convert = TRUE)


#Separete para separar por posição
table3 %>% 
  separate(year,
           into = c("century", "year"),
           sep = 2) #Inteiro lido como posição ao invés de caractere separador


##===================================
##Unir dados
##===================================
#Se houver dados separados em colunas, pode ser feita a união
table5 <- tidyr::table5

table5 %>%
  unite(new, century, year)

#Alterar separador padrão (sem esta mudança será colocado _ entre os valores unidos)
table5 %>%
  unite(new, century, year,
        sep = "")


##EXERCÍCIOS
#1
#Desta forma o valor g na linha 2 será descartado (drop)
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% #Valor extra na segunda linha
  separate(x, c("one", "two", "three"))


#Mescla o conteúdo na última coluna válida
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>%
  separate(x, c("one", "two", "three"),
           extra = "merge")
           
#Padrão preeenche à direita com NA
tibble(x = c("a,b,c", "d,e", "h,i,j")) %>% #Valor ausente na segunda linha
  separate(x, c("one", "two", "three"))

#Define explicitamente o local de preenchimento com NA
tibble(x = c("a,b,c", "d,e", "h,i,j")) %>% #Valor ausente na segunda linha
  separate(x, c("one", "two", "three"),
           fill = "left")


#2
#Usaria o remove = FALSE se as colunas originais forem importantes para análise
table5 %>%
  unite(new, century, year,
        sep = "",
        remove = FALSE)





##===================================
##valores ausentes
##===================================
stocks <- tibble(
  year = c(2015,2015,2015,2015,2016,2016,2016),
  qtr = c(1,2,3,4,2,3,4), #Ausência implícita valor 1 em 2016
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66) #Ausência explícita com NA
)

stocks

#Avaliar melhor a ausência implícita no qtr 1 de 2016
stocks %>%
  spread(year, return)

#Se os valores ausentes não forem relevantes, pode-se remover da análise
stocks %>%
  spread(year, return) %>% #Espalha para evidenciar ausentes
  gather(year, return,
         '2015':'2016',
         na.rm = TRUE) #Configura remoção ao reunir novamente


#Outra forma de evidenciar ausências implícitas
stocks %>%
  complete(year, qtr)


#Usar valores anteriores para completar ausentes
treatment <- tibble(
  person = c("Derrick Whitmore", NA, NA, "Katherine Burke"),
  treatment = c(1,2,3,1),
  response = c(7,10,9,4)) %>%
  mutate(
    across(treatment, as.integer),
    across(response, as.integer)
  )
  

treatment

treatment %>%
  fill(person)
