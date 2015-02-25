
set.seed(3523)
library(AppliedPredictiveModeling)
library(caret)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

library(elasticnet)
set.seed(233)

model<-train(CompressiveStrength~., data=training, method="lasso")
plot(model$finalModel)
plot.enet(model$finalModel, xvar="penalty", use.color=T)

