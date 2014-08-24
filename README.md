getdata-006-course-project
==========================

IMPORTANT NOTE:
When running run_analysis.R, please ensure that you have downloaded and unzipped the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Then, ensure that your working directory is set to "UCI HAR Dataset", otherwise the script will not run.

Once you have downloaded the dataset and set your working directory to "UCI HAR Dataset", download run_analysis.R and place it in the working directory. 

Use source("run_analysis.R") to run the script. 

The labels for the features are identical to the labels stored in features.txt. While they could have been cleaned up further, I have kept their original names to make any later analysis easier with reference to the readme files from the original data set.

The script will output two files:
1. tidydataset1.txt - This file is a tidy data set, where the mean and standard deviations in the original dataset have been extracted and cleaned up. 
2. tidydataset2.txt - This file is a second, independent tidy data set with the average of each variable for each activity and each subject. 

The script works as follows:

1. Reads subject files from test and train folders
2. Reads X files from test and train folders
3. Reads y files from test and train folders
4. rbinds subject files together (train first) and assign name to column
5. Reads features.txt (for labels)
6. rbinds y files together (train first) and assign name to column
7. rbinds X files togheter (train first)
8. Extracts necessary columns from X (Means and Standard Deviations)
9. Extracts labels from features variable and label extracted columns from X
10. Replaces code numbers in y with understandable labels, as described by activity_labels.txt
11. cbinds the subject, activity and data together to create the dataset
12. Stores the tidy dataset in a new text file (1st dataset)
13. Uses a for loop to calculate the averages and bind them to a new dataset in order of subject, then activity

run_analysis.R is commented so you can follow these steps in the code.
