install.packages("gmodels")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("rattle")
install.packages("party")
install.packages("class")


library(rpart)
library(rpart.plot)
library(rattle)
library(party)
library(class)
library(gmodels)


data1 = iris

#obtain a summary of the data
summary(data1)


#function to normalize values
normalise = function(data_col){
  return((data_col-min(data_col))/(max(data_col)-min(data_col)))
}

data1$Sepal.Length=normalise(data1$Sepal.Length)
data1$Sepal.Width =normalise(data1$Sepal.Width)
data1$Petal.Length=normalise(data1$Petal.Width)
data1$Petal.Width=normalise(data1$Petal.Width)

#by including the following you can ensure the same answer and data set for everyone
set.seed(1000000001)

#shuffling the data
da=sample(1:nrow(data1), size = nrow(data1)*0.9)

#splitting data into training and test data
training_data = data1[da, ]
test_data = data1[-da, ]


#preparing training and test data
#pushing output into test_label
test_label = test_data[,5]
#removing output col  from test data
test_data = test_data[,-5]

#same for training data
train_label = training_data[,5]

#setting our model
model = ctree(training_data$Species~.,data=training_data)

#plot the tree
plot(model)

#prediction
p =predict(model,test_data)
CrossTable(test_label, p)


#second method using rpart
model = rpart(training_data$Species~., data = training_data)
fancyRpartPlot(model)