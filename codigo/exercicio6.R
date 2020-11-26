if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

#Pacote necessário para usar o diagrama de pareto
if(!("qcc") %in% installed.packages()) install.packages("qcc")
library(qcc)

data = read_excel("../dados/exercicio6.xls", sheet = "Plan1")
head(data)

names(data$`Nº pessoas`) = data$Qualidade
pareto.chart(data$`Nº pessoas`, 
             ylab = "Quantidade de Pessoas",
             ylab2 = "Percentual cumulativo",
             cumperc = seq(0, 100, by = 5),
             main = "Classificação do atendimento recebido", 
             col = gray.colors(length(data$Qualidade)),
             plot = TRUE)