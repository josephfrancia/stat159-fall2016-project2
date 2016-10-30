#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
library(pls)
load(file="../../data/test_train.RData")
plsr_obj=plsr(Balance~.,data=train[,-c(1,2)], validation="CV")
min(plsr_obj$validation$PRESS)

#Partial Least Squares Regression Plot
png(filename="../../images/plot-plsr.png")
plot(plsr_obj)
dev.off()

#Computing MSE of PLSR with optimal Components
y_hat=predict(plsr_obj, ncomp=5, newdata=test[,-c(1,2,14)])
mse_plsr=mean(y_hat-test[,14])

#Finding beta coefficients by fitting model on full dataset
full_plsr=plsr(Balance~., data=rbind(train[,-c(1,2)], test[,-c(1,2)]))

#Saving all relevant plsr objects
save(plsr_obj, mse_plsr, full_plsr$coefficients, filename="../../data/plsr.RData")

sink(file="../../data/plsr.txt")
print("Optimal # of Components for Plsr")
plsr_obj$validation$PRESS

print("MSE of Plsr with Optimal # of Components")
mse_plsr

print("Beta Coefficients")
full_plsr$coefficients
sink()













