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
