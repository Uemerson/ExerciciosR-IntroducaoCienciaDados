if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio2.xls", sheet = "Plan1")
head(data)

# Tabela de frequências absolutas
freq_absoluta = table(data$Casas)

# Função para obter a moda de um conjunto de valores
getmode = function(v) {
  uniqv = unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Medidas de posição: media, media ponderada, mediana, moda
media = mean(data$Casas)
media_ponderada = weighted.mean(data$Casas)
mediana = median(data$Casas)
moda = getmode(data$Casas)

# Medidas de dispersão: amplitude total, desvio médio, variância, desvio padrão, 
# coeficiente de variação
amplitude = range(data$Casas)
desvio_medio = mad(data$Casas)
variancia = var(data$Casas)
desvio_padrao = sd(data$Casas)
coeficiente_variacao = 100*sd(data$Casas)/mean(data$Casas)

#listaValores = c(media, media_ponderada, mediana, moda, amplitude, desvio_medio, variancia, desvio_padrao, coeficiente_variacao)

# Gráfico de Barras
#barplot(
#  listaValores, 
#  names.arg = c("Média", "Média Ponderada", "Mediana", "Moda", "Amplitude 1", "Amplitude 2", "Desvio Médio", "Variância", "Desvio Padrão", "Coeficiente Variação"), 
#  col = gray.colors(10), 
#  sub = "Gráfico exercício 2",  
#  main = "Medidas de posição e dispersão")

plot(data$Casas, main = paste("Média do Tamanho das casas =", media), 
     ylab = "Casas por Quarteirão", xlab = "Tamanho de Casas", ylim = c(0, 100))
abline(v=mean(data$Casas), lwd = 3)

plot(data$Casas, main = paste("Moda do Tamanho das casas =", moda), 
     ylab = "Casas por Quarteirão", xlab = "Tamanho de Casas", ylim = c(0, 100))
abline(h=getmode(data$Casas), lwd = 3)