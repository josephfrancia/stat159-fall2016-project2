
#setwd("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/code/scripts")
#data=read.csv("/Users/josephfrancia/Desktop/Fall_2016/Stats159/stat159-fall2016-project2/data/Credit.csv")



#Making Frequency Table For Gender Variable
freq_gender=data.frame(matrix(NA, nrow = 2, ncol = 2))
colnames(freq_gender)=c("Counts","Proportion")
rownames(freq_gender)=c("Male", "Female")
freq_gender$Counts=c(as.numeric(table(data$Gender)[1]),as.numeric(table(data$Gender)[2]))
freq_gender$Proportion=c(as.numeric(table(data$Gender)[1])/length(data$Gender),as.numeric(table(data$Gender)[2])/length(data$Gender))


#Making Frequency Table For Student Variable
freq_student=data.frame(matrix(NA, nrow = 2, ncol = 2))
colnames(freq_student)=c("Counts","Proportion")
rownames(freq_student)=c("Not Student", "Student")
freq_student$Counts=c(as.numeric(table(data$Student)[1]),as.numeric(table(data$Student)[2]))
freq_student$Proportion=c(as.numeric(table(data$Student)[1])/length(data$Student),as.numeric(table(data$Student)[2])/length(data$Student))


#Making Frequency Table For Married Variable
freq_married=data.frame(matrix(NA, nrow = 2, ncol = 2))
colnames(freq_married)=c("Counts","Proportion")
rownames(freq_married)=c("Not Married", "Married")
freq_married$Counts=c(as.numeric(table(data$Married)[1]),as.numeric(table(data$Married)[2]))
freq_married$Proportion=c(as.numeric(table(data$Married)[1])/length(data$Married),as.numeric(table(data$Married)[2])/length(data$Married))


#Making Frequency Table For Married Variable
freq_ethnicity=data.frame(matrix(NA, nrow = 3, ncol = 2))
colnames(freq_ethnicity)=c("Counts","Proportion")
rownames(freq_ethnicity)=c("African American", "Asian", "Caucasian")
freq_ethnicity$Counts=c(as.numeric(table(data$Ethnicity)[1]),as.numeric(table(data$Ethnicity)[2]), as.numeric(table(data$Ethnicity)[3]))
freq_ethnicity$Proportion=c(as.numeric(table(data$Ethnicity )[1])/length(data$Ethnicity),as.numeric(table(data$Ethnicity)[2])/length(data$Ethnicity),as.numeric(table(data$Ethnicity)[3])/length(data$Ethnicity))


save(freq_gender, freq_ethnicity, freq_married, freq_student, file="../../data/freq_tables.RData")

#Gender Barchart
png(filename="../../images/barchart-Gender.png")
barplot(table(data$Gender), main="Barchart of Gender Variable", xlab="Gender")
dev.off()

#Married Barchart
png(filename="../../images/barchart-Married.png")
barplot(table(data$Married), main="Barchart of Married Variable", xlab="Marriage Status")
dev.off()

#Student Barchart 
png(filename="../../images/barchart-Student.png")
barplot(table(data$Student), main="Barchart of Student Variable", xlab="Student Status")
dev.off()

#Ethnicity Barchart
png(filename="../../images/barchart-Studenet.png")
barplot(table(data$Ethnicity), main="Barchart of Ethnicity", xlab="Ethnicity")
dev.off()



