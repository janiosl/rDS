library(ggplot2)

ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(aes(colour = class))

install.packages("tidyverse")

install.packages(c("nycflights13", "gapminder", "Lahman"))
