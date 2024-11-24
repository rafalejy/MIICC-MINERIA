install.packages("arules") #Este paquete contiene reglas de asociacion y kmeans 
library(arules)

data<- read.csvdata <- read.csv('C:/Users/rafal/OneDrive - Facultad de Ingeniería de la Universidad de San Carlos de Guatemala/Escritorio/db_csv_/PERSONA_BDP.csv', sep=",")
 
 
data2 <-  data[ , !(names(data) %in% c("PEA", "POCUPA", "PEI"))]

reglas <- apriori(data2, parameter= list(support=0.2, confidence=0.5) )
inspect(reglas[1700:1800])

cluster <- kmeans ( data2, centers = 3)
