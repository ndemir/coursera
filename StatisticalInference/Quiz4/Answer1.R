baseline<-c(140,138,150,148,135)
week2<-c(132,135,151,146,130)
r<-t.test(baseline, week2, alternative="two.sided", paired=TRUE)
print(r)