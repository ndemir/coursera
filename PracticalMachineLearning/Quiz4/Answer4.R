library(lubridate)
library(forecast)
dat = read.csv("gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)


model<-bats(tstrain)
pred<-forecast(model, h=nrow(testing), level = c(95))
acc=sum(testing$visitsTumblr <= pred$upper & testing$visitsTumblr >= pred$lower) / nrow(testing)

