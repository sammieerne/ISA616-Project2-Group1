---
  title: "ISA 616 Project 2"
date: "`r format(Sys.time(), '%d %B, %Y')`"
author: "Samantha Erne and Amber Kopitke"
format:
  html:
  toc: true
toc-location: left
toc-expand: true
code-tools: true 
code-fold: true
code-overflow: scroll
self-contained: true
---
  
  ```{r setup, include=FALSE, warnings= FALSE, messages= FALSE}
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(fig.width=8, fig.height=6)
```

```{r, include= FALSE}
install.packages("dplyr") 
install.packages("readr") 
install.packages("tidyr") 

library(dplyr)         
library(readr)          
library(tidyr)          
```

# Project Overview

In this project, we will be using data collected from 2019-2021 to visualize geographic trends of Farmer School of Business graduates. The client for this project is Mr. Kirk Bogard of the FSB External Relations office. 

The Business Value Proposition that we created for this project is pictured below. In this BVP, we described our client, their jobs, and how our solution will both kill their pains as well as provide additional gains to the clients. 

'''
BVP PHOTO
'''

## Data Description

The data that we will be using for this project is data collected from graduating FSB students in the classes of 2019, 2020, and 2021. This data includes information on major, job title, company, job location, salary, and much more. Analyzing this data will allow us to provide our client with critical insights regarding the geographic trends of FSB graduates that will help them to prepare seniors for the job search and better place students in jobs.

Below is a snapshot of the data set before any cleaning has been done. 

```{r}
fsb_data <- readRDS("~/Desktop/ISA 616/GitHub/ISA616repo/ISA616-Project2-Group1/FSB_BI_Survey_2019_2021.rds")
head(fsb_data)
```

# Cleaning the Data

Before we can start analyzing the data, we need to clean it. Before we start cleaning the data, we want to summarize it to gain a better understanding of the data structure and any issues in the data.

## Remove Unneccessary Columns

Firstly, we will start by removing unnecessary columns from the data set. For our project, we will be analyzing geographic trends, which means many of the columns included in the data are not needed in our analysis. The large number of variables makes it difficult to clean the data, so we will start by dropping these variables before we continue cleaning the data.

In order to remove unnecessary columns, we will create a new data set with the variables we will need in our analysis.

```{r}
fsb_df= fsb_data[c("year.x", "survey_state", "survey_salary", "survey_city", "survey_company", "survey_deptfunc", "survey_plans")]
```

## Reviewing Column Types

To start cleaning the data, we want to check and make sure that all columns are of the proper type. Let's view a glimpse of our new data set.

```{r}
glimpse(fsb_df)
```
During our review of data types, we did not find any column types that we felt needed to be changed. 

## Filter Data

Next, we will be filtering the data to only include information about graduates who accepted jobs, excluding graduates who are following other paths such as continuing their education.


XXX FINISH THIS XXX

```{r}
table(fsb_df['survey_plans'])
```


## Rename Columns

Next, we will be renaming the columns to have more consistent and easier to read names. 

```{r}
fsb_df['Graduation_Year']= fsb_df['year.x']
fsb_df['Job_State']= fsb_df['survey_state']
fsb_df['Job_Salary']= fsb_df['survey_salary']
fsb_df['Job_City']= fsb_df['survey_city']
fsb_df['Employer']= fsb_df['survey_company']
fsb_df['Job Department']= fsb_df['survey_deptfunc']
glimpse(fsb_df)
```


## Review Column Values

* OH and Ohio and OHIO make one


## Checking for Missing Values

### Imputing Missing Values

```{r}
colSums(is.na(fsb_data))
```
