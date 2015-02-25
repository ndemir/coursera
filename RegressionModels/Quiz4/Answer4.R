data(InsectSprays)

InsectSprays$spray<-as.factor(InsectSprays$spray)

model<-glm(count ~ spray - 1, data=InsectSprays, family = "poisson")

print( exp(model$coefficients[1])/exp(model$coefficients[2]) )