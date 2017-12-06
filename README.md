# case-study
Executive Summary

Our company MAIB Consulting specializes in providing self-help and stress-coping strategies and trainings for working adults. We are a multinational company with offices in major countries across the globe. We recognize in today’s world, stress is as common as the common cold. But unlike the common cold it can have a lasting negative impact on people’s personal lives, their productivity at work, and to the bottom line of the companies they work for.

We have the best stress coping trainings for working adults. How can we claim that? Because we use a superior method of collecting information. Procrastination has recently come under the spotlight for being a major driver of stress. There have been a handful of studies conducted on the subject. Though informative, they did not span a variety of social and economic triggers of procrastination. We wanted to look at the problem of procrastination as a stress inducer in adults through an international lens. We conducted a global survey of 4,198 participants and included social/economic information such as age, level of education attained, where they lived, their occupation, marital status, salary, number of children to name a few. We also asked them to rate if they thought they were procrastinators and also if people believed they were procrastinators. To gauge the weight of procrastination on inducing stress, we also administered surveys for decisional procrastination scale, Adult Inventory of Procrastination, General Procrastination scale, and the Satisfaction with Life Scale.

We are ideally suited to support Better Foods, Inc. with employees in all major countries, with providing stress coping training to your employees. A company with a culture of having strong social responsibility, it recognizes the prevalence and effects of stress on working adults. MAIB is looking forward to help your company identify which of your employees are at risk of developing stress due to procrastination and conduct appropriate stress-coping trainings before it impacts the livelihood and productivity of the employees.

Survey Background 
Provided here is a summary of our comprehensive survey and study that was undertaken to understand procrastination and create trainings for help. 
- The survey was administered to 4,198 individuals globally 
- The sample set represented people from all walks of life and spanned varied age groups 
- As requested, individuals 18 years and below were removed from the data set 
- Included in the survey were 45 questions covering: 
a. Decisional Procrastination Scale (Mann, 1982) 
b. Adult Inventory of Procrastination (McCown & Johnson, 1989) 
c. General Procrastination scale (Lay, 1986) 
d. Satisfaction with Life Scale (Diener et al., 1985) 
e. And self-rating on being a procrastinator and others perception of those surveyed as procrastinators or not 
- Fourteen socio economic factors like age, marital status, number of children, gender of the respondents, annual income, country of residence, occupation, work status etc. were included 
- As requested consideration was given to age, income, HDI, and mean sof the procrastination scales.

Repository Structure 
As requested, to be transparent and keep the study reproducible, in keeping with good practice the following structure has been used. RMarkdown and Markdown files have been provided for easy reproducibility 
Root 
Data - folder houses the raw data files and the cleaned version 
Raw - It has the original raw data file Procrastination.csv that was used. 
- Cleaned - Includes the below:

df.csv - This was used for cleaning up data to remove rows where there was no age provided; cleaned up incorrect values, showing up as daughters under number of sons; web scraping was performed on https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries site to scrape the Human Development Index tables
Merged.csv - where the scraped data was merged to include column for HDI and one for HDI categories
HDI.csv - finalized HDI table
CaseStudy.Rmd - Has all the code used to perform the scrapping, removing activities needed to clean the data 
Src 
- R files for the study 
- RMarkdown RMarkdown files for easy reproducibility 
= Codebook.md that includes brief overview of the steps taken to clean the data, list of attributes used and their brief description 
Reports 
- Files that will include the Top 15 Country by Procrastination score, tables of respondents by country 
- Plots All the graphs, including histograms, frequency charts, scatter plots used 
Readme.md

Contact Information 
Please direct all questions regarding the survey and its findings and materials used to: 

Meenu Ahluwalia 
(P) 1 (569) 222- 3434 
(e) Meenu@MAIBInc.com

Iram Bakhtiar 
(P) 1 (569) 832- 4000 
(e) Iram@MAIBInc.com

