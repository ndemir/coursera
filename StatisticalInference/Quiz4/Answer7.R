#Researchers would like to conduct a study of 100 healthy adults to detect a 
#four year mean brain volume loss of .01 mm3. Assume that the standard deviation of
#four year volume loss in this population is .04 mm3. About what would be the power of
#the study for a 5% one sided test versus a null hypothesis of no volume loss?
power.t.test(n=100, delta=.01,sd=.04, alternative="one.sided", type="paired")