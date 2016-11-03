
args=commandArgs(trailingOnly=TRUE)
data=read.csv(paste("../../",args[1], sep=""))

#split data into training and test set
source(file=test_set.R)
source(file=train_set.R)
train<-trainset(data)
test<-testset(data)



lm_obj=lm(Balance~.,data=train)
y_hat=predict(lm_obj, newdata=test[,-12])
plot(y_hat-test[,12])
mse_lm=mean((y_hat-test[,12])^2)
save(lm_obj,mse_lm,file="../../data/lm.RData")

betas_plsr
betas_ridge
lm_obj$coefficients
