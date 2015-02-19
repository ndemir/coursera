library(caret)
library(doMC)
registerDoMC(cores = 4)

training<-read.csv("pml-training.csv", na.strings=c("NA","#DIV/0!",""))
testing<-read.csv("pml-testing.csv", na.strings=c("NA","#DIV/0!",""))

#remove first five columns
training<-training[,-c(1:5)]

#calculate mean for each integer and numerics columns
#assigns means to NAs
for (colName in names(training)){
  
  if(class(training[[colName]]) %in% c("integer", "numeric")){
    m<-mean(training[[colName]], na.rm = TRUE)
    training[[colName]][is.na(training[[colName]])]<-m
  }
  
}

training<-training[,-nearZeroVar(training)]

index <- createDataPartition(y=training$classe, p=0.6, list=FALSE)
trainingData <- training[index, ]
testingData <- training[-index, ]

train_control <- trainControl(method="cv", number=3)
model <- train(classe~., data=trainingData, method="rf", trControl = train_control)

prediction <- predict(model, trainingData, type="raw")
c<-confusionMatrix(prediction, trainingData$classe)
print("In Sample Error Rate")
print(1-c[["overall"]][["Accuracy"]])

prediction <- predict(model, testingData, type="raw")
c<-confusionMatrix(prediction, testingData$classe)
print("Out of Sample Error Rate")
print(1-c[["overall"]][["Accuracy"]])

#generate data for submitting
prediction <- predict(model, testing, type="raw")

for (i in seq(20)){
  fileName<-paste("problem",i,".txt",sep="_")
  write.table(prediction[i],file=fileName,quote=FALSE,row.names=FALSE,col.names=FALSE)
}