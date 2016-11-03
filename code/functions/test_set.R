#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
processed=read.csv("../../data/scaled-credit.csv")
processed=processed[,-c(1,2)]

testset=function(data){
  set.seed(0)
  shuffled_ind=sample(1:400, 400)
  test=data[shuffled_ind[301:400],]
  return(test)
}

test=testset(processed)
save(test, file="../../data/test.RData")