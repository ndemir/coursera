#Researchers conducted a blind taste test of Coke versus Pepsi.
#Each of four people was asked which of two blinded drinks given in random 
#order that they preferred. The data was such that 3 of the 4 people chose Coke.
#Assuming that this sample is representative, report a P-value for a test of the
#hypothesis that Coke is preferred to Pepsi using a one sided exact test.

pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE) 

