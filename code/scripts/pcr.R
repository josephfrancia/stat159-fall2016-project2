args=commandArgs(trailingOnly=TRUE)
data=read.csv(args[1])[,-c(1,2)]


#split data into training and test set
source(file="code/functions/test_set.R")
source(file="code/functions/train_set.R")
train<-trainset(data)
test<-testset(data)

library("pls")

train_model<-pcr(Balance~.,data=as.data.frame(train),validation="CV")
pcr_lowest_comp<-which.min(train_model$validation$PRESS)

png(filename="images/validationplot-PCR.jpg")
validationplot(train_model,val.type="MSEP")
dev.off

full_train_model<-pcr(Balance~.,data=as.data.frame(train),validation="CV")
predictions<-predict(full_train_model,ncomps=pcr_lowest_comp,newdata=as.data.frame(test[,-12]))


mse_pcr<-mean((predictions-test[,"Balance"])^2)

pcr_model<-pcr(Balance~.,data=as.data.frame(data), ncomps=pcr_lowest_comp)
pcr_coefficients<-pcr_model$coefficients

save(mse_pcr,pcr_model,pcr_coefficients,pcr_lowest_comp,file="data/pcr.RData")

