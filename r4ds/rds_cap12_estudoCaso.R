library(tidyverse)
library(forcats)

#Dataset
gss_cat
?gss_cat

gss_cat %>% 
  count(race)

#Visualização
ggplot(gss_cat, aes(race)) + 
  geom_bar()

#Adicionar níveis sem valores na visualização
ggplot(gss_cat, aes(race)) + 
  geom_bar() +
  scale_x_discrete(drop = FALSE) #Evitar a eliminação de níveis vazios

#Explorar rincome
View(gss_cat)

ggplot(gss_cat, aes(rincome)) + 
  geom_bar() + 
  scale_x_discrete(drop = FALSE) + 
  coord_flip() #Invertido eixo para melhor visualização dos níveis de renda

#Categorias mais comuns
gss_cat %>%
  count(relig, sort = TRUE)

gss_cat %>% 
  count(partyid, sort = TRUE)


#Relig e denom -> identificar relação
gss_cat %>% 
  select(relig, denom)

ggplot(gss_cat, aes(relig, fill=denom)) +
  geom_bar() + 
  coord_flip()

gss_cat %>% 
  filter(denom != "Not applicable") %>% 
  select(relig, denom)

gss_cat %>% 
  filter(denom != "Not applicable") %>% 
  select(relig, denom) %>% 
  count(relig, sort = TRUE)


gss_cat %>% 
  filter(denom != "Not applicable") %>% 
  select(relig, denom) %>% 
  ggplot(aes(relig, fill=denom)) + 
  geom_bar() +
  coord_flip()


#Marital x tvhour
mar_tv <- gss_cat %>% 
  select(marital, tvhours) %>% 
  filter(marital != "No answer") %>% 
  group_by(marital) %>% 
  summarize(tvhour = mean(tvhours, na.rm = TRUE),
            n = n())

mar_tv

ggplot(mar_tv) +
  geom_bar(aes(fct_reorder(marital, tvhour), tvhour),
           stat = "identity")

ggplot(mar_tv, aes(marital, tvhour)) + 
  geom_point()

ggplot(mar_tv, aes(fct_reorder(marital, tvhour), tvhour)) + 
  geom_point()

#Race x relig
gss_cat %>% 
  select(race, relig) %>% 
  group_by(race, relig) %>% 
  summarize(n = n())

