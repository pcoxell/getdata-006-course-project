Getting and Cleaning Data Course Project
==========================

<h3>IMPORTANT NOTE:</h3>
When running run_analysis.R, please ensure that you have downloaded and unzipped the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Then, ensure that your working directory is set to "UCI HAR Dataset", otherwise the script will not run.

<h3>Note about speed:</h3>
The script will take a short while to complete, please be patient whilst the script is running.

<h3>Instructions:</h3>
1. Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the dataset. You will now have a "UCI HAR Dataset" folder.
3. Set your working directory to "UCI HAR Dataset"
4. Download "run_analysis.R" into the working directory.
5. Use source("run_analysis.R") to run the script. 

<h3>Dependencies:</h3>
This script only requires the base R package. No other packages were used to conduct the analysis.

<h3>Note about features:</h3>
The labels for the features are identical to the labels stored in features.txt. The original names have been kept the same as those stored in features.txt to make any later analysis easier with reference to the readme and files from the original data set.

<h3>Expected output:</h3>
1. tidydataset1.txt - This file is a tidy data set, where the mean and standard deviations in the original dataset have been extracted and cleaned up. 
2. tidydataset2.txt - This file is a second, independent tidy data set with the average of each variable for each activity and each subject. (This is the file that was uploaded for the dataset submission on Coursera)

<h3>Process:</h3>
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
