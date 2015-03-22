# datascience-getclean
Course project for Cousera Data Science track Getting and Cleaning Data course.

1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
2. Extract downloaded file "getdata_projectfiles_UCI HAR Dataset.zip to" your working directory. The name of the directory should be "UCI HAR Dataset" after extraction. 
3. Copy run_analysis.R into the work directory.
4. Make sure dplyr package is installed.
5. Use lines below to run run_analysis.
	$source("run_analysis.R")
	$result <- run_analysis()
6. To read result.txt, copy "result.txt" in your working directory and then use the line below:
	$result <- read.table("result.txt", header = T)
