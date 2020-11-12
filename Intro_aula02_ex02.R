#Criar exemplo de dados com dist normal
height_sample <- rnorm(100000, 1.8, sd=0.2)

#Exibir histograma dos dados
hist(height_sample)

lev <- rep("", length(height_sample))

for (i in 1:length(height_sample)) {
  if (height_sample[i] < 1.7)
    lev[i] <- "short"
  else if (height_sample[i] <1.9)
    lev[i] <- "medium"
  else
    lev[i] <- "tall"
}

library(pryr)
object_size(lev)
#800 kB

head(lev, 10)

rm(lev)

lev <- cut(height_sample,
           breaks=c(0, 1.7, 1.9, .Machine$double.xmax),
           ordered=TRUE)

#Criando nomeclatura para os níveis
levels(lev) <- c("short", "medium", "tall")
head(lev, 10)

object_size(lev)
#401 kB

#Trabalhando com matrizes
#Cria um vetor de 12 observações
x <- 1:12

#Converte o vetor em uma matriz de 3x4
dim(x) <- c(3, 4)

#Criar a matriz diretamente
#Preenchendo observações por linha
x <- matrix(1:12, nrow=3, byrow=TRUE)

#Preenchendo observações por coluna
x <- matrix(1:12, nrow=3, byrow=FALSE)

#Associar nomes
rownames(x) <- LETTERS[1:3]
colnames(x) <- c(1:4)

#Operações com matrizes
#Transpor matriz
t(x)

#Exercício
#Questão 1 - Calcular a determinante da matriz
mat = matrix(c(1, 9, 5, 3, 7, 8, 10, 4, 2),
             nrow=3,
             byrow=TRUE)

det(mat)
determinant(mat)

#Questão 2 - multiplicar um vetor y por uma matriz A
A = matrix(1:9, nrow=3, byrow=TRUE)
y = c(2, 1, 3)

#Multiplicação da matriz pelo vetor
Ay = A * y