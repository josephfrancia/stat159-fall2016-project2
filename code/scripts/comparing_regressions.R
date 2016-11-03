load(file="../../data/test_train.RData")
load(file="../../data/ridge.RData")
load(file="../../data/plsr.RData")
load(file="../../data/lm.RData")
library(reshape2)

#Creating MSE table
mse=data.frame(c(mse_lm, mse_ridge, mse_plsr))
rownames(mse)=c("MSE of Least Squares", "MSE of Ridge Regression", "MSE of PLS Regression")
colnames(mse)=c("Mean Squared Error")
save(mse,file="../../data/mse_table.RData")

#Creating table of coefficients
betas_plsr=as.data.frame(betas_plsr)
betas_plsr=betas_plsr[,5]
betas_ridge=as.numeric(betas_ridge)
betas_ls=as.numeric(lm_obj$coefficients)[2:12]
beta_names=c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Gender.Male", "GenderFemale", "MarriedYes", "EthnicityAsian", "EthnicityCaucasian")
betas=data.frame(beta_names,betas_plsr, betas_ls, betas_ridge)
colnames(betas)=c("Coefficient Names","Coefficients for PLS Regression", "Coefficients for Least Squares", "Coefficients for Ridge Regression")
save(betas,file="../../data/coef_table.RData")

#Creating a barplot of coefficients

png(filename="../../images/coefficient_plot.png")
plot(seq(1,3, by=1),as.numeric(betas[1,2:4]), xaxt="n", type="l", col="red",xlab="Regression Type", ylab="Coefficient Value", ylim=c(-2,1), main="Coefficient Values For Each Regression")
lines(seq(1,3, by=1),as.numeric(betas[2,2:4]), col="blue")
lines(seq(1,3, by=1),as.numeric(betas[3,2:4]), col="red")
lines(seq(1,3, by=1),as.numeric(betas[4,2:4]), col="yellow")
lines(seq(1,3, by=1),as.numeric(betas[5,2:4]), col="green")
lines(seq(1,3, by=1),as.numeric(betas[6,2:4]), col="orange")
lines(seq(1,3, by=1),as.numeric(betas[7,2:4]), col="purple")
lines(seq(1,3, by=1),as.numeric(betas[8,2:4]), col="black")
lines(seq(1,3, by=1),as.numeric(betas[9,2:4]), col="gray")
lines(seq(1,3, by=1),as.numeric(betas[10,2:4]), col="brown")
lines(seq(1,3, by=1),as.numeric(betas[11,2:4]), col="tomato")
axis(side=1,labels=c("PLS", "OLS", "Ridge"), at=c(1,2,3))
legend(1.5,-.7, bty="n", c("Income","Limit", "Rating", "Cards", "Age", "Education", "Gender.Male",
                "GenderFemale","MarriedYes", "EthnicityAsian","EthnicityCaucasian"),
                  lty=c(1,1),  lwd=c(2.5,2.5),col=c("blue","red", "yellow", "green","orange",
                                                    "purple", "black", "gray","brown", "tomato"))
                                                    
                                           
dev.off()






