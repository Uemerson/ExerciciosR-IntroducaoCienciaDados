if (!('DescTools') %in% installed.packages()) install.packages('DescTools')
library(DescTools)

if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio3.xls", sheet = "Sheet1")
head(data)

print("1. Calcular a mediana do número de filhos;")
frequencia_relativa <- Freq(as.table(data$Famílias))
print("Construir uma tabela de frequências:")
print(frequencia_relativa)

print(paste("Total: ", sum(frequencia_relativa$freq)))
print("(a) Dividindo o total por 2, teremos a posição onde a mediana se encontra.")
media <- sum(frequencia_relativa$freq)/2
print(paste("Média: ", media))
print("Buscando na frequência acumulada,")
indice <- min(which(frequencia_relativa$cumfreq >= sum(frequencia_relativa$freq)/2))
print(paste0("Percebemos que o valor ",media, " está no grupo: ", indice, " de frequência acumulada: ", frequencia_relativa$cumfreq[indice]))
print(paste0("No grupo de família de frequência absoluta ",frequencia_relativa$freq[indice] ,", portanto, com ", data$Filhos[indice], " filhos."))
print("Então, esta será nossa mediana:")
print("Mediana = 2")

boxplot(data$Filhos, main = "Gráfico de Famílias", ylab="Número filhos")
abline(h=mean(data$Filhos,na.rm = TRUE), lwd = 3, col="red")
plot(data$Filhos, ylab="Número filhos",main = "Gráfico de Famílias")
abline(h=mean(data$Filhos,na.rm = TRUE), lwd = 3, col="red")

#Outros gráficos
plot(data$Famílias, 
     main = "Gráfico de Famílias",
     xlab = "famílias",
     ylab = "Quantidade")
abline(v=mean(data$Filhos,na.rm = TRUE), lwd = 3, col="red")

barplot(data$Famílias,  main = "Gráfico de Famílias",
        xlab = "famílias",
        ylab = "Quantidade e Média")
abline(v=mean(data$Filhos,na.rm = TRUE), lwd = 3, col="red")

print("2. A moda do número de filhos:")
print("A moda é o valor da classe que mais se repete.")
print(paste0("Buscando na tabela, percebemos que a repetição maior, está na família com ", data$Filhos[indice]," filhos"))
print(paste0("pois repete ",frequencia_relativa$freq[indice] ," vezes (Coincidiu com a Mediana)."))
print("Portanto, a moda = 2")