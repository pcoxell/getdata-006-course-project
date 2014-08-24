CODEBOOK
==========================

<h3>Original Data:</h3>
Data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

<h3>Description of the data set:</h3>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

<h3>About the original data set:</h3>
The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': readme for information about the variables in the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': lists each activity name and their corresponding ID number in the dataset.
* 'train/X_train.txt': Training dataset.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test dataset.
* 'test/y_test.txt': Test labels.

The files in /test and /train are equivilant. Their descriptions are as follows: 

* 'test/subject_train.txt': Each row identifies the subject that performed the activity. Range is 1 to 30.
* 'test/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g', which is measured in ms<sup>-2</sup>. Every row shows a 128 element vector. 
* 'test/total_acc_y_train.txt': The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. Every row shows a 128 element vector. 
* 'test/total_acc_z_train.txt': The acceleration signal from the smartphone accelerometer Z axis in standard gravity units 'g', which is measured in ms<sup>-2</sup>. Every row shows a 128 element vector. Acceleration units: ms<sup>-2</sup>
* 'test/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'test/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second (rads<sup>-1</sup>)

<h3>Process of the analysis:</h3>
<h5>'run_analysis.R':</h5>
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

<h3>Expected output:</h3>
1. 'tidydataset1.txt' - This file is a tidy data set, where the mean and standard deviations in the original dataset have been extracted and cleaned up. 
2. 'tidydataset2.txt' - This file is a second, independent tidy data set with the average of each variable for each activity and each subject. 

<h3>About the output data sets:</h3>
Both datasets are outputted in the same format, so the description below applies to both 'tidydataset1.txt' and 'tidydataset2.txt'.

* 'subject' - Number of the subject that carried out the expriment
* 'activity' - Descriptive name of the activity that was carried out. Options are (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

<h5>Feature Selection</h5>
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals and kept in the final dataset are: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
