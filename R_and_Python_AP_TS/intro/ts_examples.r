path <- "D:\\R\\R_and_Python_AP_TS"
setwd(path)


#Absenteeism
file <- "Absenteeism_at_work_AAA\\Absenteeism_at_work.csv"
ts <- read.csv(file,
               sep = ";")



#Oil prices
#file <- "Timeseries\\comp-engine-export-datapoints-d737c.csv"
file <- "Timeseries\\comp-engine-export-datapoints-d737c_adj.xlsx"

#ts_oil_prices <- read.csv(file, sep = ",")
ts_oil_prices <- readxl::read_xlsx(file)
ts_oil_prices$datapoints <- as.numeric(ts_oil_prices$datapoints)
ts_oil_prices$time <- c(1:length(ts_oil_prices$datapoints))
str(ts_oil_prices)

plot(ts(ts_oil_prices$datapoints),
     type="l",
     xlab="time",
     ylab="Crude oil prices")


test <- subset(ts_oil_prices, select=c(time, datapoints))


##================================
##FBI
##================================
#Simple execution for tests
events_fbi <- evtdet.fbi(test, w=30, alpha=1.5, na.action=na.omit)
plot(evtplot(test, events_fbi))


#M4-Competition: M4Comp2018
#install.packages("M4comp2018")
install.packages("https://github.com/carlanetto/M4comp2018/releases/download/0.2.0/M4comp2018_0.2.0.tar.gz",
                 repos=NULL)

library(forecast)
library(M4comp2018)
data(M4)
M4[[2]]$period
str(M4[[2]])


serie <- ts(M4[[2]]$x,
            start = start(M4[[2]]$x),
            frequency = frequency(M4[[2]]$x))

# Gráfico usando autoplot
autoplot(serie)

