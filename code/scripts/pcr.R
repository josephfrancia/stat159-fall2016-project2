
args=commandArgs(trailingOnly=TRUE)
data=read.csv(paste("../../data/",args[1], sep=""))


unprocessed_data<-read.csv("http://www-bcf.usc.edu/~gareth/ISL/Credit.csv")
processed<-model.matrix(~0+., unprocessed_data[,-9])
for (i in c(2:7,13)){
  processed[,i]<-scale(processed[,i])
}

##remove observation number ie first column
data=processed[,-1]
set.seed(0)
sample<-sample(nrow(data),300)
train<-data[sample,]
test<-data[-sample,]

library("pls")

train_model<-pcr(Balance~.,data=as.data.frame(train),validation="CV")
lasso_lowest_comp<-which.min(train_model$validation$PRESS)

png(filename="../../images/validationplot-PCR.jpg")
validationplot(train_model,val.type="MSEP")
dev.off

full_train_model<-pcr(Balance~.,data=as.data.frame(train),validation="CV")
predictions<-predict(full_train_model,ncomps=lowest_comp,newdata=as.data.frame(test))


mse_pcr<-mean((predictions-test[,"Balance"]^2))

pcr_model<-pcr(Balance~.,data=as.data.frame(data))
pcr_coefficients<-full_model$coefficients

save(test_MSE,pcr_model,pcr_coefficients,lasso_lowest_comp,file="../../data/pcr.RData")

