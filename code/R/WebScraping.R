library(rvest)
library(XML)
library(tidyr)
library(RCurl)
url1 = "https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries"


theURL <- getURL(url1)
tables <- readHTMLTable(theURL,header = TRUE,stringsAsFactors = FALSE, encoding="UTF-8")

length(tables)

scraped_df = data.frame("Country" = character(0), "HDI"=double(0.0))
str(scraped_df)

scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[3]]$V3,"HDI"=tables[[3]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[6]]$V3,"HDI"=tables[[6]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[9]]$V3,"HDI"=tables[[9]]$V4))
scraped_df <- rbind(scraped_df,data.frame("Country"=tables[[12]]$V3,"HDI"=tables[[12]]$V4))

dim(scraped_df)

scraped_df <- scraped_df[!(scraped_df$Country=="2016 estimates for 2015[1]" | 
                             scraped_df$Country=="HDI" | 
                             scraped_df$HDI=="Change from previous year[1]" ),]

scraped_df$Country <- lapply(scraped_df$Country, function(x) {
  gsub("\u00A0", "", x) 
})
class(scraped_df)
sapply(scraped_df,class)
scraped_df$Country <- as.character(as.character(scraped_df$Country))

scraped_df$HDI <- as.numeric(as.character(scraped_df$HDI))
library(dplyr)
lev <- c(0.3, 0.5, 0.7, 0.9,1)

lab <- c("Low human development index","Medium human development index", 
         "Medium-high human development index","High human development index")

scraped_df %>% mutate(category=cut(HDI,lev,lab))

category<-cut(scraped_df$HDI,lev,lab)
scraped_df <- cbind(scraped_df, category)

write.csv(scraped_df,"HDI.csv", row.names = FALSE)

merge_data <- merge(df,scraped_df, by.x = "ResidntCntry", by.y = "Country")
getwd()
write.csv(merge_data,"Merged.csv")
