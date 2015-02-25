data(InsectSprays)

model1<-glm(count ~ factor(spray), family = poisson,data=InsectSprays,offset = log(count + 1))

model2<-glm(count ~ factor(spray), family = poisson,data=InsectSprays,offset = log(10)+log(count + 1))

