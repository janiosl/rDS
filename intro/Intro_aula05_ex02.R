#Working with pipelines
library(dplyr)

data <- create_dataset()
View(data)

data_sd <- create_dataset()

rm(data)
rm(data_sd)

#Pipeline
data_sd <- create_dataset() %>%
  select(variable=Months, value=Delays) %>%
  group_by(variable) %>%
  summarize(sd=sd(value), value=mean(value))

data_sd

#Exercise
#Create a dataframe from the weight and height
weight <- c(60, 72, 57, 90, 95, 72)
height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
health <- data.frame(weight, height)
  
#Filter the data frame such that all tuples are between 1.7 and 1.9 (use function filter)
health_filtered <- dplyr::filter(health, health$height > 1.7 & health$height < 1.9)
View(health_filtered)


#Function melt do prepare data do graphical analysis
install.packages("reshape")
library(reshape)

data <- create_dataset()
head(data)

#Build a group by columns setted in id.vars
data <- melt(data[, c("Year", "Months", "Flights", "Delays", "OnTime", "Perc")],
             id.vars=c(1, 2))


#Joining data frames
divisions <- data.frame(city = c("Rio de Janeiro", "São Paulo", "Paris", "New York", "Tokio"),
                        country = c("Brazil", "Brazil", "France", "US", "Japan"))

View(divisions)

stores <- data.frame(city = c("Rio de Janeiro", "São Paulo", "Paris", "New York", "Tokio"),
                     value = c(10, 12, 20, 25, 18))
head(stores)

#Merging data frames
data <- merge(stores, divisions, by.x="city", by.y="city")
head(data)

#Pipeline
library(dplyr)
result <- data %>%
  group_by(country) %>%
  summarize(count=n(), amount=sum(value))

head(result)
