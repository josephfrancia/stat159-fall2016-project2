setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
load(file="../../data/test_train.RData")
ridge_obj=glmnet(as.matrix(train[,-c(1,2,14)]), train[,14])
avg_error=vector()
for(i in 1:length(ridge_obj$lambda)){
  y_hat=as.matrix(cbind(test[-c(1,2,14)])) %*% ridge_obj$beta[,i]
  avg_error[i]=mean(y_hat - test[,14])
}

opt_indices=which(abs(avg_error)==min(abs(avg_error)))
opt_lambda=ridge_obj$lambda[opt_indices]

y_hat=as.matrix(cbind(test[-c(1,2,14)])) %*% ridge_obj$beta[,opt_indices]
plot(y_hat-test[,14])
