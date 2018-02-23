######################################################################################
# 
# Getting and cleaning Data Course project
#
# The purpose of the project is to collect  work and clean a data set

# the data is Human Activity Recognition database built from the recordings of 30 subjects 
# performing six activities while carring a smartphone .the data is ollected from 
# the accelerometers of the Samsung Galaxy S smartphone.

# The goal of run_analysis.R is to read the data set, merge the traing and the test set,
# Extracts just  the mean and standard deviation

# creates tidy.text  with the average of each variable for each activity and each subject

#################################################################################




# Download and unzip the dataset if it does not already exist in the working directory
 dirData="./data"
 
 if(!file.exists(dirData)){dir.create(dirData)}
 zipFile=file.path(dirData,"data.zip")
 if (!file.exists(zipFile)){
 url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 download.file(url,zipFile,method="curl")
 }
 if (!file.exists("UCI HAR Dataset")) { 
   unzip(zipFile) 
 }
 
 

 
 
#1 Merges the training and the test sets to create one data set.
  
# Read training tables: x_train.txt,Y_train.txt and subject_train.txt 
 pathDirTrain=file.path(dirData,"UCI HAR Dataset/train")
 
 subjectTrain <- read.table(file.path(pathDirTrain,"subject_train.txt"))
 xTrain <- read.table(file.path(pathDirTrain,"X_train.txt"))
 yTrain <- read.table(file.path(pathDirTrain,"y_train.txt"))


# Read testing tables:X_test.txt,y_test.txt and subject_test.txt
 pathDirTest=file.path(dirData,"UCI HAR Dataset/test")
 
 SubjectTest <- read.table(file.path(pathDirTest,"subject_test.txt"))
 xTest <- read.table(file.path(pathDirTest,"X_test.txt"))
 yTest <- read.table(file.path(pathDirTest,"/y_test.txt"))


# Read features.txt:
 features <- read.table(file.path(dirData,"UCI HAR Dataset/features.txt"))

# Read activity_labels.text
 activityLabels = read.table(file.path(dirData,"UCI HAR Dataset/activity_labels.txt"))

# Assigning column names:
 colnames(xTrain) <- features[,2]
 colnames(yTrain) <-"activityId"
 colnames(subjectTrain) <- "subjectId"
 colnames(xTest) <- features[,2]
 colnames(yTest) <- "activityId"
 colnames(SubjectTest) <- "subjectId"
 colnames(activityLabels) <- c('activityId','activity')


# Merging all data in one set:
 mrgTrain <- cbind(subjectTrain,xTrain,yTrain )
 mrgTest <- cbind(SubjectTest,xTest,yTest )
 mrgTrainAndTest<- rbind(mrgTrain, mrgTest )


 
#2  Extracting only the measurements on the mean and standard deviation for each measurement
 

# Create vector for defining ID, mean and standard deviation:
 
 columnsToKeep <- grepl("subjectId|activityId|mean|std", colnames( mrgTrainAndTest))
 
# 3- Making nessesary subset from mrgTrainAndTest:
 MeanAndStdTable <- mrgTrainAndTest[ ,columnsToKeep == TRUE]

 colnames( MeanAndStdTable)<-gsub('[-()]', "",colnames( MeanAndStdTable))
 # 4-Using descriptive activity names to name the activities in the data set:

 MeanAndStActivityName <- merge(MeanAndStdTable, activityLabels,
                              by='activityId',
                              all.x=TRUE)
 MeanAndStActivityName<-subset(MeanAndStActivityName, select = -c(activityId))

# 4- Creating a second tidy data set with the average of each variable
# for each activity and each subject:

#  Making second tidy data set
tidyTable <- aggregate(. ~subjectId + activity, MeanAndStActivityName, mean)
tidyTable <- tidyTable[order(tidyTable$subjectId, tidyTable$activity),]



# Writing second tidy data
 write.table(tidyTable, "tidy.txt", row.name=FALSE)




