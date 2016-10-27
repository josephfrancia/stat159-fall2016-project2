#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
library(pls)
load(file="../../data/test_train.RData")
plsr_obj=plsr(Balance~.,data=train[,-c(1,2)])
summary(plsr_obj)
plot(RMSEP(plsr_obj), legendpos="topright") #Plotting Accuracy as we increase # of Components
plot(plsr_obj, ncomp=5, asp=1, line=TRUE) #Plotting Accuracy for a specific number of components
y_hat=predict(plsr_obj, ncomp=3, newdata=test[,-c(1,2,14)])
plot(y_hat-test[,14])
mean(y_hat-test[,14])
