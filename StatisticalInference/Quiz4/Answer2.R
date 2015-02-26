#A sample of 9 men yielded a sample average brain volume of 1,100cc and
#a standard deviation of 30cc. What is the complete set of values of μ0 
#that a test of H0:μ=μ0 would fail to reject the null hypothesis 
#in a two sided 5% Students t-test?

1100 +c(-1,1) * qt(0.975,8) * 30/sqrt(9)