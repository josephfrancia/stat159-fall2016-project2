#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2")
load(file="data/test_train.RData")
load(file="data/ridge.RData")
load(file="data/plsr.RData")
load(file="data/lm.RData")
load(file="data/pcr.RData")
load(file="data/lasso.RData")


library(reshape2)

#Creating MSE table
mse=data.frame(c(mse_lm, mse_ridge, mse_plsr,mse_pcr,mse_lasso))
rownames(mse)=c("MSE of Least Squares", "MSE of Ridge Regression", "MSE of PLS Regression","MSE of PCR","MSE of Lasso Regression")
colnames(mse)=c("Mean Squared Error")
save(mse,file="data/mse_table.RData")

#Creating table of coefficients
betas_plsr=as.data.frame(betas_plsr)
betas_plsr=betas_plsr
betas_ridge=as.numeric(betas_ridge)
betas_ls=as.numeric(lm_obj$coefficients)[2:13]
betas_pcr=as.data.frame(pcr_coefficients)
betas_pcr=betas_pcr[,pcr_lowest_comp]
betas_lasso=as.numeric(lasso_model$beta)


beta_names=c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Gender.Male", "GenderFemale","StudentYes", "MarriedYes", "EthnicityAsian", "EthnicityCaucasian")
betas=data.frame(beta_names,betas_plsr, betas_ls, betas_ridge,betas_pcr,betas_lasso)
colnames(betas)=c("Coefficient Names","Coefficients for PLS Regression", "Coefficients for Least Squares", "Coefficients for Ridge Regression","Coefficients for PCR","Coefficients for Lasso Regression")
save(betas,file="data/coef_table.RData")



#Could possibly write a function for this

png(filename="images/coefficient_plot.png")
plot(seq(1,5, by=1),as.numeric(betas[1,2:6]), xaxt="n", type="l", col="deeppink",xlab="Regression Type", ylab="Coefficient Value", ylim=c(-3,1), main="Coefficient Values For Each Regression")
lines(seq(1,5, by=1),as.numeric(betas[2,2:6]), col="blue")
lines(seq(1,5, by=1),as.numeric(betas[3,2:6]), col="red")
lines(seq(1,5, by=1),as.numeric(betas[4,2:6]), col="yellow")
lines(seq(1,5, by=1),as.numeric(betas[5,2:6]), col="green")
lines(seq(1,5, by=1),as.numeric(betas[6,2:6]), col="orange")
lines(seq(1,5, by=1),as.numeric(betas[7,2:6]), col="purple")
lines(seq(1,5, by=1),as.numeric(betas[8,2:6]), col="black")
lines(seq(1,5, by=1),as.numeric(betas[9,2:6]), col="gray")
lines(seq(1,5, by=1),as.numeric(betas[10,2:6]), col="brown")
lines(seq(1,5, by=1),as.numeric(betas[11,2:6]), col="tomato")
axis(side=1,labels=c("PLS", "OLS", "Ridge","PCR","Lasso"), at=c(1,2,3,4,5))
legend(1.5,-.7, bty="n", c("Income","Limit", "Rating", "Cards", "Age", "Education", "Gender.Male",
                "GenderFemale","MarriedYes", "EthnicityAsian","EthnicityCaucasian"),
                  lty=c(1,1),  lwd=c(2.5,2.5),col=c("deeppink","blue","red", "yellow", "green","orange",
                                                    "purple", "black", "gray","brown", "tomato"))
                                                    
                                           
dev.off()






