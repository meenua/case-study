# Case-Study
Meenu-Iram  
12/5/2017  





```r
#Q2
df <- read.csv("Procrastination.csv", check.names = FALSE)
```
#### Nomber of rows and columns for Procrastination.csv

```r
#2.a
kable(nrow(df))
```



|     |
|----:|
| 4264|

```r
kable(ncol(df))
```



|   |
|--:|
| 61|

```r
#Cleanup
#2.b
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

#2c
#Remove rows with no age
df<- df[!(is.na(df$Age) | df$Age==""),]

df<- df[!(is.na(df$Gender) | df$Gender==""),]
df<- df[!(is.na(df$WorkStatus) | df$WorkStatus==""),]
df<- df[!(is.na(df$ResidntCntry) | df$ResidntCntry==0 | df$ResidntCntry==""),]

df<- df[!(is.na(df$DurationYear) | 
            df$DurationYear=="" |
            df$DurationYear==999),]
df$DurationYear <- ceiling(df$DurationYear)

i <- sapply(df, is.factor)
df[i] <- lapply(df[i], as.character)

#Remove Male/Female from No of Sons column
df$NoOfSons <- replace(df$NoOfSons,df$NoOfSons=="Female",0)
df$NoOfSons <- replace(df$NoOfSons,df$NoOfSons=="Male",1)

#Cuurent occupation
df<- df[!(is.na(df$Occupation) | df$Occupation=="Please specify"
          | df$Occupation=="please specify"
          | df$Occupation==0),]

df$Occupation <-replace(df$Occupation, grepl("^(?!.*?Multimedia\\\\sDeveloper|Technology\\\\sCurriculum).*Developer",df$Occupation, perl=TRUE,ignore.case=TRUE),"Software Engineer")
df$Occupation <- replace(df$Occupation, grepl("\bAcademic\b", df$Occupation, perl=TRUE, ignore.case = TRUE), "Academic Assitant")
df$Occupation <- replace(df$Occupation, grepl("\bProgrammer\b", df$Occupation, perl=TRUE, ignore.case = TRUE), "Software Engineer")
df$Occupation <- replace(df$Occupation, grepl("Account(s|ing|ant)*", df$Occupation, perl=TRUE, ignore.case = TRUE), "Accountant")
df$Occupation <- replace(df$Occupation, grepl("Art(ist)*", df$Occupation, perl=TRUE,ignore.case = TRUE), "Artist")
df$Occupation <- replace(df$Occupation, grepl("Attorney", df$Occupation, perl=TRUE, ignore.case = TRUE), "Attorney")
df$Occupation <- replace(df$Occupation, grepl("business(woman)*", df$Occupation, perl=TRUE,ignore.case = TRUE), "Business")
df$Occupation <- replace(df$Occupation, grepl("Computer\\\\s(Consultant|Operator)*", df$Occupation, perl=TRUE,ignore.case = TRUE), "IT Consultant")
df$Occupation <- replace(df$Occupation, grepl("IT", df$Occupation, perl=TRUE,ignore.case = TRUE), "IT Consultant")
df$Occupation <- replace(df$Occupation, grepl("Professor", df$Occupation, perl=TRUE,ignore.case = TRUE), "Professor")
df$Occupation <- replace(df$Occupation, grepl("Financ(e|ial)*", df$Occupation, perl=TRUE,ignore.case = TRUE), "Financial Consultant")
df$Occupation <- replace(df$Occupation, grepl("^(Assistant)*.Teacher", df$Occupation, perl=TRUE,ignore.case = TRUE), "Teacher")
df$Occupation <- replace(df$Occupation, grepl("Student/Teacher", df$Occupation, perl=TRUE,ignore.case = TRUE), "Teacher")
df$Occupation <- replace(df$Occupation, grepl("Pre-school Teacher", df$Occupation, perl=TRUE,ignore.case = TRUE), "Teacher")
df$Occupation <- replace(df$Occupation, grepl("special education teacher", df$Occupation, perl=TRUE,ignore.case = TRUE), "Teacher")
df$Occupation <- replace(df$Occupation, grepl("Early child hood Teacher", df$Occupation, perl=TRUE,ignore.case = TRUE), "Teacher")

#2d
check_type <- sapply(df,class)

#2e
#Mean for all DP or each DP
df$DPMean <- apply(df[,c(15:19)],1,mean)
df$AIPMean <- apply(df[,c(20:34)],1,mean)
df$GPMean <- apply(df[,c(35:54)],1,mean)
df$SWLSMean <- apply(df[,c(55:59)],1,mean)

### Cleanedup dataset can be found at /data/cleaned/DF.csv in the repository 
write.csv(df,"DF.csv")

###Sample data
kable(head(df))
```



  Age  Gender   Kids       Edu   WorkStatus    AnnualIncome  Occupation    DurationYear   DurationMon  CommSize     ResidntCntry     MaritlStatus   NoOfSons    NoOfDghtrs   DP1   DP2   DP3   DP4   DP5   AIP1   AIP2   AIP3   AIP4   AIP5   AIP6   AIP7   AIP8   AIP9   AIP10   AIP11   AIP12   AIP13   AIP14   AIP15   GP1   GP2   GP3   GP4   GP5   GP6   GP7   GP8   GP9   GP10   GP11   GP12   GP13   GP14   GP15   GP16   GP17   GP18   GP19   GP20   SWLS1   SWLS2   SWLS3   SWLS4   SWLS5  SelfProcast   OtherProcast    DPMean    AIPMean   GPMean   SWLSMean
