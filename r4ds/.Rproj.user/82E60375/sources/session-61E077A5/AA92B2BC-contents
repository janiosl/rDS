library(tidyverse)
library(forcats)


##=====================================
#Reoarnando fatores
##=====================================
relig <- gss_cat %>% 
  group_by(relig) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

relig

ggplot(relig, aes(tvhours, relig)) +
  geom_point()

#Reoarnando fatores para visualização
ggplot(relig, aes(tvhours, fct_reorder(relig, tvhours))) + 
  geom_point()


#Reordenando fora da visualização para melhor organização
relig %>% 
  mutate(relig = fct_reorder(relig, tvhours)) %>% 
  ggplot(aes(tvhours, relig)) +
  geom_point()


#Ajustar nível específico
rincome <- gss_cat %>% 
  group_by(rincome) %>% 
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

rincome

#Orignal
ggplot(rincome,
       aes(age, rincome)) + 
  geom_point()

#Ajustada posição de não aplicável
ggplot(rincome,
       aes(age, fct_relevel(rincome, "Not applicable"))) + 
  geom_point()
  

by_age <- gss_cat %>% 
  filter(!is.na(age)) %>% 
  group_by(age, marital) %>% 
  count() %>% 
  mutate(prop = n/sum(n)) #Verificar este cálculo (não está correto)

by_age

ggplot(by_age,
       aes(age, prop, color = marital)) + 
  geom_line(na.rm = TRUE)

ggplot(by_age,
       aes(age, prop, color = fct_reorder2(marital, age, prop))) +
  geom_line() +
  labs(color = "marital")


gss_cat %>% 
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>% 
  ggplot(aes(marital)) +
  geom_bar()

##=====================================
##Modificar níveis
##=====================================
gss_cat %>% count(partyid)

#Mudar níveis
gss_cat %>% 
  mutate(
    partyid = fct_recode(
      partyid,
      "Republican, strong" = "Strong republican",
      "Republican, weak" = "Not str republican",
      "Independent, near rep" = "Ind,near rep",
      "Independent, near dem" = "Ind,near dem",
      "Democrat, weak" = "Not str democrat",
      "Democrat, strong" = "Strong democrat"
                              )) %>% 
  count(partyid)

#Recombinar grupos de níveis
gss_cat %>% 
  mutate(
    partyid = fct_recode(
      partyid,
      "Republican, strong" = "Strong republican",
      "Republican, weak" = "Not str republican",
      "Independent, near rep" = "Ind,near rep",
      "Independent, near dem" = "Ind,near dem",
      "Democrat, weak" = "Not str democrat",
      "Democrat, strong" = "Strong democrat",
      "Other" = "No answer",
      "Other" = "Don't know",
      "Other" = "Other party"
    )) %>% 
  count(partyid)

#Agrupar diversos níveis
gss_cat %>% 
  mutate(partyid = fct_collapse(partyid,
    other = c("No answer","Don't know","Other party"),
    rep = c("Strong republican","Not str republican"),
    dem = c("Not str democrat","Strong democrat"),
    ind = c("Ind,near rep","Ind,near dem")
  )) %>% 
  count(partyid)


#Agrupar todos os níveis pequenos
#Mantém apenas dois grupos
gss_cat %>% 
  mutate(relig = fct_lump(relig)) %>% 
  count(relig)

#Agrupar sem "excesso" definindo quantidade de grupos
gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 3)) %>% #n define grupos
  count(relig, sort = TRUE) %>% #sort ordena o resultado
  print(n = Inf) #Inf permite visualizar todos os grupos do resultado
