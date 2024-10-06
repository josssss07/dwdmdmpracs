#installing the necessary library
install.packages("e1071")
install.packages("gmodels")

library(e1071)
library(gmodels)

data = iris
set.seed(1000)
ind = sample(1:nrow(data), size=nrow(data)*0.95, replace = FALSE, prob = NULL)
training_data = data[ind,]
test_data = data[-ind,]

test_label = test_data[,5]

test_data = test_data[,-5]

?naiveBayes

model = naiveBayes(training_data$Species~.,data=training_data)
model

p = predict(model,test_data)
CrossTable(test_label, p)