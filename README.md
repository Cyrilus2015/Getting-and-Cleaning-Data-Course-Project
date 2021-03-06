# Getting-and-Cleaning-Data-Course-Project

This is my course project for the Getting and Cleaning Data Coursera course. It's includes the R-script file "run_analysis.R". 
This script-file have to be placed in the working directory and executed by R-command source("run_analysis.R").
It will create the subdirectory "data" with initial data files and write in the working directory result data file "newtidy.txt".

Script was created and tested in operating system Windows-7 (32 and 64). Also it was tested in initial installation of R version 3.2.3, and there wasn't demanded any additional libraries/packages.

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.  The goal is to prepare tidy data that can be used for later analysis.

Initial date are here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and it's full description here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The initial analysis data files place in the subdirectory "data". In this directory one zip-file "Data.zip" present and it's content have unpacked in the subdirectory "UCI HAR Dataset" with following files. 

1. activity_labels.txt - 6 types of activities on testing.
2. features.txt - the list of all 561 variables - parameters of the measurements.
3. features_info.txt - description of this variables.
4. README.txt - the short information about measurements.

In subdirectories "test" and "train" three similarly named files take place.

1. subject_test.txt and subject_train.txt - the id-list of the subjects for every measurements.
2. X_test.txt and X_train.txt - list of results of the measurements - 561 parameters for the many combinations of subjects and activities.
3. y_test.txt and y_train.txt the - id-list of the activities for every measurements.

So the couples for the measurement are separated into different files.

Subdirectories "Inertial Signals" have to be ignored for the aim of this project.

The script have to do the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


