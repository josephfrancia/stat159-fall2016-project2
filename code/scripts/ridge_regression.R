#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")

#Finding various lambda values and their associated MSE
set.seed(0)
load(file="../../data/test_train.RData")
library(glmnet)
grid=10^seq(10,-2, length=100)
ridge_obj=cv.glmnet(as.matrix(train[,-c(1,2,14)]), train[,14], lambda=grid, intercept=FALSE, standardize=FALSE)

#Ridge Plot
png(filename="../../images/plot-ridge.png")
plot(ridge_obj)
dev.off()

#Computing MSE of Ridge with optimal lambda
opt_ridge=glmnet(as.matrix(train[,-c(1,2,14)]), train[,14], lambda=ridge_obj$lambda.1se, intercept=FALSE, standardize=FALSE)
y_hat=as.matrix(test[,-c(1,2,14)]) %*% opt_ridge$beta
mse_ridge=mean(y_hat - test[,14])


#Finding beta coefficients by fitting model on full dataset
full_ridge=glmnet(as.matrix(rbind(train[,-c(1,2,14)], test[,-c(1,2,14)])), c(train[,14], test[,14]), lambda=ridge_obj$lambda.1se, intercept=FALSE, standardize=FALSE)

#Saving all relevant ridge objects
save(ridge_obj, mse_ridge, full_ridge$beta, ridge_obj$lambda.1se, filename="../../data/ridge.RData")


sink(file="../../data/ridge.txt")
print("Optimal Lambda for Ridge")
ridge_obj$lambda.1se

print("MSE of Ridge with Optimal Lambda")
mse_ridge

print("Beta Coefficients")
full_ridge$beta
sink()


