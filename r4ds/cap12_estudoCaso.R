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
