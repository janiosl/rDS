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
  coord_flip()
  
