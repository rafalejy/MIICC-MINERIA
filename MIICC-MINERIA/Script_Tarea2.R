install.packages("arules") #Este paquete contiene reglas de asociacion y kmeans 
library(arules)

data<- read.csvdata <- read.csv('C:/Users/rafal/OneDrive - Facultad de Ingeniería de la Universidad de San Carlos de Guatemala/Escritorio/db_csv_/PERSONA_BDP.csv', sep=",")
 
 
data2 <-  data[ , !(names(data) %in% c("PEA", "POCUPA", "PEI"))]

reglas <- apriori(data2, parameter= list(support=0.2, confidence=0.5) )
inspect(reglas[1700:1800])

# summary(data )
# 
# inspect(reglas[0:100])
# 
# reglas_2 <- subset(reglas, lhs %pin% "PCH9_H")
# 
# reglas_ordenadas <- sort(reglas_2, by = "confidence", decreasing = TRUE)
# 
# # Inspeccionar las primeras 100 reglas con mayor confianza
# inspect(reglas_ordenadas[100:200])
# 
# data2 <- subset(data, DEPARTAMENTO ==1)
# data2 = data2[,-1]
# 
# reglas2 <- apriori(data2, parameter= list(support=0.2, confidence=0.5) )
# 
# inspect(reglas2[100:200])
