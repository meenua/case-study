# Set the working dir...use this

setwd("C:/Users/DataScience/Documents/SMU/Data_Science/Case_study2/case-study/case-study/data/cleaned")



#Get cleaned data

dfm<-read.csv("Merged.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dim <- data.frame(nrow(dfm),ncol(dfm))
colnames(dim) <- c("Number of Rows", "Number of Columns")


#4a .Keep only adults over 18 years and create new df2...removed 113 rows...USE THIS

dfm2 <- subset(dfm, Age > 18)

#4a. Keep adults who are 65 and below to keep those still working

dfm2 <- subset(dfm2, Age < 65)

#Remove first column with "x"

dfm2 <- subset( dfm2, select = -1 )


# Replacing for college in Edu

dfm2$Edu <- gsub('deg', '12-16 Years', dfm2$Edu)

# for high school:

dfm2$Edu <- gsub('dip', '12 Years or Less', dfm2$Edu)


# for ma:

dfm2$Edu <- gsub('ma', '16+ Years', dfm2$Edu)


# for Grade school:

dfm2$Edu <- gsub('grade', '12 Years or Less', dfm2$Edu)


# for Ituni (prob a mistake:

dfm2$Edu <- gsub('ltuni', '12-16 Years', dfm2$Edu)


# for high school

dfm2$Edu <- gsub('high', '12 Years or Less', dfm2$Edu)


# for phd

dfm2$Edu <- gsub('phd', '16+ Years', dfm2$Edu)


# for lthigh

dfm2$Edu <- gsub('lthigh', '12 Years or Less', dfm2$Edu)

#4b. Descriptive Statistics for Age, Income, HDI, & the 4 mean columns. Data doesn't look right



library(pastecs)
stat.desc(dfm2)
stat.desc(dfm2[,c("Age","AnnualIncome","HDI","DPMean", "AIPMean", "GPMean", "SWLSMean")])

#Statgazer for summary statistics to see if makes table. Its not coming out as expected

library(latexpdf)
library(stargazer)
stargazer(dfm2[,c("Age","AnnualIncome","HDI","DPMean", "AIPMean", "GPMean","SWLSMean")], flip = TRUE)


#Create 2 histograms (not taking color...check it again)

AnnualIncome<-c(dfm2$AnnualIncome)
hist(AnnualIncome)
hist(AnnualIncome, col = "Red", breaks=6, xlim=c(0,max), 
     
# 4c.Frequencies for Gender, Work Status, Occupation (Have to bucket occupation first)
     
  
tblgender <- table(dfm2$Gender)
print(tblgender)
  
     
#frequency table gender:
    
     
fqtblgender <- table(dfm2$Gender)
print(fqtblgender)
     
#barplot of frequency gender:

barplot(table(dfm2$Gender), main='Frequency of Surveyed by Gender', xlab='Gender', ylab='Frequency', col = c("Light Blue", "Grey"))
     
     
#frequency table Work Status:
    
fqtblws <- table(dfm2$WorkStatus),
print(fqtblws),
    
     
#barplot of frequency work status:
     
barplot(table(dfm2$WorkStatus), main='Frequency of Surveyed by Employment Status', xlab='Work Status', ylab='Frequency', col = c("Light Green", "Light Blue", "Yellow", "Grey", "Brown"))
    
#frequency table Work Status (needs to be done):
     
library(dplyr)
#4d. Count surveyors by Country in descending order (make it better)
  
table<-(dfm2 %>% count(ResidntCntry, sort=TRUE))