# Getting_clean_data_The_Course_Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data 
set as described below, 2) a link to a Github repository with your script for performing the analysis, 
and 3) a code book that describes the variables, the data, and any transformations or work that you 
performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with 
your scripts. This repo explains how all of the scripts work and how they are connected. 

The used data for the project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The description of these downloaded data is available at the site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In short:
The data is analysed by the R scriped called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Full discription:
The libraries necessary for the run_analysis.R script are plyr and dplyr. The wd is set to the UCI HAR
Dataset folder. The files (features, X_test, y_test, subject_test, X_train, y_test and subject_train all .txt files)
are loaded with the read table function.
The names in the features file are mutated so R can work with it. The files X_test, y_test, subject_test are cbind to the testdata object, the files X_train, y_test and subject_train are cbind to the traindata object. the traindata and the test data are row binded to the object data
Than the columns are extracted with only the measurements on the mean and standard deviation for each measurement. The grep function is used on the features file, with the column numbers as result. The two column numbers for activity and subject are added, with this is the subsetting on the data object preformed. The columnnames of the data object by subsetting the rows from features and adding "subject" and "activity". A .txt file is writen with the data so far.
For the second tidy dataset we needed the average of each variable for each activity and each subject. where the ddply function is used. First selecting the data, than the data frame is split by the variables "subject" and "activity" and the applied function is colMeans.
The second tidy dataset is than written with the write.table command to the file name data_2.txt with no row names.

