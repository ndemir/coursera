library(MASS)
data(shuttle)

shuttle$use <- factor(shuttle$use, levels = c("auto", "noauto"), labels = c(1, 0))
shuttle$use<-as.numeric(as.character(shuttle$use))
shuttle$wind<-as.factor(shuttle$wind)


model1<-glm(use ~ wind, data=shuttle, family = "binomial")
model2<-glm(1-use ~ wind, data=shuttle, family = "binomial")

