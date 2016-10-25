#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
processed=read.csv("../../data/scaled-credit.csv")
set.seed(1231231)
shuffled_ind=sample(1:400, 400)
train=processed[shuffled_ind[1:300],]
test=processed[shuffled_ind[301:400],]

save(train, test, file="../../data/test_train.RData")