-----  -------  ---------  ----  -----------  -------------  -----------  -------------  ------------  -----------  ---------------  -------------  ---------  -----------  ----  ----  ----  ----  ----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ------  ------  ------  ------  ------  ------  ----  ----  ----  ----  ----  ----  ----  ----  ----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ------  ------  ------  ------  ------  ------------  -------------  -------  ---------  -------  ---------
 67.5  Male     Yes Kids   ma    retired              25000                           9             0  Large-City   El Salvador      Divorced       0                    5     3     1     1     1     1      1      1      1      1      1      1      1      1      5       1       1       1       1       1       3     1     1     1     1     1     1     1     1     1      1      5      1      1      1      1      1      1      5      1      5       5       5       5       5       5  no            no                 1.4   1.400000     1.60        5.0
 45.0  Male     Yes Kids   deg   part-time            35000                           1             0  Village      Bolivia          Married        1                    1     3     4     3     3     3      3      1      4      3      3      4      3      3      3       3       4       2       2       2       4     4     2     2     2     2     2     4     2     4      2      3      4      2      2      3      4      3      3      4      4       3       4       4       4       3  yes           yes                3.2   2.933333     2.90        3.6
 19.0  Female   No Kids    dip   student                 NA                           0             0  Large Town   Cyprus           Single         0                    0     5     5     2     3     3      5      4      4      5      5      5      5      4      5       5       4       3       5       4       3     5     2     2     4     3     1     3     2     5      4      5      5      3      4      5      2      3      5      5      4       2       2       2       3       4  yes           yes                3.6   4.400000     3.60        2.6
 37.5  Male     Yes Kids   ma    full-time            45000                          14             0  Large Town   Czech Republic   Married        0                    1     3     3     3     3     3      2      1      4      3      5      3      4      5      4       5       4       3       4       2       1     4     1     3     3     2     3     4     5     4      1      3      4      3      3      4      4      3      4      5      1       2       4       2       2       2  yes           yes                3.0   3.333333     3.20        2.4
 28.0  Female   No Kids    deg   full-time            35000                           1             0  Village      Czech Republic   Single         0                    0     3     3     2     1     1      1      1      3      3      2      2      2      2      1       1       2       1       2       1       2     4     1     2     4     5     2     4     2     4      1      2      3      2      4      3      2      3      2      3      4       4       4       4       3       4  no            no                 2.0   1.733333     2.85        3.8
 23.0  Female   No Kids    deg   full-time            15000                           1             0  Small Town   Czech Republic   Single         0                    0     3     4     3     2     2      2      5      5      5      5      3      5      4      4       5       3       5       4       5       5     5     5     2     5     4     4     5     4     4      3      4      4      3      4      4      4      4      4      4      4       3       2       4       4       3  yes           yes                2.8   4.333333     4.00        3.2

