if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio7.xls", sheet = "Plan1")
head(data)

names(data$Atendimento) = data$Áreas
barplot(height = data$Atendimento,
        main = "Número de pessoas atendidas",
        xlab = "Áreas hospitalares",
        ylab = "Quantidade de Pessoas",
        ylim = c(0,max(data$Atendimento) + 5),
        col = gray.colors(length(data$Áreas)))