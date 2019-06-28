#installing packages and setting directory
#getwd()
#setwd("C:/R/Unsupervised Learning/")
#getwd()
install.packages("ggplot2")
install.packages("factoextra")
install.packages("purrr")
install.packages("lattice")
install.packages("boot")
install.packages("caret")
install.packages("cluster")
library(lattice)
library(boot)
library(caret)
library(ggplot2)
library(factoextra)
library(purrr)
library(cluster)

#Inputing the data
noise <- read.csv("noisy_moons.csv")

#plotting data and running the unsupervised learning
ggplot(noise,aes(x=V1,y=V2))+
  geom_point(aes(color=V1))
set.seed(123)
km <- kmeans(noise,2,nstart=50)

#cluster
fviz_cluster(km,data=noise)




#Elbow approach

fviz_nbclust(noise, kmeans, method = "wss")




#Gap Statistics

gap_stat <- clusGap(noise, FUN = kmeans, nstart=200,K.max=10,B = 10)
print(gap_stat, method = "firstmax")

fviz_gap_stat(gap_stat)