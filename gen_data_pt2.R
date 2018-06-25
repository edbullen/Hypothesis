#getcwd() 
#C:/Python/Notebooks/Hypothesis

# Generate a similar but significantly different random distribution for StoreC
# based on contents of "storeA.csv".
# Assumes storeA data is normally distributd.

#load data
storeA <- read.csv("storeA.csv", header=FALSE)

s <- sd(storeA$V1)
m <- mean(storeA$V1)
n <- length(storeA$V1)

#introduce some random variation in the Mean
m2 = m * (1+(runif(1)/10))
print(m)
print(m2)

s2 = s * (0.5+(0.5-runif(1)/100))

#simulate a new distribution
randSimC <- rnorm(n,mean = m2, sd = s2)
boxplot(storeA$V1, randSimC)

#write it out - use write.table not write.csv so we can switch off col header
#write.csv(randSim, file="store_cNEW.csv", row.names=FALSE)
write.table(randSimC, file = "storeC_NEW.csv",row.names=FALSE, col.names=FALSE, sep=",")