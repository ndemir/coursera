library(caret)
library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vowel.train$y<-as.factor(vowel.train$y)
vowel.test$y<-as.factor(vowel.test$y)

set.seed(33833)

modelrf<-train(y~., data=vowel.train, method="rf")
modelgbm<-train(y~., data=vowel.train, method="gbm")

predrf<-predict(modelrf, vowel.test)
predgbm<-predict(modelgbm, vowel.test)

accrf<-sum(predrf==vowel.test$y)/nrow(vowel.test)
accgbm<-sum(predgbm==vowel.test$y)/nrow(vowel.test)

acc_aggreement<-sum(predrf==predgbm)/nrow(vowel.test)

print(accrf)
print(accgbm)
print(acc_aggreement)