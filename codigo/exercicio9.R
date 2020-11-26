# Pacote necessário para usar o Freq
if (!('DescTools') %in% installed.packages()) install.packages('DescTools')
library(DescTools)

if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio9.xls", sheet = "Plan1")

print("1. Faça uma distribuição de frequências, por intervalo de classes")
frequencia_relativa = Freq(data$Salários, breaks = 18)
print("Construir uma tabela de frequências,por intervalo de classes:")
print(frequencia_relativa)

print("2.O gráfico histograma correspondente")
Freq(data$Salários, breaks = hist(data$Salários,
                                        breaks = 18,
                                        xlim = c(0, max(data$Salários) + 1),
                                        include.lowest = T,
                                        plot = TRUE,
                                        main = "Histograma dos Salários",
                                        ylab = "Quantidade",
                                        xlab = "Salários (x Sal. mínimo)")$breaks,
     include.lowest = TRUE)