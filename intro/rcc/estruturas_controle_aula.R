x = 20

if (x<20) {"Este número é menor que 20."}

if (x<20) " Este número é menor que 20"

if (x<20){
  "este número é menor que 20"
}else{"Não sei dizer."}


if (x<20){
  "este número é menor que 20"
}else if(x==20){
  "este número é igual a 20"
}else {"Este número é maior que 20."}


x<- 120

ifelse(x>50,"Este número é maior que 50.","Não sei dizer")

x<- c(5,8,25,18,23,37)


ifelse(x%%3==0,"O número é múltiplo de 3.",ifelse(x%%5==0,
      "Este número é múltiplo de 5",
       NA))


for (i in 1:20 ){print(i)}



for (i in rnorm(10)){print(i*2)}

for (i in 1:50){
  if (i%%3==0|i%%5==0)
    next
  print(i)
}


x<-1

for (i in 1:50){
  
  x<- x + i
  
  if(x>60)
    break
  print(x)
}


x<- 1

y<- 1


repeat{
  x <- x*1.01
  y<- y + 1
  if(x>1.40)
    break
  print(x)
  print(y)
}


x<-1
y<-0

while (x>0){
  x<- x*1.01
  y<- y + 1
  print(x)
  print(y)
}


library(zoo)
library(dplyr)
library(tidyr)
library(data.table)


petr4<- read.csv('petr4.csv')

tail(petr4)


petr4<- petr4%>%mutate(sma = rollapply(petr4['close'],FUN=mean,
                                       width=9,fill=NA,align= 'right'))

petr4<- petr4%>%mutate(lma = rollapply(petr4['close'],FUN=mean,
                                       width = 18,fill=NA, align = 'right'))

petr4<- petr4%>%mutate(previous_sma = shift(petr4$sma,n = 1,type='lag'))

petr4<- petr4%>%mutate(previous_lma = shift(petr4$lma,n=1,type = 'lag'))


petr4<- drop_na(petr4)


petr4$signal<- NA


inicio<- proc.time()

for (i in 1:nrow(petr4)){
  
  if(petr4[i,'sma']>petr4[i,'lma']&petr4[i,'previous_sma']<petr4[i,'previous_lma'])
  {petr4[i,'signal']<- 'Buy'
  }else
    if(petr4[i,'sma']<petr4[i,'lma']&petr4[i,'previous_sma']>petr4[i,'previous_lma']){
      petr4[i,'signal']<- 'Sell'
    }
}

proc.time()-inicio


petr4<- read.csv('petr4.csv')


petr4<- petr4%>%mutate(sma = rollapply(petr4['close'],FUN=mean,
                                       width=9,fill=NA,align= 'right'))

petr4<- petr4%>%mutate(lma = rollapply(petr4['close'],FUN=mean,
                                       width = 18,fill=NA, align = 'right'))

petr4<- petr4%>%mutate(previous_sma = shift(petr4$sma,n = 1,type='lag'))

petr4<- petr4%>%mutate(previous_lma = shift(petr4$lma,n=1,type = 'lag'))


petr4<- drop_na(petr4)


petr4$signal<- NA



calcula_sinal<- function(sma,lma,previous_sma,previous_lma){
  
  if(sma>lma & previous_sma<previous_lma){
    return('Buy')
  }else if(sma<lma&previous_sma>previous_lma)
    return('Sell')
}


inicio<- proc.time()
petr4$signal<- mapply(FUN = calcula_sinal,sma = petr4$sma, lma = petr4$lma,
                      previous_sma = petr4$previous_sma, previous_lma= petr4$previous_lma)

proc.time() - inicio







