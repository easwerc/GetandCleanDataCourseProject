## Getting and Cleaning Data Course Project

Easwer Chinnadurai

### Objective
This code book details about the variables, data and transformations used in the course project.

### Source Data - Collection and Description
A full description of the data used in this project is available at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data file for this project is available at (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Section 1. Merge the training and the test sets to create one data set.
Download the data and unzip it to the current working folder
Open the files in an editor and visually see the data to get a general idea of 
the structure.This help decide which read function to use and its parameters
Read in the data from the unzipped files using read table as they are delimited by whitespace
First read the activity labels and features
- features.txt
- activity_labels.txt

Then read the Test & Train data assigning appropriate column names
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Column bind all the train data and similarly do for test data.
Then row bind both train and test data to create one data set.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Choose only the columns that have either "mean" or "std" in their names and create a new dataset

## Section 3. Use descriptive activity names to name the activities in the data set
Merge the above created dataset with the activityLabels table to include the descriptive activity names

## Section 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern search and replacement to make data labels descriptive.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Use aggregate function to group on Subject and Activity to get the mean on the variables. Then write this data to a file.

The output file (tidyData.txt) has the following data as a tab delimited file
1 ActivityID
2 ActivityDescription
3 SubjectID
Average of the following measurements for each Activity and Subject
4	tBodyAcc-mean()-X
5	tBodyAcc-mean()-Y
6	tBodyAcc-mean()-Z
7	tBodyAcc-std()-X
8	tBodyAcc-std()-Y
9	tBodyAcc-std()-Z
10	tGravityAcc-mean()-X
11	tGravityAcc-mean()-Y
12	tGravityAcc-mean()-Z
13	tGravityAcc-std()-X
14	tGravityAcc-std()-Y
15	tGravityAcc-std()-Z
16	tBodyAccJerk-mean()-X
17	tBodyAccJerk-mean()-Y
18	tBodyAccJerk-mean()-Z
19	tBodyAccJerk-std()-X
20	tBodyAccJerk-std()-Y
21	tBodyAccJerk-std()-Z
22	tBodyGyro-mean()-X
23	tBodyGyro-mean()-Y
24	tBodyGyro-mean()-Z
25	tBodyGyro-std()-X
26	tBodyGyro-std()-Y
27	tBodyGyro-std()-Z
28	tBodyGyroJerk-mean()-X
29	tBodyGyroJerk-mean()-Y
30	tBodyGyroJerk-mean()-Z
31	tBodyGyroJerk-std()-X
32	tBodyGyroJerk-std()-Y
33	tBodyGyroJerk-std()-Z
34	tBodyAccMag-mean()
35	tBodyAccMag-std()
36	tGravityAccMag-mean()
37	tGravityAccMag-std()
38	tBodyAccJerkMag-mean()
39	tBodyAccJerkMag-std()
40	tBodyGyroMag-mean()
41	tBodyGyroMag-std()
42	tBodyGyroJerkMag-mean()
43	tBodyGyroJerkMag-std()
44	fBodyAcc-mean()-X
45	fBodyAcc-mean()-Y
46	fBodyAcc-mean()-Z
47	fBodyAcc-std()-X
48	fBodyAcc-std()-Y
49	fBodyAcc-std()-Z
50	fBodyAcc-meanFreq()-X
51	fBodyAcc-meanFreq()-Y
52	fBodyAcc-meanFreq()-Z
53	fBodyAccJerk-mean()-X
54	fBodyAccJerk-mean()-Y
55	fBodyAccJerk-mean()-Z
56	fBodyAccJerk-std()-X
57	fBodyAccJerk-std()-Y
58	fBodyAccJerk-std()-Z
59	fBodyAccJerk-meanFreq()-X
60	fBodyAccJerk-meanFreq()-Y
61	fBodyAccJerk-meanFreq()-Z
62	fBodyGyro-mean()-X
63	fBodyGyro-mean()-Y
64	fBodyGyro-mean()-Z
65	fBodyGyro-std()-X
66	fBodyGyro-std()-Y
67	fBodyGyro-std()-Z
68	fBodyGyro-meanFreq()-X
69	fBodyGyro-meanFreq()-Y
70	fBodyGyro-meanFreq()-Z
71	fBodyAccMag-mean()
72	fBodyAccMag-std()
73	fBodyAccMag-meanFreq()
74	fBodyBodyAccJerkMag-mean()
75	fBodyBodyAccJerkMag-std()
76	fBodyBodyAccJerkMag-meanFreq()
77	fBodyBodyGyroMag-mean()
78	fBodyBodyGyroMag-std()
79	fBodyBodyGyroMag-meanFreq()
80	fBodyBodyGyroJerkMag-mean()
81	fBodyBodyGyroJerkMag-std()
82	fBodyBodyGyroJerkMag-meanFreq()
