
df <- read.csv("SMU/DoingDatascience-6306/CaseStudy2/CaseStudyTwoMaterials_2_2/Procrastination.csv")
class(df)
colnames(df)
#2.a
nrow(df)
ncol(df)

#Cleanup
#Remove rows with no age

df<- df[!(is.na(df$X...Age) | df$X...Age==""),]
nrow(df)
df<- df[!(is.na(df$Gender) | df$Gender==""),]
df<- df[!(is.na(df$Work.Status) | df$Work.Status==""),]
df<- df[!(is.na(df$Country.of.residence) | df$Country.of.residence==0),]
df<- df[!(is.na(df$Marital.Status) | df$Marital.Status==""),]
#Do we need to do this?
df<- df[!(is.na(df$Community.size==0) | df$Community.size==8),]

df<- df[!(is.na(df$How.long.have.you.held.this.position...Years) | 
            df$How.long.have.you.held.this.position...Years=="" |
            df$How.long.have.you.held.this.position...Years==999),]
df$How.long.have.you.held.this.position...Years <- ceiling(df$How.long.have.you.held.this.position...Years)
nrow(df)
df$How.long.have.you.held.this.position...Years <- ceiling(df$How.long.have.you.held.this.position...Years)

#Remove Male/Female from No of Sons column
df$Number.of.sons <- replace(df$Number.of.sons,df$Number.of.sons=="Female",0)
df$Number.of.sons <- replace(df$Number.of.sons,df$Number.of.sons=="Male",1)

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
df$DP.mean <- colMeans(df[,c(15:19)])

write.csv(df,"df.csv")

