require(ggplot2)
data <- rbind(G,BFT)
d1<- data[data$Ep=="01&02話",]
d1$Ep <- "01話"
d2 <- d1
d2$Ep <- "02話"
data <- rbind(d1,d2 ,data[-1,])
require(reshape2)
meltdata <- melt(data,id = c("Name","Ep"))
names(meltdata)<- c("Name","Ep","Age","Rate")
p <- ggplot(meltdata)
p+geom_point( aes(Ep,Rate, color=Age))+facet_grid(Name~.)
p+geom_point( aes(Ep,Rate, color=Age, size = Rate,alpha = 0.4))+geom_line( aes(Ep,Rate, group = Age,color=Age))+facet_grid(.~Name)

m <-mean(as.matrix(data[,c(1:10)]))
sum((data[,c(1:10)]-m)^2)/220
