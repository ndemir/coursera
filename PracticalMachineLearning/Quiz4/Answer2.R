library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)

model_rf<-train(diagnosis~., data=training, method="rf")
model_gbm<-train(diagnosis~., data=training, method="gbm")
model_lda<-train(diagnosis~., data=training, method="lda")

pred_rf_train<-predict(model_rf, training)
pred_gbm_train<-predict(model_gbm, training)
pred_lda_train<-predict(model_lda, training)

comb_data_train<-data.frame(rf=pred_rf_train, gbm=pred_gbm_train, lda=pred_lda_train, diagnosis=training$diagnosis)
model_comb<-train(diagnosis~., data=comb_data_train, method="rf")
pred_comb_train<-predict(model_comb, comb_data_train)


#####
pred_rf_test<-predict(model_rf, testing)
pred_gbm_test<-predict(model_gbm, testing)
pred_lda_test<-predict(model_lda, testing)
comb_data_test<-data.frame(rf=pred_rf_test, gbm=pred_gbm_test, lda=pred_lda_test, diagnosis=testing$diagnosis)
pred_comb_test<-predict(model_comb, comb_data_test)

print("Testing Dataset Accuracy")
print(sum(pred_rf_test==testing$diagnosis)/nrow(testing))
print(sum(pred_gbm_test==testing$diagnosis)/nrow(testing))
print(sum(pred_lda_test==testing$diagnosis)/nrow(testing))
print(sum(pred_comb_test==testing$diagnosis)/nrow(comb_data_test))


