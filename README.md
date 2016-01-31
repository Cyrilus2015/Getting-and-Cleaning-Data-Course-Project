# Getting-and-Cleaning-Data-Course-Project

This is my course project for the Getting and Cleaning Data Coursera course. It's includes the R-script file "run_analysis.R". 
This script-file have to be placed in the working directory and executed by R-command source("run_analysis.R").
It will create the subdirectory data with initial data files and write in the working directory result data file "newtidy.txt".

Script was created and tested in operating system Windows-7 (32 and 64). Also it was tested in initial installation of R version 3.2.3, and there wasn't demanded any additional libraries/packages.

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.  The goal is to prepare tidy data that can be used for later analysis.

Initial date are here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and it's full description here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script have to do the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


