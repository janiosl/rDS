# packages needed for chapter 1
library(dplyr)
library(tidyr)
library(ggplot2)


#install.packages("vioplot")
library(vioplot)
#install.packages("ascii")
library(ascii)
library(corrplot)


getwd()
setwd("GitHub/rDS/estat_ds")


# Import the datasets needed for chapter 1
PSDS_PATH <- file.path('~', 'GitHub/rDS/estat_ds')
#dir.create(file.path(PSDS_PATH, 'figures'))

lc_loans <- read.csv(file.path(PSDS_PATH, 'data', 'lc_loans.csv'))

#install.packages("descr")
library(descr)

x_tab <- CrossTable(lc_loans$grade, lc_loans$status,
                    prop.c = FALSE, prop.chisq = FALSE, prop.t = FALSE)

x_tab
