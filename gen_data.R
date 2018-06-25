#getcwd() 
#C:/Python/Notebooks/Hypothesis

# Generate some similar but very slightly different random distributions
# based on contents of "storeA.csv".
# Assumes storeA data is normally distributes.

#load data
storeA <- read.csv("storeA.csv", header=FALSE)

s <- sd(storeA$V1)
m <- mean(storeA$V1)
n <- length(storeA$V1)

#introduce some random variation in the Mean
m2 = m * (0.5+(0.5-runif(1)/20))
m3 = m * (0.5+(0.5-runif(1)/20)) 

s2 = s * (0.5+(0.5-runif(1)/100))
s3 = s * (0.5+(0.5-runif(1)/100))

#simulate a new distribution
randSimB <- rnorm(n,mean = m2, sd = s2)
randSimC <- rnorm(n,mean = m3, sd = s3)
boxplot(storeA$V1, randSimB, randSimC)

#write it out - use write.table not write.csv so we can switch off col header
#write.csv(randSim, file="store_cNEW.csv", row.names=FALSE)
write.table(randSimB, file = "storeB_generated.csv",row.names=FALSE, col.names=FALSE, sep=",")
write.table(randSimC, file = "storeC_generated.csv",row.names=FALSE, col.names=FALSE, sep=",")