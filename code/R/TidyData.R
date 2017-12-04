df <- read.csv("SMU/DoingDatascience-6306/CaseStudy2/CaseStudyTwoMaterials_2_2/Procrastination.csv", check.names = FALSE)
class(df)
colnames(df)
#2.a
nrow(df)
ncol(df)

#Cleanup
#Remove rows with no age
names(df) <- gsub( " ",  "", names(df), fixed = TRUE)
colnames(df)[1] <- "Age"
colnames(df)[7] <- "Occupation"
colnames(df)[8] <- "DurationYear"
colnames(df)[9] <- "DurationMon"
colnames(df)[10] <- "CommSize"
colnames(df)[11] <- "ResidntCntry"
colnames(df)[12] <- "MaritlStatus"
colnames(df)[13] <- "NoOfSons"
colnames(df)[14] <- "NoOfDghtrs"
colnames(df)[15:19] <- (substr(names(df[15:19]),2,4))
colnames(df)[20:28] <- (substr(names(df[20:28]),2,5))
colnames(df)[29:34] <- (substr(names(df[29:34]),2,6))
colnames(df)[35:43] <- (substr(names(df[35:43]),2,4))
colnames(df)[44:54] <- (substr(names(df[44:54]),2,5))
colnames(df)[55:59] <- (substr(names(df[55:59]),2,6))
colnames(df)[60] <- "SelfProcast"
colnames(df)[61] <- "OtherProcast"

colnames(df)
nrow(df)

df<- df[!(is.na(df$Age) | df$Age==""),]
nrow(df)
df<- df[!(is.na(df$Gender) | df$Gender==""),]
df<- df[!(is.na(df$WorkStatus) | df$WorkStatus==""),]
df<- df[!(is.na(df$ResidntCntry) | df$ResidntCntry==0 | df$ResidntCntry==""),]
df<- df[!(is.na(df$MaritlStatus) | df$MaritlStatus==""),]
df<- df[!(is.na(df$SelfProcast) | df$SelfProcast==""),]
df<- df[!(is.na(df$OtherProcast) | df$OtherProcast=="" | df$OtherProcast==4),]

df<- df[!(is.na(df$DurationYear) | 
            df$DurationYear=="" |
            df$DurationYear==999),]
df$DurationYear <- ceiling(df$DurationYear)
nrow(df)
i <- sapply(df, is.factor)
df[i] <- lapply(df[i], as.character)

#Remove Male/Female from No of Sons column
df$NoOfSons <- replace(df$NoOfSons,df$NoOfSons=="Female",0)
df$NoOfSons <- replace(df$NoOfSons,df$NoOfSons=="Male",1)

#Cuurent occupation
df<- df[!(is.na(df$Current.Occupation=="Please specify") 
          | df$Current.Occupation=="please specify"
          | df$Current.Occupation==0),]
nrow(df)
gsub("Teacher|teacher", "Teacher", df$Current.Occupation)
df$Current.Occupation <- replace(df$Current.Occupation, grepl("(?i)teacher", df$Current.Occupation, perl=TRUE), "Teacher")
View(df)

sapply(df,class)
#Mean for all DP or each DP
df$DPMean <- apply(df[,c(15:19)],1,mean)
df$AIPMean <- apply(df[,c(20:34)],1,mean)
df$GPMean <- apply(df[,c(35:54)],1,mean)
df$SWLSMean <- apply(df[,c(55:59)],1,mean)
colnames(df)
nrow(df)
write.csv(df,"df.csv")
