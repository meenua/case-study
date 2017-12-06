# Codebook
Meenu-Iram  
12/6/2017  
This document describes the code for CaseStudy.Rmd

# Project description
As the name suggests, this study was to assess procrastination and its associations with distress and life satisfaction across the life span.

##Loading data
     Raw data(Procrastination.csv)                            
     This dataset has 4265 rows 61 columns                           
     Sample raw data with first 3 rows and first 10 columns is shown below                       
| Age  	| Gender 	| Kids     	| Edu 	| Work Status 	| Annual Income 	| Current Occupation 	| How long have you,held this position?: Years 	| How long have you,held this position?: Months 	| Community size |  
|------	|--------	|--------	|-----	|-------------	|---------------	|--------------------	|----------------------------------------------	|-----------------------------------------------	|----------------	|                                                         
| 67.5 	| Male   	| Yes Kids 	| ma  	| retired     	| 25000         	|                    	| 9                                            	| 0                                             	| Large-city     	|                                               
| 45   	| Male   	| Yes Kids 	| deg 	| part-time   	| 35000         	|                    	| 0                                            	| 0                                             	| Village        	|                                         
| 19   	| Female 	| Yes Kids 	| dip 	| student     	|               	|                    	| 0                                            	| 0                                             	| Town           	|

## The 4265 observations contain the following information, some of which are self explanatory      
  Age	  
  Gender  
  Kids	  
  Edu	- Education level 
  Work Status	- What kind of job (full-time, part-time, unemployed etc) 
  Annual Income	  
  Current Occupation	  
  How long have you held this position?:Years	  
  How long have you held this position?:Months  	
  Community size	  
  Country of residence	  
  Marital Status    	
  Number of sons	  
  Number of daughters   
  DP -  Decisional Procrastination index    
  AIP - Adult Inventpory of Procrastination index   
  GP - General Procrastination index    
  SWLS - Satisfaction with Life Scale   
  Do you consider yourself a procrastinator?  
  Do others consider you a procrastinator?  
  
## Raw data cleanup                           
  Some of the column names were big. All of them were reduced to 12 letters maximum length.                           
  For eg. How long have you held this position ?: Years - renamed to DurationYears                          
          Do you consider yourself a procrastinator? - renamed to SelfProcast                      
          Do others consider you a procrastinator?? - renamed to OthersProcast                        
  Rows that had missing age were removed from the set. So were with missing gender, resident country, work status     
  Data removed from dataset for DurationYears that had invalid data (eg 999)    
  For NoOfSons columns, rows which had 'Male' value was set to 1 whereas a 0 was set for 'Female' value.     
  Occupation column had values that were similar but different values - eg. 'ESL Teacher', 'Teacher'. These were given one value i.e 'Teacher'.                                     

  Apart from cleaning up, four new columns were added to the dataset, viz. DPMean, AIPMean, GPMean and SWLSMean. As the name suggests, each is an average of the index.  
  
## Web Scraping 

    Scraped human development index table from internet                                                                                        (https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries) 
    Cleaned up sample web scraped data is as follows:                                                                
| Country   	| HDI   	| HDICategory                         	|
|-----------	|-------	|-------------------------------------	|
| Norway    	| 0.949 	| High human,development index        	|
| Australia 	| 0.939 	| High human,development index        	|
| France    	| 0.897 	| Medium-high human,development index 	|
| Finland   	| 0.895 	| Medium-high human,development index 	|
| Lesotho   	| 0.497 	| Low human development,index         	|

    HDICategory was created based on the value of HDI column.   

    The cleanedup data from Procrastination.csv was merged with the web scraped data on Country column.
    The merged dataset has 67 columns. It contains all 61 columns from Procrastination.csv.         
    In addition the, merge data contains the four columns of average for DP,AIP,GP,SWLS indexes viz. DPMean, AIPMean, GPMean, SWLSMean and also HDI and HDICategory columns from the web scraped data.          

## Data Processing
    Analysis is done only on those observations where the pariticipant's age was 18 or above.   
    
  Answers following questions about the dataset                                                                                                                  
      1. Provides descriptive statistics on Age, Income, HDI and four mean columns.                                     

  2. Gives the frequencies for Gender, WorkStatus and Occupation.   

  3. Gives the count of participants per country.     
      This table can be found at /reports/tables

  4. Gives a match count of how many considered themselves as well as others Procrastinators.
   Also gives a count of how many did not consider self and others Procrastinators. 

  5. Plots    
    a. Creates two separate bar plots which displays the top 15 nations in average procrastination scores, using (i) GPMean and (ii) DIPMean scores    
    b. Two separate scatter plots to show a relationship between Age and Income and between SWLSMean and HDI.    
    c. A bar plot for HDICatogory using SWLSMean.       
  These plots can be found at /reports/plots

##  Main objects referenced in the code    
    data.frane objects  

    df <- data frame object for Procrastination.csv. This file has 4265 observations and 61 variables
    scraped_df <- scraped human development index table from internet (https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries)

    merge_data - merged dataset of df and scraped_df datasets

    top15_GPrank - top 15 nations in average procrastination scores on General Procrastination Scale( indexGP)
    top15_AIPrank - top 15 nations in average procrastination scores on Adult Inventory of Procrastination Scale(GP)

## Required library
      library(knitr)
      library(rvest)
      library(dplyr)
      library(XML)
      library(RCurl)
      library(plyr)
      library(ggplot2)
      library(RColorBrewer)
