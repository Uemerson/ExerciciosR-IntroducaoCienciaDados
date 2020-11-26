if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio5.xls", sheet = "Plan1")
head(data)

barplot(height = data$`Nº pessoas`,
        names.arg = data$Marcas,
        main = "Antitérmico preferencial",
        xlab = "Marcas",
        ylab = "Quantidade de Pessoas",
        ylim = c(0,max(data$`Nº pessoas`) + 5))