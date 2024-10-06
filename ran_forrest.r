library(caret)
library(randomForest)
 
model = randomForest(Species~.,data=iris, ntree=100, mtry=2)
pred = predict(model, iris)
 
confusionMatrix(pred, iris$Species)
 