```r
#Q3
#Web scraping

url1 = "https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries"

theURL <- getURL(url1)
tables <- readHTMLTable(theURL,header = TRUE,stringsAsFactors = FALSE, encoding="UTF-8")

scraped_df = data.frame("Country" = character(0), "HDI"=double(0.0))

#Only pick the tables of interest
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[3]]$V3,"HDI"=tables[[3]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[6]]$V3,"HDI"=tables[[6]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[9]]$V3,"HDI"=tables[[9]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[12]]$V3,"HDI"=tables[[12]]$V4))

scraped_df <- scraped_df[!(scraped_df$Country=="2016 estimates for 2015[1]" | 
                           scraped_df$Country=="HDI" | 
                            scraped_df$HDI=="Change from previous year[1]" ),]
#Cleanup
scraped_df$Country <- lapply(scraped_df$Country, function(x) {
                                  gsub("\u00A0", "", x) 
                            })
#3b
scraped_df$Country <- as.character(as.character(scraped_df$Country))
scraped_df$HDI <- as.numeric(as.character(scraped_df$HDI))

lev <- c(0.3, 0.5, 0.7, 0.9,1)

lab <- c("Low human development index","Medium human development index", 
         "Medium-high human development index","High human development index")

HDICategory<-cut(scraped_df$HDI,lev,lab)
scraped_df <- cbind(scraped_df, HDICategory)

##### HDI.csv can be found at /data/cleaned in the repo
write.csv(scraped_df,"HDI.csv", row.names = FALSE)

##### Sample data from HDI.csv 
kable(head(scraped_df))
```

     Country          HDI  HDICategory                  
---  ------------  ------  -----------------------------
3    Norway         0.949  High human development index 
4    Australia      0.939  High human development index 
5    Switzerland    0.939  High human development index 
6    Germany        0.926  High human development index 
7    Denmark        0.925  High human development index 
8    Singapore      0.925  High human development index 

```r
#3c
merge_data <- merge(df,scraped_df, by.x = "ResidntCntry", by.y = "Country")
##### Merged.csv can be found at /data/cleaned in the repo ####
write.csv(merge_data,"Merged.csv")
##### Sample data from Merged.csv 
kable(head(merge_data))
```



