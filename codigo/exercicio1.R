if(!("readxl") %in% installed.packages()) install.packages("readxl")
library(readxl)

data = read_excel("../dados/exercicio1.xls", sheet = "Plan1")
head(data)

# Faz o calculo da media
media = mean(data$`Taxas de juros`)

# Faz o calculo da mediana
mediana = median(data$`Taxas de juros`)

# Faz o calculo do desvio padrao
desvio_padrao = sd(data$`Taxas de juros`)

# Faz o calculo da variancia
variancia = var(data$`Taxas de juros`)

# Traz o valor máximo e mínimo, respectivamente
maximo = max(data$`Taxas de juros`)
minimo = min(data$`Taxas de juros`)

# Faz o calculo dos Quartis 25%, 50%, 75% respectivamente
q1 = quantile(data$`Taxas de juros`, probs = 0.25)
q2 = quantile(data$`Taxas de juros`, probs = 0.50)
q3 = quantile(data$`Taxas de juros`, probs = 0.75)

head(media)
head(mediana)
head(desvio_padrao)
head(variancia)
head(minimo)
head(maximo)
head(q1)
head(q2)
head(q3)

head(summary(data$`Taxas de juros`))

#Gráfico da média e mediana
boxplot(data, 
        ylab="Taxas de juros", 
        xlab = "Média em vermelho, mediana em azul",
        main = "Taxas de Juros Recebidas em Ações")
abline(h=mean(data$`Taxas de juros`), lwd = 1, col="red")
abline(h=median(data$`Taxas de juros`), lwd = 1, col="blue")

listaValores = c(desvio_padrao, variancia, minimo, maximo, q1, q3)

# Gráfico do desvio padrão, variância, mínimo. máximo, Q1 e Q3
barplot(
  listaValores, 
  names.arg = c("Desvio padrão", "Variância", "Mínimo", "Máximo", "Q1", "Q3"), 
  col = gray.colors(6), 
  sub = "Desvio padrão, variância, mínimo. máximo, Q1 e Q3",  
  main = "Taxas de Juros Recebidas em Ações")