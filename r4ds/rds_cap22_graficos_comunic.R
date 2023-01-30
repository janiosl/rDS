library(tidyverse)

summary(mpg)


# Acrescentando elementos explicativos ----------------------------------------

#Gráfico simples com titulo
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth() +
  labs(
    title = "Fuel efficiecy generally decreases with engine size")



##Subtítulo e outros elementos
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth() +
  labs(
    title = "Fuel efficiecy generally decreases with engine size",
    subtitle = paste("Two seaters (sports cars) area an exception",
                     "because of their light weight"),
    caption = "Data from fueleconomy.gov"
  )


#Personalizando rótulos dos eixos
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth() +
  labs(
    title = "Fuel efficiecy generally decreases with engine size",
    subtitle = paste("Two seaters (sports cars) area an exception",
                     "because of their light weight"),
    caption = "Data from fueleconomy.gov",
    y = "Highway fuel economy (mpg)",
    x = "Engine displacement (L)",
    colour = "Car type"
  )

#Uso de equações matemáticas
df <- tibble(
  x = runif(10),
  y = runif(10)
)

df

ggplot(df, aes(x,y)) + 
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
  )

## Anotações nos gráficos
#Melhores modelos em cada classe
best_in_class <- mpg %>% 
  group_by(class) %>% 
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = class)) + 
  geom_label(aes(label = model),
             data = best_in_class,
             nudge_y = 2,
             alpha = 0.5) +
  labs(
    x = "Engine displacement (L)",
    y = "High fuel economy (mpg)",
    title = "Best model by class",
    colour = "Car type"
  )


ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(colour = class)) + 
  geom_point(size = 5, shape = 16, data = best_in_class, colour = "red") + 
  ggrepel::geom_label_repel(
    aes(label = model),
    data = best_in_class
  ) +
  labs(
    x = "Engine displacement (L)",
    y = "High fuel economy (mpg)",
    title = "Best model by car type",
    colour = "Car type"
  )


## Marcas dos eixos
### Marcação padrão
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()

### Alteração das marcações
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  scale_y_continuous(breaks = seq(15, 40, by = 5))

### Ocultando os rótulos das marcações
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  scale_y_continuous(breaks = seq(15, 40, by = 5), labels = NULL) +
  scale_x_continuous(labels = NULL)


### Marcação de períodos
presidential %>% 
  mutate(id = 33 + row_number()) %>% 
  ggplot(aes(start, id)) +
  geom_point() + 
  geom_point() + 
  geom_segment(aes(xend = end, yend = id)) + 
  scale_x_date(
    NULL,
    breaks = presidential$start,
    date_labels = "%y"
  )

### Ajustes visuais
presidential %>% 
  mutate(id = 33 + row_number()) %>% 
  ggplot(aes(start, id)) +
  geom_point() + 
  geom_point(aes(colour = name)) + 
  geom_label(aes(label = name), nudge_y = 0.5) +
  geom_segment(aes(xend = end, yend = id, colour = name)) + 
  scale_x_date(
    NULL,
    breaks = presidential$start,
    date_labels = "%Y"
  ) +
  scale_y_continuous(labels = NULL) + 
  labs(y = "Presidente",
       title = "Período de mandato de presidentes americanos",
       subtitle = paste("Início e fim do mandato dos presidente",
                        "americanos \ndesde 1953 até 2020"),
       colour = "Nome") +
  theme(legend.position = "none")

ggsave("presidentes_eua.pdf")

### Mudança em escala de cor
presidential %>% 
  mutate(id = 33 + row_number()) %>% 
  ggplot(aes(start, id, color = party)) + 
  geom_point() + 
  geom_segment(aes(xend = end, yend = id)) + 
  scale_colour_manual(
    values = c(Republican = "red", Democratic = "blue")
  )


#Ajustes de tema
presidential %>% 
  mutate(id = 33 + row_number()) %>% 
  ggplot(aes(start, id)) +
  geom_point() + 
  geom_point(aes(colour = name)) + 
  geom_label(aes(label = name), nudge_y = 0.5) +
  geom_segment(aes(xend = end, yend = id, colour = name)) + 
  scale_x_date(
    NULL,
    breaks = presidential$start,
    date_labels = "%Y"
  ) +
  scale_y_continuous(labels = NULL) + 
  labs(y = "Presidente",
       title = "Período de mandato de presidentes americanos",
       subtitle = paste("Início e fim do mandato dos presidente",
                        "americanos \ndesde 1953 até 2020"),
       colour = "Nome") +
  theme_void()


presidential %>% 
  mutate(id = 33 + row_number()) %>% 
  ggplot(aes(start, id)) +
  geom_point() + 
  geom_point(aes(colour = name)) + 
  geom_label(aes(label = name), nudge_y = 0.5) +
  geom_segment(aes(xend = end, yend = id, colour = name)) + 
  scale_x_date(
    NULL,
    breaks = presidential$start,
    date_labels = "%Y"
  ) +
  scale_y_continuous(labels = NULL) + 
  labs(y = "Presidente",
       title = "Período de mandato de presidentes americanos",
       subtitle = paste("Início e fim do mandato dos presidente",
                        "americanos \ndesde 1953 até 2020"),
       colour = "Nome") +
  theme_classic()



