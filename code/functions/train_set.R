#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
processed=read.csv("../../data/scaled-credit.csv")
processed=processed[,-c(1,2)]

trainset=function(data){
  set.seed(0)
  shuffled_ind=sample(1:400, 400)
  train=data[shuffled_ind[1:300],]
  return(train)
}

train=trainset(processed)
save(train, file="../../data/train.RData")