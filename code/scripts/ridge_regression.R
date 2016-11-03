args=commandArgs(trailingOnly=TRUE)
data=read.csv(args[1])[,-1]


#split data into training and test set
source(file="code/functions/test_set.R")
source(file="code/functions/train_set.R")
train<-trainset(data)
test<-testset(data)

#Finding various lambda values and their associated MSE
set.seed(0)
library(glmnet)
grid=10^seq(10,-2, length=100)
ridge_obj=cv.glmnet(as.matrix(train[,-12]), train[,12], alpha=0, lambda=grid, intercept=FALSE, standardize=FALSE)

#Ridge Plot
png(filename="images/plot-ridge.png")
plot(ridge_obj)
dev.off()

#Computing MSE of Ridge with optimal lambda
opt_ridge=glmnet(as.matrix(train[,-12]), train[,12], alpha=0,lambda=ridge_obj$lambda.1se, intercept=FALSE, standardize=FALSE)
y_hat_ridge=predict(opt_ridge, newx=as.matrix(test[,-12]))
mse_ridge=mean((y_hat_ridge - test[,12])^2)


#Finding beta coefficients by fitting model on full dataset
full_ridge=glmnet(as.matrix(rbind(train[,-12], test[,-12])), alpha=0, c(train[,12], test[,12]), lambda=ridge_obj$lambda.1se, intercept=FALSE, standardize=FALSE)
betas_ridge=full_ridge$beta
lambda_ridge=ridge_obj$lambda.1se

#Saving all relevant ridge objects
save(ridge_obj, mse_ridge, betas_ridge, lambda_ridge, file="data/ridge.RData")


sink(file="data/ridge.txt")
print("Optimal Lambda for Ridge")
ridge_obj$lambda.1se

print("MSE of Ridge with Optimal Lambda")
mse_ridge

print("Beta Coefficients")
full_ridge$beta
sink()


