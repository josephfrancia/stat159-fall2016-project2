#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
load(file="../../data/test.RData")
load(file="../../data/train.RData")
args=commandArgs(trailingOnly=TRUE)
data=read.csv(paste("../../data/",args[1], sep=""))

##Use training and test data functions to make
##train
##test



lm_obj=lm(Balance~.,data=train)
y_hat=predict(lm_obj, newdata=test[,-12])
plot(y_hat-test[,12])
mse_lm=mean((y_hat-test[,12])^2)
save(lm_obj,mse_lm,file="../../data/lm.RData")

betas_plsr
betas_ridge
lm_obj$coefficients
