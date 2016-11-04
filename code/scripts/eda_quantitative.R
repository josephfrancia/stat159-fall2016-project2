

#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2")
#data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/data/scaled-credit.csv")
args=commandArgs(trailingOnly=TRUE)
data=read.csv(args[1])[,-1]


#quant-variables-statistics.txt
library(xtable)
sink(file="data/quant-variables-statistics.txt")
income_min=min(data$Income)
income_max=max(data$Income)
income_median=median(data$Income)
income_mean=mean(data$Income)
income_1q=summary(data$Income)[2]
income_3q=summary(data$Income)[5]
income_iqr=as.numeric((summary(data$Income))[5]-(summary(data$Income))[2]) #IQR
income_range=as.numeric(summary(data$Income)[6]-summary(data$Income)[1]) #Range
income_sd=sd(data$Income) #Standard Deviation 
income=data.frame(c(income_min, income_max, income_median, income_mean, income_1q, income_3q, income_iqr,income_range, income_sd))
rownames(income)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(income)=c("Statistics for Income Variable")
print(income) 




rating_min=min(data$Rating)
rating_max=max(data$Rating)
rating_median=median(data$Rating)
rating_mean=mean(data$Rating)
rating_1q=summary(data$Rating)[2]
rating_3q=summary(data$Rating)[5]
rating_iqr=as.numeric((summary(data$Rating))[5]-(summary(data$Rating))[2]) #IQR
rating_range=as.numeric(summary(data$Rating)[6]-summary(data$Rating)[1]) #Range
rating_sd=sd(data$Rating) #Standard Deviation 
rating=data.frame(c(rating_min, rating_max, rating_median, rating_mean, rating_1q, rating_3q, rating_iqr,rating_range, rating_sd))
rownames(rating)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(rating)=c("Statistics for Rating Variable")
print(rating)




cards_min=min(data$Cards)
cards_max=max(data$Cards)
cards_median=median(data$Cards)
cards_mean=mean(data$Cards)
cards_1q=summary(data$Cards)[2]
cards_3q=summary(data$Cards)[5]
cards_iqr=as.numeric((summary(data$Cards))[5]-(summary(data$Cards))[2]) #IQR
cards_range=as.numeric(summary(data$Cards)[6]-summary(data$Cards)[1]) #Range
cards_sd=sd(data$Cards) #Standard Deviation 
cards=data.frame(c(cards_min, cards_max, cards_median, cards_mean, cards_1q, cards_3q, cards_iqr,cards_range, cards_sd))
rownames(cards)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(cards)=c("Statistics for Cards Variable")
print(cards)






age_min=min(data$Age)
age_max=max(data$Age)
age_median=median(data$Age)
age_mean=mean(data$Age)
age_1q=summary(data$Age)[2]
age_3q=summary(data$Age)[5]
age_iqr=as.numeric((summary(data$Age))[5]-(summary(data$Age))[2]) #IQR
age_range=as.numeric(summary(data$Age)[6]-summary(data$Age)[1]) #Range
age_sd=sd(data$Age) #Standard Deviation 
age=data.frame(c(age_min, age_max, age_median, age_mean, age_1q, age_3q, age_iqr,age_range, age_sd))
rownames(age)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(age)=c("Statistics for Age Variable")
print(age)


education_min=min(data$Education)
education_max=max(data$Education)
education_median=median(data$Education)
education_mean=mean(data$Education)
education_1q=summary(data$Education)[2]
education_3q=summary(data$Education)[5]
education_iqr=as.numeric((summary(data$Education))[5]-(summary(data$Education))[2]) #IQR
education_range=as.numeric(summary(data$Education)[6]-summary(data$Education)[1]) #Range
education_sd=sd(data$Education) #Standard Deviation 
education=data.frame(c(education_min, education_max, education_median, education_mean, education_1q, education_3q, education_iqr,education_range, education_sd))
rownames(education)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(education)=c("Statistics for Education Variable")
print(education)






balance_min=min(data$Balance)
balance_max=max(data$Balance)
balance_median=median(data$Balance)
balance_mean=mean(data$Balance)
balance_1q=summary(data$Balance)[2]
balance_3q=summary(data$Balance)[5]
balance_iqr=as.numeric((summary(data$Balance))[5]-(summary(data$Balance))[2]) #IQR
balance_range=as.numeric(summary(data$Balance)[6]-summary(data$Balance)[1]) #Range
balance_sd=sd(data$Balance) #Standard Deviation 
balance=data.frame(c(balance_min, balance_max, balance_median, balance_mean, balance_1q, balance_3q, balance_iqr,balance_range, balance_sd))
rownames(balance)=c("Min", "Max", "Median", "Mean", "First Quartile", "3rd Quartile", "IQR", "Range", "Standard Deviation")
colnames(balance)=c("Statistics for Balance Variable")
print(balance)

print("Matrix of Correlations")
cor(data[, -c(7,8,9,10)])
sink()

#Income Histogram
png(filename="images/histogram-Income.png")
hist(data$Income, main="Histogram of Income", xlab="Income")
dev.off()

#Limit Histogram
png(filename="images/histogram-Limit.png")
hist(data$Limit, main="Histogram of Limit", xlab="Limit")
dev.off()

#Rating Histogram
png(filename="images/histogram-Rating.png")
hist(data$Rating, main="Histogram of Rating", xlab="Rating")
dev.off()

#Cards Histogram
png(filename="images/histogram-Cards.png")
hist(data$Cards, main="Histogram of Credit Cards", xlab="Number of Credit Cards")
dev.off()

#Age Histogram
png(filename="images/histogram-Age.png")
hist(data$Age, main="Histogram of Age", xlab="Age")
dev.off()

#Education Histogram
png(filename="images/histogram-Education.png")
hist(data$Education, main="Histogram of Years of Education", xlab="Years of Education")
dev.off()

#Balance Histogram
png(filename="images/histogram-Balance.png")
hist(data$Balance, main="Histogram of Balance", xlab="Balance")
dev.off()

#Income Boxplot
png(filename="images/boxplot-Income.png")
boxplot(data$Income, main="Boxplot of Income", ylab="Income")
dev.off()

#Limit Boxplot
png(filename="images/boxplot-Limit.png")
boxplot(data$Limit, main="Boxplot of Limit", ylab="Limit")
dev.off()

#Rating Boxplot
png(filename="images/boxplot-Rating.png")
boxplot(data$Rating, main="Boxplot of Rating", ylab="Rating")
dev.off()

#Cards Boxplot
png(filename="images/boxplot-Cards.png")
boxplot(data$Cards, main="Boxplot of Credit Cards", ylab="Number of Credit Cards")
dev.off()

#Age Boxplot
png(filename="images/boxplot-Age.png")
boxplot(data$Age, main="Boxplot of Age", xlab="Age")
dev.off()

#Education Boxplot
png(filename="images/boxplot-Education.png")
boxplot(data$Education, main="Boxplot of Years of Education", ylab="Years of Education")
dev.off()

#Balance Boxplot
png(filename="images/boxplot-Balance.png")
boxplot(data$Balance, main="Boxplot of Balance", ylab="Balance")
dev.off()


