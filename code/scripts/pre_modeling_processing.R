#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2")
#data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/data/Credit.csv")[,-1]

args=commandArgs(trailingOnly=TRUE)
unprocessed_data=read.csv(args[1])[,-1]


##Turn categorical variables into dummy variables
processed<-model.matrix(~0+., unprocessed_data)


##normalize non-categorical explanotory variables

for (i in c(1:6,13)){
  processed[,i]<-scale(processed[,i])
}

##write to data file
write.csv(processed,"data/scaled-credit.csv")

