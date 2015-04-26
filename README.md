## Getting_clean_data_The_Course_Project
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. This repo explains how all of the scripts work and how they are connected. 

###The original data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The description of these downloaded data is available at the site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###The Script, Global description:
The data is analysed by the R script called run_analysis.R that does the following. 
Merges the training and the test sets to one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Full description:
1) The libraries necessary for the run_analysis.R script are plyr and dplyr these are loaded. The wd is set to the "UCI HAR
Dataset folder". The files (features, X_test, y_test, subject_test, X_train, y_test and subject_train all .txt files)
are loaded with the read table function.

2) The names in the features file are mutated so R can work with it. The files X_test, y_test, subject_test are cbind to the testdata dataset, the files X_train, y_test and subject_train are cbind to the traindata dataset. 

3)The traindata and the testdata are row binded to the dataset "data".

4) Than the columns are extracted with only the measurements on the mean and standard deviation for each measurement. The grep function is used on the features file, with the column numbers as result, the two column numbers for activity and subject are added, with this is the subsetting on the data object preformed. The columnnames are set and a .txt file is writen with the data so far.

5) For the second tidy dataset we needed the average of each variable for each activity and each subject. Here is the ddply function used. First selecting the dataset named "data", than the dataframe is split by the variables "Subject" and "Activity" and the applied function is colMeans.

6) The second tidy dataset is written with the write.table command with the file name "data_2.txt" and the row.name is set to False.
