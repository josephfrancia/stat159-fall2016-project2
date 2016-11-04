args=commandArgs(trailingOnly=TRUE)
data=read.csv(args[1])[,-c(1,2)]
data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/data/scaled-Credit.csv")[,-c(1,2)]
#split data into training and test set
source(file="code/functions/test_set.R")
source(file="code/functions/train_set.R")
train<-trainset(data)
test<-testset(data)


lm_obj=lm(Balance~.,data=train)
y_hat=predict(lm_obj, newdata=test[,-12])
plot(y_hat-test[,12])
mse_lm=mean((y_hat-test[,12])^2)
save(lm_obj,mse_lm,file="data/lm.RData")

