## work with correlation based igraph and corrplot
## to find groups in the field positions and skills
## our-data.RDS is the data set I guess we all work with

# library
install.packages("igraph")
library(igraph)

setwd("~/Desktop/grouping-R")
soc.data <- readRDS("our-data.RDS")
#######
### field positions
### grouping on the basis of (almost) perfect correlation
### should show 10 groups.
names(soc.data[,c(20:45)])
mat<-cor(soc.data[,c(20:45)])
mat[mat<0.999] <- 0
network <- graph_from_adjacency_matrix( mat, weighted=T, mode="undirected", diag=F)
plot(network)

#### for less groups, this should show 4 groups.
names(soc.data[,c(20:45)])
mat<-cor(soc.data[,c(20:45)])
mat[mat<0.95] <- 0
network <- graph_from_adjacency_matrix( mat, weighted=T, mode="undirected", diag=F)
plot(network)

#######
### plots the correlation matrix
# install.packages("corrplot")
library(corrplot)
mat<-cor(soc.data[,c(20:45)])
corrplot(mat, method="circle", order="FPC", tl.col="black")
### how to interprete this? At least 3 groups ... maybe more

#######
### skills
names(soc.data)
names(soc.data[,c(46:79)])
mat<-cor(soc.data[,c(46:79)])
mat[mat<0.75] <- 0
network <- graph_from_adjacency_matrix( mat, weighted=T, mode="undirected", diag=F)
plot(network)
