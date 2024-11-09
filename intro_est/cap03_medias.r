#Médias
# #Média aritmética ------------------------------------------------------
x = c(10,60,360)
media = sum(x)/length(x)
media

mean(x)


# Média harmônica ---------------------------------------------------------
#Dados
x = c(10, 60, 360)

#Média harmônica (xh)
#h = n / soma(1/xi, 1/x2, ..., 1/xn)
#Pág. 134 cap4 - Estatística Básica

#Cálculo manual
n <- length(x)
soma_1_x<- 1/x
soma_1_x <- sum(soma_1_x)
h = n / soma_1_x
h

#Função para cálculo da média harmonica de x
harmonica <- function(x) {
  n <- length(x)
  h <- n / sum(1/x)
  return(h)
}


harmonica(x)

#Comparação
plot(x, type="l", main = "Médias de x")
lines(rep(h, 3), col="lightblue")
lines(rep(mean(x), 3), col="red")
legend("center", lty=1,
       legend = c("x", "harmônica", "aritmética"),
       col = c("black", "lightblue", "red"))


# #Média ponderada --------------------------------------------------------
#Média aritmética ponderada
#soma(dados * pesos) / soma(pesos)
notas <- c(8,7,9,9)
pesos <- c(1,2,3,4)
n_p <-notas * pesos 
n_p

media_ponderada <- sum(n_p)/sum(pesos)
media_ponderada

#Função para cálculo da média ponderada x com pesos w
ponderada <- function(x,w){
  np <- x*w
  mp <- sum(np)/sum(w)
  return(mp)
}


ponderada(notas, pesos)


#Comparação notas
plot(notas, type="l", main = "Notas", ylim=c(0,10))
lines(rep(harmonica(notas), 4), col="lightblue")
lines(rep(mean(notas), 4), col="red")
lines(rep(ponderada(notas, pesos), 4), col="blue")
legend("center", lty=1,
       legend = c("Notas", "Média harmônica", "Média aritmética", "Média ponderada"),
       col = c("black", "lightblue", "red", "blue"))


#Comparação notas
plot(notas, type="l", main = "Notas")
lines(rep(harmonica(notas), 4), col="lightblue")
lines(rep(mean(notas), 4), col="red")
lines(rep(ponderada(notas, pesos), 4), col="blue")
legend("bottomright", lty=1,
       legend = c("Notas", "Média harmônica", "Média aritmética", "Média ponderada"),
       col = c("black", "lightblue", "red", "blue"))





#Análise de grandezas inversas
setor <- c("A", "B")
produtividade <- c(15,20)
erros <- c(2,9)



producao <- data.frame(setor=setor,
                       produtividade=produtividade,
                       erros=erros)

producao

producao$meta = 25
producao


producao$qualidade = (producao$produtividade - producao$erros) / producao$produtividade
producao$atingimento <- producao$produtividade / producao$meta
producao


harmonica(producao[1,c("qualidade", "atingimento")])
harmonica(producao[2,c("qualidade", "atingimento")])


mean(c(0.8667,0.6))
mean(c(0.55,0.8))



#Análise de modelos de algoritmos de classificação
precisao <- c(0.8, 0.95)
recall <- c(0.6, 0.3)

#Cálculo do F1 score
harmonica(c(precisao[1], recall[1]))
harmonica(c(precisao[2], recall[2]))
