#Researchers would like to conduct a study of n healthy adults to detect a four year mean
#brain volume loss of .01 mm3. Assume that the standard deviation of four year volume 
#loss in this population is .04 mm3. About what would be the value of n needded 
#for 90% power of type one error rate of 5% one sided test versus a null hypothesis of
#no volume loss?
power.t.test(n=NULL, delta=.01,sd=.04, power=.9, sig.leve=.05, alternative="one.sided", type="paired")