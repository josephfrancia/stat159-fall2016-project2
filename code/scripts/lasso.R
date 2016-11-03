args=commandArgs(trailingOnly=TRUE)
data=read.csv(args[1])[,-1]


#split data into training and test set
source(file="code/functions/test_set.R")
source(file="code/functions/train_set.R")
train<-trainset(data)
test<-testset(data)



library("glmnet")

grid<-10^seq(10, -2, length = 100)
Lasso_CV<-cv.glmnet(x=as.matrix(train[,1:12]),y=as.matrix(train[,13]),alpha=1,lambda=grid)

png(filename="images/mse-plot-lasso.jpg")
plot(x=log(Lasso_CV$lambda),y=Lasso_CV$cvm, xlab="Log Lambda Value",ylab="Mean Cross Validation Error",main="10 Fold Cross Validation")
dev.off()

lambda<-Lasso_CV$lambda.min
train_model<-glmnet(x=as.matrix(train[,1:12]),y=as.matrix(train[,13]),alpha=1,lambda=lambda)

mse_lasso<-mean((test[,13]-predict(train_model,newx=as.matrix(test[,1:12])))^2)

lasso_model<-glmnet(x=as.matrix(data[,1:12]),y=as.matrix(data[,13]),alpha=1,lambda=lambda)

save(mse_lasso,lasso_model,file="data/lasso.RData")