ResidntCntry     Age  Gender   Kids       Edu     WorkStatus    AnnualIncome  Occupation          DurationYear   DurationMon  CommSize       MaritlStatus   NoOfSons    NoOfDghtrs   DP1   DP2   DP3   DP4   DP5   AIP1   AIP2   AIP3   AIP4   AIP5   AIP6   AIP7   AIP8   AIP9   AIP10   AIP11   AIP12   AIP13   AIP14   AIP15   GP1   GP2   GP3   GP4   GP5   GP6   GP7   GP8   GP9   GP10   GP11   GP12   GP13   GP14   GP15   GP16   GP17   GP18   GP19   GP20   SWLS1   SWLS2   SWLS3   SWLS4   SWLS5  SelfProcast   OtherProcast    DPMean    AIPMean   GPMean   SWLSMean     HDI  HDICategory                         
-------------  -----  -------  ---------  ------  -----------  -------------  -----------------  -------------  ------------  -------------  -------------  ---------  -----------  ----  ----  ----  ----  ----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ------  ------  ------  ------  ------  ------  ----  ----  ----  ----  ----  ----  ----  ----  ----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ------  ------  ------  ------  ------  ------------  -------------  -------  ---------  -------  ---------  ------  ------------------------------------
Afghanistan     55.0  Female   Yes Kids   deg     full-time            10000                                 7             0  Village        Divorced       4                    0     4     3     4     3     2      1      2      1      4      3      5      4      4      3       3       3       4       3       3       3     3     2     2     5     3     3     3     5     3      1      2      3      1      1      3      3      3      4      3      3       1       1       1       3       1  no            yes                3.2   3.066667      2.8        1.4   0.479  Low human development index         
Afghanistan     55.0  Male     Yes Kids   ma      full-time           150000                                 1             0  Large Town     Married        4                    2     4     4     4     3     3      3      4      5      4      3      4      3      5      4       3       5       5       1       5       4     4     4     5     3     1     3     4     4     4      4      4      4      3      4      4      4      4      4      3      4       3       3       2       2       2  yes           yes                3.6   3.866667      3.7        2.4   0.479  Low human development index         
Afghanistan     80.0  Female   No Kids    grade   unemployed           10000                                 0             0  Medium-Sized   Single         0                    0     2     3     2     3     5      2      2      3      4      2      2      2      1      1       3       5       4       3       3       4     4     4     1     4     4     4     4     3     2      2      3      3      2      3      2      4      4      4      3      4       2       4       3       3       2  yes           no                 3.0   2.733333      3.2        2.8   0.479  Low human development index         
Afghanistan     55.0  Male     No Kids    deg     full-time            87500                                 1             6  Large Town     Married        0                    0     3     3     3     4     3      3      2      2      2      3      2      3      3      2       3       4       2       4       2       3     4     2     4     3     3     3     3     4     4      2      2      3      2      4      3      4      3      3      4      4       3       2       2       3       2  yes           no                 3.2   2.666667      3.2        2.4   0.479  Low human development index         
Albania         45.0  Female   No Kids    ltuni   full-time           150000                                 1             0  Large Town     Single         0                    0     3     3     5     3     3      3      1      2      1      2      2      2      2      1       2       3       2       2       1       5     5     3     2     2     5     4     5     5     5      1      3      4      5      5      5      4      3      4      4      4       3       3       3       4       2  yes           no                 3.4   2.066667      3.9        3.0   0.764  Medium-high human development index 
Albania         67.5  Male     Yes Kids   deg     part-time            87500  Media Consultant               4             0  Large-City     Divorced       0                    2     4     3     2     2     1      4      1      5      1      2      1      1      3      2       3       3       1       3       1       5     4     1     2     2     3     2     2     2     4      1      2      4      4      4      4      4      4      3      4      4       3       4       3       5       4  yes           no                 2.4   2.400000      3.0        3.8   0.764  Medium-high human development index 

```r
#4
#4a
merge_data <- merge_data[merge_data$Age>17, ]

#Removing adults who are 67 and above to keep those still working
merge_data <- subset(merge_data, Age < 65)

# Bucketing the education infor to consolidate it. Replacing for college in Edu
merge_data$Edu <- gsub('deg', '12-16 Years', merge_data$Edu)

# Replacing for high school:
merge_data$Edu <- gsub('dip', '12 Years or Less', merge_data$Edu)

# Replacing for ma:
merge_data$Edu <- gsub('ma', '16+ Years', merge_data$Edu)

# Replacing for Grade school:
merge_data$Edu <- gsub('grade', '12 Years or Less', merge_data$Edu)

# Replacing for Ituni (prob a mistake):
merge_data$Edu <- gsub('ltuni', '12-16 Years', merge_data$Edu)

# Replacing for high school
merge_data$Edu <- gsub('high', '12 Years or Less', merge_data$Edu)

# Replacing for phd
merge_data$Edu <- gsub('phd', '16+ Years', merge_data$Edu)

# Replacing for lthigh
merge_data$Edu <- gsub('lthigh', '12 Years or Less', merge_data$Edu)

#4b. Descriptive Statistics for Age, Income, HDI, & the 4 mean columns. Data doesn't look right
kable(stat.desc(merge_data[,cbind("Age", "AnnualIncome", "HDI", "DPMean", "AIPMean","GPMean", "SWLSMean")],options(scipen = 100, digits = 2), basic = F))
```

             Age   AnnualIncome       HDI    DPMean   AIPMean    GPMean   SWLSMean
