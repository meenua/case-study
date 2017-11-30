getwd()
df<-read.csv(file.choose(), header=TRUE)
#Check the dimension row and columns of data imported
dim(rawData)

# names of variables in file
names(df)

#Change the 5th Column's name
colnames(df)[5] <-"WorkStatus"

#Change the 7th Column's name
colnames(df)[7] <-"Occupation"

#Check the new column name
colnames(df)[7]

#Change the 8th Column's name
colnames(df)[8]<-"ExpInYrs"
colnames(df)[8]

#Change the 9th Column's name
colnames(df)[9]<-"ExpInMnths"
colnames(df)[9]

#Change the 10th Column's name
colnames(df)[10]<-"CommunitySz"
colnames(df)[10]

#Change the 11th Column's name
colnames(df)[11]<-"Country"
colnames(df)[11]

#Change the 12th Column's name
colnames(df)[12]<-"MaritalSt"
colnames(df)[12]

#Change the 13th Column's name
colnames(df)[13]<-"NoOfSons"
colnames(df)[13]

#Change the 14th Column's name
colnames(df)[14]<-"NoOfDghtrs"
colnames(df)[14]