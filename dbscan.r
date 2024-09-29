x_cor = c(dim=c(720))
y_cor = c(dim=c(720))

install.packages("fpc")
library(fpc)

for(i in 1:360)
{
  x_cor[i] = 3*cos(i)
  y_cor[i] = 3*sin(i)
  x_cor[i+360]=6*cos(i)
  y_cor[i+360]=6*sin(i)
}

plot(x_cor,y_cor)
data = data.frame(x_cor,y_cor)
#summary(data)
dist_data = dist(data,method='euclidean')
#kmeans
model = kmeans(data,2)
plot(data$x_cor,data$y_cor,col=model$cluster)

Dbscan_cl <- dbscan(data,eps=0.45,MinPts=5)
plot(data$x_cor,data$y_cor,col=Dbscan_cl$cluster)

iris_1 <- iris[-5]
iris_1 = data.frame()
dist_data = dist(iris_1,method='euclidean')
model = dbscan(dist_data,eps=10.0,MinPts =10)
plot(iris_1$Sepal.Length,iris_1$Petal.Length,col=model$cluster)