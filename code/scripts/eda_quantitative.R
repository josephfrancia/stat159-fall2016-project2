---
title: "EDA"
output: html_document
---

#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
#data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/data/Credit.csv")

args=commandArgs(trailingOnly=TRUE)
data=read.csv(paste("../../data/",args[1], sep=""))
data=data[,-1]


#quant-variables-statistics.txt
library(xtable)
sink(file="../data/quant-variables-statistics.txt")
summary(data$Income)
as.numeric((summary(data$Income))[5]-(summary(data$Income))[2]) #IQR
as.numeric(summary(data$Income)[6]-summary(data$Income)[1]) #Range
sd(data$Income) #Standard Deviation 

print("Statistics for Limit Variable")
summary(data$Limit)
as.numeric((summary(data$Limit))[5]-(summary(data$Limit))[2]) #IQR
as.numeric(summary(data$Limit)[6]-summary(data$Limit)[1]) #Range
sd(data$Limit) #Standard Deviation 


print("Statistics for Rating Variable")
summary(data$Rating)
as.numeric((summary(data$Rating))[5]-(summary(data$Rating))[2]) #IQR
as.numeric(summary(data$Rating)[6]-summary(data$Rating)[1]) #Range
sd(data$Rating) #Standard Deviation 


print("Statistics for Cards Variable")
summary(data$Cards)
as.numeric((summary(data$Cards))[5]-(summary(data$Cards))[2]) #IQR
as.numeric(summary(data$Cards)[6]-summary(data$Cards)[1]) #Range
sd(data$Cards) #Standard Deviation 


print("Statistics for Age Variable")
summary(data$Age)
as.numeric((summary(data$Age))[5]-(summary(data$Age))[2]) #IQR
as.numeric(summary(data$Age)[6]-summary(data$Age)[1]) #Range
sd(data$Age) #Standard Deviation 


print("Statistics for Education Variable")
summary(data$Education)
as.numeric((summary(data$Education))[5]-(summary(data$Education))[2]) #IQR
as.numeric(summary(data$Education)[6]-summary(data$Education)[1]) #Range
sd(data$Education) #Standard Deviation 


print("Statistics for Balance Variable")
summary(data$Balance)
as.numeric((summary(data$Balance))[5]-(summary(data$Balance))[2]) #IQR
as.numeric(summary(data$Balance)[6]-summary(data$Balance)[1]) #Range
sd(data$Balance) #Standard Deviation 

print("Matrix of Correlations")
cor(data[, -c(7,8,9,10)])


sink()

#Income Histogram
png(filename="../images/histogram-Income.png")
hist(data$Income, main="Histogram of Income", xlab="Income")
dev.off()

#Limit Histogram
png(filename="../images/histogram-Limit.png")
hist(data$Limit, main="Histogram of Limit", xlab="Limit")
dev.off()

#Rating Histogram
png(filename="../images/histogram-Rating.png")
hist(data$Rating, main="Histogram of Rating", xlab="Rating")
dev.off()

#Cards Histogram
png(filename="../images/histogram-Cards.png")
hist(data$Cards, main="Histogram of Credit Cards", xlab="Number of Credit Cards")
dev.off()

#Age Histogram
png(filename="../images/histogram-Age.png")
hist(data$Age, main="Histogram of Age", xlab="Age")
dev.off()

#Education Histogram
png(filename="../images/histogram-Education.png")
hist(data$Education, main="Histogram of Years of Education", xlab="Years of Education")
dev.off()

#Balance Histogram
png(filename="../images/histogram-Balance.png")
hist(data$Balance, main="Histogram of Balance", xlab="Balance")
dev.off()

#Income Boxplot
png(filename="../images/boxplot-Income.png")
boxplot(data$Income, main="Boxplot of Income", ylab="Income")
dev.off()

#Limit Boxplot
png(filename="../images/boxplot-Limit.png")
boxplot(data$Limit, main="Boxplot of Limit", ylab="Limit")
dev.off()

#Rating Boxplot
png(filename="../images/boxplot-Rating.png")
boxplot(data$Rating, main="Boxplot of Rating", ylab="Rating")
dev.off()

#Cards Boxplot
png(filename="../images/boxplot-Cards.png")
boxplot(data$Cards, main="Boxplot of Credit Cards", ylab="Number of Credit Cards")
dev.off()

#Age Boxplot
png(filename="../images/boxplot-Age.png")
boxplot(data$Age, main="Boxplot of Age", xlab="Age")
dev.off()

#Education Boxplot
png(filename="../images/boxplot-Education.png")
boxplot(data$Education, main="Boxplot of Years of Education", ylab="Years of Education")
dev.off()

#Balance Boxplot
png(filename="../images/boxplot-Balance.png")
boxplot(data$Balance, main="Boxplot of Balance", ylab="Balance")
dev.off()


