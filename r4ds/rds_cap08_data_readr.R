library(tidyverse)
library(readr)

heights <- read_csv("data/heights.csv")
heights

read_csv(
  "a,b,c
  1,2,3
  4,5,6"
)

meta <- read_csv("metadados.csv",
                 skip = 2)
meta

comments <- read_csv("comments.csv",
                     comment = "#")
comments

noTitle <- read_csv("noTitle.csv",
                    col_names = FALSE)
noTitle

putTitle <- read_csv("noTitle.csv",
                     col_names = c("x", "y", "z"))
putTitle

#Tratamento de valores ausentes
#Sem tratamento
read_csv("a,b,c\n1,2,.")
read_csv("a,b,c\n1,2,-")


#Com tratamento
read_csv("a,b,c\n1,2,.", na = ".")
read_csv("a,b,c\n1,2,-", na = "-")

##========================
##Analisando vetor
##========================
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))
str(parse_date(c("2010-01-01", "1979-10-14")))

#Argumentos adicionais
parse_integer(c("1", "231", ".", "456"), na = ".")

x <- parse_integer(c("123", "231", "abc", "456.77"))
x

#Análise de problemas no parse
problems(x)

#Parse de números
##========================
#Marca de decimal
parse_double("1.23")
parse_double("1,23", locale = locale(decimal_mark = ","))

#Caracteres ao redor (cifrões, percentuais, texto)
parse_number("$100")
parse_number("USD1")
parse_number("R$26700")
parse_number("It cost $123.45")

#Caracteres de agrupamento de milhares
#USA (default)
parse_number("$123,456,789")
#Other countries
parse_number("123.456.789",
             locale = locale(grouping_mark = "."))
#Switzerland
parse_number("123'456'789",
             locale = locale(grouping_mark = "'"))

##Parse de strings
##========================
#Como a string é representada internamente
charToRaw("Hadley")

#Exemplos de caracteres diferentes
x1 <- "El Ni\xf1o was particularly bad this year"
print(x1)
parse_character(x1, locale = locale(encoding = "Latin1"))

x2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"
print(x2)
parse_character(x2, locale = locale(encoding = "Shift-JIS"))

#Descobrir codificação quando você desconhece
guess_encoding(charToRaw(x1))
guess_encoding(charToRaw(x2))

##Parse de data e tempo
##==============================
parse_datetime("2010-10-01T2010")

parse_datetime("20101010")


parse_date("2010-01-10")

#install.packages("hms")
#library(hms)
#hms::parse_time("01:10 am")
#as_hms("01:10")

#Configuração personalizada
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/15", "%y/%m/%d")

date_names_langs()

parse_date("1 janeiro 2015", "%d %B %Y",
           locale = locale("pt"))

#Exemplo de parse com problemas
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)

##Não ocorreu problemas na interpretação
##das colunas (provavelmente devido alguma atualização do pacote)
tail(challenge)

#Se ocorresse o problema poderia ser corrigido especificando as colunas
challenge <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x = col_double(),
                        y = col_date()
                      ))

#Ampliar a análise padrão para readr "advinhar" as colunas
challenge2 <- read_csv(readr_example("challenge.csv"),
                       guess_max = 1001) #n linhas para análise de conteúdo


#Armazenar resultados de maneira simples (sem preservar tipos de dados)
write_csv(challenge,
          "data/challenge.csv")

read_csv("data/challenge.csv")
tail(read_csv("data/challenge.csv"))

#Armazenar resultados de maneira aprimorada (preserva tipos de dados)
write_rds(challenge,
          "data/challenge.rds")

read_rds("data/challenge.rds")
