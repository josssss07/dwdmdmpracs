data1 =iris

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
set.seed(1000)

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
training_data = training_data[,-5]

#importing class library
library(class)

#setting our model
model = knn(training_data, test_data, train_label, k=11)

#importing gmodels library
install.packages("gmodels") #only reqd for colab
library(gmodels)

#creates and displays detailed table of test
CrossTable(x=test_label, y=model)