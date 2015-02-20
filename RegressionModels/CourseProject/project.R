library(datasets)
library(ggplot2)
data(mtcars)

mtcars$am <- factor(mtcars$am, labels=c("Automatic", "Manual"))
model<-lm(mpg~., data=mtcars)
stepmodel<-step(model, trace=0)
summ<-summary(stepmodel)
print(summ)

model<-lm(mpg~ am:(wt+qsec),data=mtcars)
print(model)

ttest<-t.test(mpg~am, data=mtcars)
print(ttest)
plt<-ggplot(mtcars, aes(am, mpg, group=am,color=am)) + geom_boxplot()
print(plt)