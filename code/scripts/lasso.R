
args=commandArgs(trailingOnly=TRUE)
data=read.csv(paste("../../data/",args[1], sep=""))


unprocessed_data<-read.csv("http://www-bcf.usc.edu/~gareth/ISL/Credit.csv")
processed<-model.matrix(~0+., unprocessed_data[,-9])
for (i in c(2:7,13)){
  processed[,i]<-scale(processed[,i])
}


data=processed
set.seed(0)
sample<-sample(nrow(data),300)
train<-data[sample,]
test<-data[-sample,]



library("glmnet")

grid<-10^seq(10, -2, length = 100)
Lasso_CV<-cv.glmnet(x=as.matrix(train[,1:12]),y=as.matrix(train[,13]),alpha=1,lambda=grid)
plot(x=log(Lasso_CV$lambda),y=Lasso_CV$cvm, xlab="Log Lambda Value",ylab="Mean Cross Validation Error",main="10 Fold Cross Validation")
lambda<-Lasso_CV$lambda.min
train_model<-glmnet(x=as.matrix(train[,1:12]),y=as.matrix(train[,13]),alpha=1,lambda=lambda)

Test_MSE <-mean(test[,13]-predict(train_model,newx=test[,1:12]))

model<-glmnet(x=as.matrix(data[,1:12]),y=as.matrix(data[,13]),alpha=1,lambda=lambda)





