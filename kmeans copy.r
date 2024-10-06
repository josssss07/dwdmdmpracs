set.seed(1000)

#x = c(5,3,10,20,5,9,10,21)
#y = c(6,4,5,30,7,4,7,3)

#data = data.frame(x=x, y=y)

#data <- read.csv('kmc_data.csv')

data <- iris[,-5]

centers = 3

model=kmeans(x=data, centers=centers, iter.max = 10, nstart = 1, trace=FALSE)

plot(data$Sepal.Length,data$Petal.Width, col=model$cluster)