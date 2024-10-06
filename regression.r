data = data.frame(
  x = c(25,28,35,32,31,36,29,38,34,32),
  y = c(43,46,49,41,36,32,31,30,33,39)
)
model = lm(formula = y ~ x, data=data)
test = data.frame(x=40)
predict(model,test)



#-----------------------------------
#q2
#loading the data
data = read.csv("boston.csv")
#creating training data
train_data = data[1:504,]
#creating test data
test_data = data[505:506,]
#to predict the value of only the 50th row which is also part of the training data
#test_data = data[50]
test_data = test_data[,-14]
#creating model
model = lm(MEDV~. , data=train_data)
#predicting the values for the last column's last two rows
predict(model,test_data)