---------  -----  -------------  --------  --------  --------  --------  ---------
nbr.val     3006           2811   3006.00   3006.00   3006.00   3006.00    3006.00
nbr.null       0              0      0.00      0.00      0.00      0.00       0.00
nbr.na         0            195      0.00      0.00      0.00      0.00       0.00
median        38          45000      0.92      3.00      3.00      3.30       3.00
mean          37          61172      0.91      3.05      2.99      3.26       3.03
std.dev       11          54079      0.06      0.96      0.81      0.68       0.97

```r
#Create 2 histograms 
#Remove NA for AnnualIncome
merge_data<- merge_data[!(is.na(merge_data$AnnualIncome) | merge_data$AnnualIncome==""),]
AnnualIncome<-c(merge_data$AnnualIncome)
hist(AnnualIncome, col = "Light Blue", breaks = 6)
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
main = "Distibution of Annual Income for Procrastination Survey"

#Histograms for Age
Age<-c(merge_data$Age)
hist(Age, col = "Green", breaks = 6)
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-2.png)<!-- -->

```r
# 4c.Frequencies for Gender, Work Status, Occupation (Have to bucket occupation first)
kable(count(merge_data,'Gender'))
```



Gender    freq
-------  -----
Female    1622
Male      1189

```r
#barplot of frequency gender:
barplot(table(merge_data$Gender), main='Frequency of Surveyed by Gender', xlab='Gender', ylab='Frequency', col = c("Light Blue", "Grey"))
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-3.png)<!-- -->

```r
#frequency table Work Status:
kable(count(merge_data,'WorkStatus'))
```



WorkStatus    freq
-----------  -----
full-time     1894
part-time      363
retired         38
student        364
unemployed     152

```r
#barplot of frequency work status:
barplot(table(merge_data$WorkStatus), main='Frequency of Surveyed by Employment Status', xlab='Work Status', ylab='Frequency', col = c("Light Green", "Light Blue", "Yellow", "Grey", "Brown"))
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-4.png)<!-- -->

```r
#Occupation
#Factor the column and get the total count for each occupation
merge_data$Occupation <- factor(merge_data$Occupation)
grouped <- count(merge_data,'Occupation')

#Display top 10 jobs
newdata <- head(grouped[order(-grouped$freq),],11)
newdata <- newdata[-1,]
newdata$Occupation <- as.character(newdata$Occupation)
newdata$Occupation[is.na(newdata$Occupation)] <- "Missing data"
kable(newdata)
```

      Occupation              freq
----  ---------------------  -----
155   IT Consultant            119
320   Teacher                   76
236   Professor                 51
34    Attorney                  50
382   engineer                  29
410   manager                   28
128   Financial Consultant      22
27    Artist                    20
297   Software Engineer         20
191   Marketing                 19

```r
#### Complete occupation frequency table can be found at /reports/tables
write.csv(newdata,"OccupationFreq.csv")

    
#4d. Count surveyors by Country in descending order (make it better)
grouped_cntry <- count(merge_data,'ResidntCntry')
table <- head(grouped_cntry[order(-grouped_cntry$freq),],10)
kable(table)
```

     ResidntCntry      freq
---  ---------------  -----
65   United States     2059
13   Canada             185
64   United Kingdom     138
6    Australia           87
29   India               41
32   Italy               24
23   Germany             23
31   Ireland             16
11   Brazil              12
15   China               11

```r
#### Complete occupation frequency table can be found at /reports/tables
write.csv(grouped_cntry,"CountryFreq.csv")

merge_data<- merge_data[!(is.na(merge_data$SelfProcast) | merge_data$SelfProcast==""),]
merge_data<- merge_data[!(is.na(merge_data$OtherProcast) | merge_data$OtherProcast=="" | merge_data$OtherProcast==4),]

