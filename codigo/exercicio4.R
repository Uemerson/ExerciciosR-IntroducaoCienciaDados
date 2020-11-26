if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio4.xls", sheet = "Plan1")
head(data)

print("1. Faça uma distribuição de frequências ")

frequencia_relativa = Freq(data)
print("Construir uma tabela de frequências:")
print(frequencia_relativa)

print("2.O gráfico histograma correspondente")
Freq(data$Salários, breaks = hist(data$Salários, 
                                    plot = TRUE,
                                    main = "Histograma de salários",
                                    ylab = "Frequência",
                                    xlab = "Faixa salarial")$breaks,
     include.lowest = TRUE)