args=commandArgs(trailingOnly=TRUE)

##Read in data
setwd("/Users/NickAccount/Desktop/project-2")
unprocessed_data=read.csv("data/credit.csv")

##Turn categorical variables into dummy variables
processed<-model.matrix(~0+., unprocessed_data[,-1])


##normalize non-categorical explanotory variables

for (i in c(1:6,13)){
  processed[,i]<-scale(processed[,i])
}

##write to data file
write.csv(processed,"data/scaled-credit.csv")

