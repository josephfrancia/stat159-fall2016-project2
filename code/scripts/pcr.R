
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
lowest_comp<-which.min(train_model$validation$PRESS)
validationplot(train_model,val.type="MSEP")
full_model<-pcr(Balance~.,data=as.data.frame(train),validation="CV")
predictions<-predict(full_model,ncomps=lowest_comp,newdata=as.data.frame(test))

test_MSE<-mean((predictions-test[,"Balance"]^2))

