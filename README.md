# datascience-getclean
Course project for Cousera Data Science track Getting and Cleaning Data course.

1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
2. Extract downloaded file "getdata_projectfiles_UCI HAR Dataset.zip to" your working directory. The name of the directory should be "UCI HAR Dataset" after extraction. 
3. Copy run_analysis.R into your working directory.
4. Make sure dplyr package is installed.
5.  run_analysis.R
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement. 
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names. 
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

	Use the lines below to run run_analysis. <br/>
	$source("run_analysis.R")<br/>
	$result <- run_analysis()
6. To read result.txt, copy "result.txt" in your working directory and then use the line below:<br/>
	$result <- read.table("result.txt", header = T)
