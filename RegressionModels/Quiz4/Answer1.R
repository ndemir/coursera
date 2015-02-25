library(MASS)
data(shuttle)

shuttle$use <- factor(shuttle$use, levels = c("auto", "noauto"), labels = c(1, 0))

shuttle$wind<-as.factor(shuttle$wind)
model<-glm(use ~ wind - 1, data=shuttle, family = "binomial")

print( exp(model$coefficients[2])/exp(model$coefficients[1]) )