procast_count <- count(merge_data, c("SelfProcast", "OtherProcast"))       
procast_count <- procast_count[-c(2,3),]
kable(procast_count)
```

     SelfProcast   OtherProcast    freq
---  ------------  -------------  -----
1    no            no               312
4    yes           yes             1661

```r
#5
#5b
df_CntryGPMean <- aggregate( GPMean ~ ResidntCntry, merge_data, mean )

df_CntryHDI <- aggregate( HDI ~ ResidntCntry, merge_data, mean )

df_mergeCntryGP <- merge(df_CntryGPMean,df_CntryHDI,by = "ResidntCntry")

df_mergeCntryGP$HDI <- factor(df_mergeCntryGP$HDI)

top15_GPrank <- head(df_mergeCntryGP[order(df_mergeCntryGP$GPMean, decreasing= T),], n = 15)

ggplot(top15_GPrank, aes(x= reorder(ResidntCntry, -GPMean), y = GPMean, fill= HDI)) +
  geom_bar(stat ="identity") +
  ggtitle("Countrywise Plot of the General Procrastination Scale") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(x="Country", y="GP Average") +
  scale_color_brewer(palette="Dark2")
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-5.png)<!-- -->

```r
#### Top 15 GP rank nations table can be found at /reports/tables
write.csv(top15_GPrank,"GPRank.csv")

#5c
df_CntryAIPMean <- aggregate( AIPMean ~ ResidntCntry, merge_data, mean )

df_mergeCntryAIP <- merge(df_CntryAIPMean,df_CntryHDI,by = "ResidntCntry")

df_mergeCntryAIP$HDI <- factor(df_mergeCntryAIP$HDI)

top15_AIPrank <- head(df_mergeCntryAIP[order(df_mergeCntryAIP$AIPMean, decreasing= T),], n = 15)

ggplot(top15_AIPrank, aes(x= reorder(ResidntCntry, -AIPMean), y = AIPMean, fill= HDI)) +
  geom_bar(stat ="identity") +
  ggtitle("Countrywise plot of Adult Inventory of Procrastination Index") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(x="Country", y="AIP Average") +
  scale_color_brewer(palette="Set1")
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-6.png)<!-- -->

```r
#### Top 15 AIP rank nations table can be found at /reports/tables
write.csv(top15_AIPrank,"AIPRank.csv")

#5d
merge_data$Gender<- factor(merge_data$Gender)
ggplot(merge_data, aes(x=Age, y=AnnualIncome)) + 
  geom_point(aes(col=Gender))+
  geom_smooth(method=lm) +
  theme(plot.title = element_text(hjust = 0.5)) +
labs(y="Income", 
     x="Age", 
     title="Age Vs Income Scatterplot")
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-7.png)<!-- -->

```r
### There seems to be a strong correlation between Age and Income.

#5e
ggplot(merge_data, aes(x=SWLSMean, y=HDI)) + 
  geom_point(aes(col=Gender))+
  geom_smooth(method=lm) +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(y="HDI", 
       x="Life Satisfaction", 
       title="Life Satisfaction Vs HDI Scatterplot") 
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-8.png)<!-- -->

```r
ggplot(merge_data, aes(x= reorder(HDICategory, -SWLSMean), y = SWLSMean, fill = Gender)) +
  geom_bar(stat ="identity") +
  ggtitle("Human Developement Index Category Vs Life Satisfaction") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(x="HDI Category", y="Life Satisfaction Index") +
  scale_color_brewer(palette="Set1")
```

![](CaseStudy_files/figure-html/unnamed-chunk-2-9.png)<!-- -->

```r
## For the scatter plot, the correlation line is horizontal indicating that there is no correlation between Life Satisfaction Index and Human Development Index. However, a bar plot of HDI Category against the Life Satisfaction Index suggests that for high levels of HDI Category, Life Satisfaction is more.
```
