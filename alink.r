install.packages("sparcl")
library(sparcl)

#x = c(3, 5, 6, 10, 12, 17, 2, 4)
#y = c(4, 2, 3, 11, 16, 15, 2, 2)

#data = data.frame(x, y)

data <- iris[, -5]

dist_mat = dist(data,
                method = "manhattan",
                diag = TRUE,
                upper = TRUE)

model = hclust(dist_mat, method = "average")

#model$merge
#model$height
#model$order

#three = cutree(model, 3)
four = cutree(model, 4)

#plot(model, three, hang=-1)

#ColorDendrogram(model, three, branchlength = 20)
ColorDendrogram(model, four, branchlength = 20)