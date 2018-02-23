```
 title:Getting and cleaning data course Project

 author:"Djamila Azib"

 date:"21-2-2018"
```

The purpose of the project is to collect, work and clean a data set.
the data is Human Activity Recognition database built from the recordings of 30 subjects 
performing six  activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  while wearing a smartphone with embedded inertial sensors.

The R script, run_analysis.R, does the following:
  
#### 1- Merges the training and the test sets to create one data set




  - Download the data  from: 
  [Link]   (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  - Unzip the dataset if it does not already exist in the working directory "./data"
  - Read  training tables,testing tables, features and activityLabels
  - Assign colunm names for XTrain,Xtrain from features[,2],
  - Assign activityId as cloumn name for Ytrain, yTESt 
  _ Merge the train and the test tables (mrgTrainAndTest)


#### 2- Extracting only the measurements on the mean and standard deviation for each measurement
  - Create columnsToKeep,vector for defining ID, mean and standard deviation 

#### 3- Making  subset from mrgTrainAndTest with just the columns to keep 
  - Create subset( MeanAndStdTable) from the merging set( mrgTrainAndTest) with just the columns to keep
 
#### 4- Uses descriptive activity names to name the activities in the data set
  - Merge the subset( MeanAndStdTable) with activityLabels by activityId'
  _ Get rid of  the column activityId
  
#### 5- Making second tidy data set
 - Create a tidy data set with with the average of each variable for each activity 
and each subject
 - Writing tidy data in tidy.text

