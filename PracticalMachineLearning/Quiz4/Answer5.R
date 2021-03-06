set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)
library(e1071)
library(hydroGOF)
model<-svm(CompressiveStrength~., data=training)
pred<-predict(model, testing)

print(rmse(pred,testing$CompressiveStrength))
