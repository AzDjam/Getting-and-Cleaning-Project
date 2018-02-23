
#                 Code book getting and cleaning data course Project

CodeBook.md describes the variables, the data, and  transformations or work that was performed to clean up the data.


The purpose of the project is to collect, work and clean a data set.
the data is Human Activity Recognition database built from the recordings of 30 subjects 
performing six  activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone with embedded inertial sensors.

the data set is  from: 
  [Link]   (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

run_analysis.R contains all the code to perform the folowing tasks

 - download and unzip data set 
 - read training data:x_train.txt,Y_train.txt and subject_train.txt and store it in the tables     **XTrain**,**yTrain**,**subjectTrain**
 - read testing data:X_test.txt,y_test.txt and subject_test.txt and store it in **xTest**,**yTest** and **SubjectTest**
 - Read features.txt and activity_labels.txt and store it in **features** and **activityLabels**
 - Assign colums names for **XTrain**,**Xtrain** from **features[,2]**
 - Assign **activityId **as cloumn name for **Ytrain**, **yTESt** 
 _ Merge the train and the test tables in the table **mrgTrainAndTest**
 -Determine columns of data set to keep based on column name
 - Create subset **MeanAndStdTable** from the merging set **mrgTrainAndTest** with just the   columns to keep
 - Merge the subset **MeanAndStdTable** with **activityLabels** by **activityId**
 -Create a tidy data set  ** tidyTable** with the average of each variable for each activity 
  and each subject 
 - Store tidy data in **tidy.text**


the resulting variables  in tidy.txt are


- subjectId -  identifie the subject ( integer ranges from 1 to 30)
- activity - The type of activity performed ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,LAYING)    

and the 79  measurements floating-point values, normalised and bounded within [-1,1] are : 
              
- tBodyAccmeanX                
- tBodyAccmeanY                
- tBodyAccmeanZ 

- tBodyAccstdX                 
- tBodyAccstdY                 
- tBodyAccstdZ  

- tGravityAccmeanX            
- tGravityAccmeanY              
- tGravityAccmeanZ 

- tGravityAccstdX              
 - tGravityAccstdY               
 - tGravityAccstdZ 
 
 - tBodyAccJerkmeanX            
- tBodyAccJerkmeanY            
- tBodyAccJerkmeanZ            

- tBodyAccJerkstdX-
 - tBodyAccJerkstdY              
 - tBodyAccJerkstdZ              

 - tBodyGyromeanX               
 - tBodyGyromeanY               
 - tBodyGyromeanZ                

 - tBodyGyrostdX                
- tBodyGyrostdY                 
- tBodyGyrostdZ                 

- tBodyGyroJerkmeanX           
- tBodyGyroJerkmeanY            
- tBodyGyroJerkmeanZ           

- tBodyGyroJerkstdX            
 - tBodyGyroJerkstdY            
- tBodyGyroJerkstdZ            

- tBodyAccMagmean             
 - tBodyAccMagstd               

 - tGravityAccMagmean            
 - tGravityAccMagstd            

- tBodyAccJerkMagmean          
- tBodyAccJerkMagstd          

- tBodyGyroMagmean             
- tBodyGyroMagstd             

- tBodyGyroJerkMagmean          
- tBodyGyroJerkMagstd          

- fBodyAccmeanX              
- fBodyAccmeanY                
- fBodyAccmeanZ               

 - fBodyAccstdX               
 - fBodyAccstdY                  
 - fBodyAccstdZ                

- fBodyAccmeanFreqX             
- fBodyAccmeanFreqY            
- fBodyAccmeanFreqZ           

 - fBodyAccJerkmeanX            
 - fBodyAccJerkmeanY            
 - fBodyAccJerkmeanZ           
 
 - fBodyAccJerkstdX             
 - fBodyAccJerkstdY             
 - fBodyAccJerkstdZ             

- fBodyAccJerkmeanFreqX        
- fBodyAccJerkmeanFreqY        

- fBodyGyromeanX              
- fBodyGyromeanY              
- fBodyGyromeanZ              
 
 - fBodyGyrostdX                
 - fBodyGyrostdY               
 - fBodyGyrostdZ                
 
 - fBodyGyromeanFreqX            
 - fBodyGyromeanFreqY          
 - fBodyGyromeanFreqZ           

- fBodyAccMagmean              
- fBodyAccMagstd               
- fBodyAccMagmeanFreq          

- fBodyBodyAccJerkMagmean       
- fBodyBodyAccJerkMagstd        
- fBodyBodyAccJerkMagmeanFreq 
 
 - fBodyBodyGyroMagmean          
 - fBodyBodyGyroMagstd          
 - fBodyBodyGyroMagmeanFreq     

- fBodyBodyGyroJerkMagmean      
- fBodyBodyGyroJerkMagstd       
- fBodyBodyGyroJerkMagmeanFreq 
  




