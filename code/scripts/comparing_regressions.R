load(file="../../data/test_train.RData")
load(file="../../data/ridge.RData")
load(file="../../data/plsr.RData")
load(file="../../data/lm.RData")


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
