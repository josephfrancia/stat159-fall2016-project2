load(file="data/ridge.RData")
load(file="data/plsr.RData")
load(file="data/lm.RData")
load(file="data/pcr.RData")
load(file="data/lasso.RData")


#Creating MSE table
mse=data.frame(c(mse_lm, mse_ridge, mse_plsr,mse_pcr,mse_lasso))
rownames(mse)=c("MSE of Least Squares", "MSE of Ridge Regression", "MSE of PLS Regression","MSE of PCR","MSE of Lasso Regression")
colnames(mse)=c("Mean Squared Error")
save(mse,file="data/mse_table.RData")

#Creating table of coefficients
betas_plsr=as.data.frame(betas_plsr)
betas_plsr=betas_plsr[,5] #lowest number of components is 5
betas_ridge=betas_ridge
betas_ls=as.numeric(lm_obj$coefficients)[2:12]
betas_pcr=as.data.frame(pcr_coefficients)
betas_pcr=betas_pcr[,pcr_lowest_comp]
betas_lasso=betas_lasso
betas=data.frame(betas_plsr, betas_ls, betas_ridge,betas_pcr,betas_lasso)
colnames(betas)=c("Coefficients for PLS Regression", "Coefficients for Least Squares", "Coefficients for Ridge Regression","Coefficients for PCR","Coefficients for Lasso Regression")
rownames(betas)=c("Income", "Limit", "Rating", "Cards", "Age", "Education", "GenderFemale", "StudentYes","MarriedYes", "EthnicityAsian", "Ethnicity Caucasian")
save(betas, file="data/betas.RData")


#png("images/beta.png")
#grid.table(betas)
#dev.off()

#MSE
png(filename="images/mse.png")
par(pin=c(50,50))
barplot(t(mse), xaxt="n", main="MSE of Regression Methods")
axis(side=1,labels=c("OLS", "Ridge", "PLS","PCR","Lasso"), at=c(.75,1.95,3.15,4.35,5.55))
dev.off()



#Coefficient Plot
png(filename="images/coefficient_plot.png")
plot(seq(1,5, by=1),as.numeric(betas[1,1:5]), xaxt="n", type="l", col="deeppink",xlab="Regression Type", ylab="Coefficient Value", ylim=c(-3,1), main="Coefficient Values For Each Regression")
lines(seq(1,5, by=1),as.numeric(betas[2,1:5]), col="blue")
lines(seq(1,5, by=1),as.numeric(betas[3,1:5]), col="red")
lines(seq(1,5, by=1),as.numeric(betas[4,1:5]), col="yellow")
lines(seq(1,5, by=1),as.numeric(betas[5,1:5]), col="green")
lines(seq(1,5, by=1),as.numeric(betas[6,1:5]), col="orange")
lines(seq(1,5, by=1),as.numeric(betas[7,1:5]), col="purple")
lines(seq(1,5, by=1),as.numeric(betas[8,1:5]), col="black")
lines(seq(1,5, by=1),as.numeric(betas[9,1:5]), col="gray")
lines(seq(1,5, by=1),as.numeric(betas[10,1:5]), col="brown")
lines(seq(1,5, by=1),as.numeric(betas[11,1:5]), col="tomato")
axis(side=1,labels=c("PLS", "OLS", "Ridge","PCR","Lasso"), at=c(1,2,3,4,5))
legend(1.5,-.7, bty="n", c("Income","Limit", "Rating", "Cards", "Age", "Education", "Gender.Male",
                "GenderFemale","MarriedYes", "EthnicityAsian","EthnicityCaucasian"),
                  lty=c(1,1),  lwd=c(2.5,2.5),col=c("deeppink","blue","red", "yellow", "green","orange",
                                                    "purple", "black", "gray","brown", "tomato"))
                                                    
dev.off()






