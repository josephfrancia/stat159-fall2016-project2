#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
library(pls)
load(file="../../data/test.RData")
load(file="../../data/train.RData")

plsr_obj=plsr(Balance~.,data=train, validation="CV")
min(plsr_obj$validation$PRESS)

#Partial Least Squares Regression Plot
png(filename="../../images/plot-plsr.png")
plot(plsr_obj)
dev.off()

#Computing MSE of PLSR with optimal Components
y_hat=predict(plsr_obj, ncomp=5, newdata=test[,-12])
mse_plsr=mean((y_hat-test[,12])^2)

#Finding beta coefficients by fitting model on full dataset
full_plsr=plsr(Balance~., data=rbind(train, test))
betas_plsr=full_plsr$coefficients

#Saving all relevant plsr objects
save(plsr_obj, mse_plsr, betas_plsr, full_plsr, file="../../data/plsr.RData")

sink(file="../../data/plsr.txt")
print("Optimal # of Components for Plsr")
plsr_obj$validation$PRESS

print("MSE of Plsr with Optimal # of Components")
mse_plsr

print("Beta Coefficients")
full_plsr$coefficients
sink()













