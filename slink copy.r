install.packages("sparcl")

library(sparcl)

#x = c(3, 5, 6, 10, 12, 17, 2, 4)
#y = c(4, 2, 3, 11, 16, 15, 2, 2)

#data = data.frame(x, y)

data <- iris[, -5]

data

dist_mat = dist(data,
                method = "manhattan",
                diag = TRUE,
                upper = TRUE)

#data = read.csv("/content/adjacency_matrix.csv", header = FALSE)

#data
#dist_mat = as.dist(data)

model = hclust(dist_mat, method = "single")

#model$merge
#model$height
#model$order

#three = cutree(model, 3)
four = cutree(model, 4)

#plot(model, three, hang=-1)

#ColorDendrogram(model, three, branchlength = 20)


ColorDendrogram(model, four, branchlength = 40, labels=iris$Species)