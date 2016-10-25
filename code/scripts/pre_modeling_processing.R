##Read in data
unprocessed_data<-read.csv("http://www-bcf.usc.edu/~gareth/ISL/Credit.csv")

##Turn categorical variables into dummy variables
processed<-model.matrix(~0+., unprocessed_data[,-9])


##normalize non-categorical explanotory variables

for (i in c(2:7,13)){
  processed[,i]<-scale(processed[,i])
}

##write to data file
write.csv(processed,"../../data/scaled-credit.csv")

