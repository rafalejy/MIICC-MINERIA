install.packages("arules") #Este paquete contiene reglas de asociacion y kmeans 
library(arules)

data<- read.csvdata <- read.csv('C:/Users/rafal/OneDrive - Facultad de Ingeniería de la Universidad de San Carlos de Guatemala/Escritorio/db_csv_/PERSONA_BDP.csv', sep=",")


data2 <-  data[ , !(names(data) %in% c("PEA", "POCUPA", "PEI"))]

reglas <- apriori(data2, parameter= list(support=0.2, confidence=0.5) )
inspect(reglas[1700:1800])



head (data2, n=10)

install.packages("ggplot2")
library(ggplot2)

data3 <- data2[, c("ANEDUCA", "PCP26_C")]
data3 <- na.omit(data3)

cluster <- kmeans ( data3, centers = 3)

print(
ggplot(data3, aes(x = PCP26_C, y = ANEDUCA, color = as.factor(cluster$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster$centers), aes(x=PCP26_C, y = ANEDUCA), color = "black", size=4, shape=17)+
  labs(title = "Edad vs Nota final")+
  theme_minimal()
)

g <- ggplot(data3, aes(x = PCP26_C, y = ANEDUCA, color = cluster_col)) +
  geom_point() +
  geom_point(data = as.data.frame(cluster$centers), aes(x = PCP26_C, y = ANEDUCA), color = "black", size = 4, shape = 17) +
  labs(title = "Edad vs Nota final") +
  theme_minimal()

ggsave("grafica.png", plot = g, width = 8, height = 6)

g

