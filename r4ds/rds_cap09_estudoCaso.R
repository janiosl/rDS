library(tidyverse)

#Dataset
who

View(who)


who1 <- who %>%
  gather(
    new_sp_m014:newrel_f65,
    key = "key",
    value = "cases",
    na.rm = TRUE
  )

who1

who1 %>%
  count(key)

#Corrigir newrel para new_rel em key - facilitará a separação
who2 <- who1 %>%
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who2

#Primeira separação das colunas
who3 <- who2 %>%
  separate(key, #Coluna com valores juntos
           c("new", "type", "sexage"), #Valores separados
           sep = "_") #Separador

who3

#Separar sexo e idade
who4 <- who3 %>%
  separate(sexage,
           c("sex", "age"),
           sep = 1)

who4

#Eliminar colunas desnecessárias
who5 <- who4 %>%
  select(-new, -iso2, -iso3) #Eliminar colunas com - em select

who5


##Alternativa simplificada (completa) de tratamento dos dados
who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>%
  mutate(
    code = stringr::str_replace(code, "newrel", "new_rel")
  ) %>%
  separate(code, c("new", "var", "sexage")) %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 1)



#Análise por tipo de caso
who5 %>%
  group_by(type) %>%
  summarize(cases = mean(cases)) %>%
  ggplot() + 
  geom_bar(mapping = aes(x = type, y = cases),
           stat = "identity") +
  ggtitle("Análise por tipo: Geral")


#Análise por país
who5 %>%
  group_by(country) %>%
  summarize(cases = mean(cases)) %>%
  arrange(desc(cases))


who5 %>%
  group_by(country) %>%
  summarize(cases = mean(cases)) %>%
  arrange(desc(cases)) %>%
  ggplot() + 
  geom_bar(mapping = aes(x = country, y = cases),
           stat = "identity") + 
  coord_flip() +
  ggtitle("Análise por país") +
  xlab("Países") + ylab("Casos")


#Análise por país com mais de 1000 casos
who5 %>%
  group_by(country) %>%
  summarize(cases = mean(cases)) %>%
  filter(cases > 1000) %>%
  ggplot() + 
  geom_bar(mapping = aes(x = country, y = cases),
           stat = "identity") + 
  coord_flip() +
  ggtitle("Análise por país com mais de 1000 casos") +
  xlab("Países") + ylab("Casos")

#Análise por tipo de caso do país com mais casos
who5 %>%
  filter(country == "India") %>%
  group_by(type) %>%
  summarize(cases = mean(cases)) %>%
  ggplot() + 
  geom_bar(mapping = aes(x = type, y = cases),
           stat = "identity") +
  ggtitle("Análise por tipo de caso do país com mais casos: Média anual - Índia") +
  xlab("Tipos") + ylab("Casos")


#Análise por tipo de caso dos 3 paises com mais casos
who5 %>%
  filter(country == "India" | country == "China" | country == "South Africa") %>%
  group_by(type) %>%
  summarize(cases = mean(cases)) %>%
  ggplot() + 
  geom_bar(mapping = aes(x = type, y = cases),
           stat = "identity") +
  ggtitle("Análise por tipo de caso dos 3 paises com mais casos: Média anual") +
  xlab("Tipos") + ylab("Casos")



#Análise da evolução ao longo do tempo na Índia e China
who5 %>%
  filter(country == "India") %>%
  select(country, year, cases) %>%
  group_by(year) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(mapping = aes(x = year, y = cases)) + 
  geom_point(position = "jitter") +
  geom_smooth() +
  ggtitle("Análise da evolução ao longo do tempo na Índia") +
  xlab("Anos") + ylab("Casos")



#Análise da evolução ao longo do tempo na Índia
who5 %>%
  filter(country == "China") %>%
  select(country, year, cases) %>%
  group_by(year) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(mapping = aes(x = year, y = cases)) + 
  geom_point(position = "jitter") +
  geom_smooth() +
  ggtitle("Análise da evolução ao longo do tempo na China") +
  xlab("Anos") + ylab("Casos")


#Detalhametno do análise dos 3 países com mais casos
who_top3 <- who5 %>%
  filter(country == "India" | country == "China" | country == "South Africa")


who_top3 %>%
  group_by(country, type, year) %>%
  summarize(cases = sum(cases)) %>%
  ggplot() +
  geom_bar(mapping = aes(x = country, y = cases),
           stat = "identity") +
  ggtitle("Análise por tipo de caso dos 3 paises com mais casos: Soma")


who_top3 %>%
  group_by(country, type, year) %>%
  summarize(cases = sum(cases)) %>%
  ggplot() +
  geom_bar(mapping = aes(x = country, y = cases, fill = type),
           stat = "identity") +
  ggtitle("Análise por tipo de caso dos 3 paises com mais casos: Soma")



#Análise do Brasil
br <- who5 %>%
  filter(country == "Brazil") %>%
  group_by(type, year) %>%
  summarize(cases_sum = sum(cases),
            cases_mean = mean(cases))

br

#Análise por tipo - soma
ggplot(data = br) + 
  geom_bar(mapping = aes(x = type, y = cases_sum),
           stat = "identity") +
  ggtitle("Casos por tipo: Brasil") + 
  xlab("Tipos") + ylab("Soma de Casos")

#Análise por tipo - média
ggplot(data = br) + 
  geom_bar(mapping = aes(x = type, y = cases_mean),
           stat = "identity") +
  ggtitle("Casos por tipo: Brasil") + 
  xlab("Tipos") + ylab("Média de Casos")

#Evolução anual casos por tipo
ggplot(data = br,
       mapping = aes(x = year, y = cases_mean)) + 
  geom_point(position = "jitter", mapping = aes(color = type)) +
  geom_smooth() + 
  ggtitle("Evolução anual casos por tipo: Brasil")

br %>%
  filter(type == "sp") %>%
  ggplot(mapping = aes(x = year, y = cases_mean)) + 
  geom_point() +
  geom_smooth() + 
  ggtitle("Evolução anual casos tipo 'sp': Brasil")
