################### Getting and Cleaning Data Course Project ######################
#
# ### Problem statement ###
# Create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
######################################################################################

# Clean up workspace and set the working directory
rm(list=ls())
#setwd("C:\\Rworks")

#### 0. Prepare the data
# Download the data and unzip it to the current working folder
data_source_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_data <- "Dataset.zip"
  
download.file(data_source_url, destfile=zip_data)
unzip(zip_data)

# Open the files in an editor and visually see the data to get a general idea of 
# the structure.This help decide which read function to use and its parameters
 
## Read in the data from the unzipped files using read table as they are delimited by whitespace
# First read the activity labels and features
features       <- read.table("./UCI HAR Dataset/features.txt", 
                            , col.names=c("featureID", "featureType"))
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt"
                            , col.names=c("activityID","activityType")) 

# Read the Test data assigning appropriate column names
subjectTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt"
                          , col.name=c("subjectID"))

xTest        <- read.table("./UCI HAR Dataset/test/x_test.txt"
                          , col.names=features$featureType)

yTest        <- read.table("./UCI HAR Dataset/test/y_test.txt"
                          , col.name=c("activityID"))

# Read the Train data assigning appropriate column names
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt"
                          , col.name=c("subjectID"))

xTrain       <- read.table("./UCI HAR Dataset/train/x_train.txt"
                          , col.names=features$featureType)

yTrain       <- read.table("./UCI HAR Dataset/train/y_train.txt"
                          , col.name=c("activityID"))



#### 1. Merges the training and the test sets to create one data set.
# First combine all train data togather
trainData <- cbind(yTrain, subjectTrain, xTrain)

# then combine all test data togather
testData <- cbind(yTest, subjectTest, xTest)

#Now combine both test and train data togather
allData <- rbind(trainData, testData)



#### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
onlyMean_StdData <- allData[,grep("-(mean|std)",features$featureType)]

  
#### 3. Uses descriptive activity names to name the activities in the data set
# Merge with Activity Labels to get activity descriptions
onlyMean_StdData <- merge(activityLabels, onlyMean_StdData, by="activityID")


#### 4. Appropriately labels the data set with descriptive variable names.
# Edit all column names to make it descriptive
featureLabels  <- colnames(onlyMean_StdData); 

#Cleaning up the featureLabels 
featureLabels <- gsub("\\()","",featureLabels)
featureLabels <- gsub("-std$","StdDev",featureLabels)
featureLabels <- gsub("-mean","Mean",featureLabels)
featureLabels <- gsub("^(t)","time",featureLabels)
featureLabels <- gsub("^(f)","freq",featureLabels)
featureLabels <- gsub("([Gg]ravity)","Gravity",featureLabels)
featureLabels <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",featureLabels)
featureLabels <- gsub("[Gg]yro","Gyro",featureLabels)
featureLabels <- gsub("Mag","Magnitude",featureLabels)
featureLabels <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",featureLabels)

# Set the new descriptive column names to the finalData set
colnames(onlyMean_StdData) <- featureLabels;



#### 5. Create tidy data set with the average of each variable for each activity and each subject
finalData <-aggregate(onlyMean_StdData[,names(onlyMean_StdData) != "activityType"]
                      , by=list(onlyMean_StdData$subjectID
                                , onlyMean_StdData$activityID)
                      , FUN=mean)

#Remove unwanter Group column and  Merge with Activity Labels to make activities descriptive 
finalData <- finalData[,!(names(finalData) %in% c("Group.1","Group.2"))]
finalData <- merge(activityLabels, finalData, by="activityID")

#Create a tab delimited file of the tidy data supress row & column names as their details will be given in the code book
write.table(finalData, "./tidyData.txt", row.names=FALSE, col.names=FALSE, sep='\t')

