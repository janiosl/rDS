library(tidyverse)
library(forcats)

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
  