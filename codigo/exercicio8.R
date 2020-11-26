if (!('DescTools') %in% installed.packages()) install.packages('DescTools')
library(DescTools)

if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio8.xls", sheet = "Plan1")
head(data)

print("1. Faça uma distribuição de frequências, por intervalo de classes")

frequencia_relativa = Freq(data$`Altura dos pacientes`)
print("Construir uma tabela de frequências,por intervalo de classes:")
print(frequencia_relativa)

print("2.O gráfico histograma correspondente")
Freq(data$`Altura dos pacientes`, breaks = hist(data$`Altura dos pacientes`, 
                                            plot = TRUE,
                                            main = "Histograma de alturas",
                                            ylab = "Frequência",
                                            xlab = "Altura dos Pacientes")$breaks,
     include.lowest = TRUE)