## Getting and Cleaning Data - peer assessment project


## The tasks for cleaning the given dataset:

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## About R script
File with R code "run_analysis.R" has code for all the required tasks to be performed

##steps done in run_analysis.R is:
    1.Download UCI HAR Dataset and store the file
    2.Load  the library dplyr
    3.Unzip the downloaded file
    4.Load activity labels
    5.Load and select features that include mean or standard deviation 
    6.Load training data Extract only the measurements on the mean and standard deviation for each measurement Appropriately label the data set with descriptive variable names
    7.Load testing data
    8.Extract only the measurements on the mean and standard deviation for each measurement Appropriately label the data set with descriptive variable names
    9.Merge the training and the test sets to create one tidy data set
    10.create a independent tidy data set with the average of each variable for each activity
    11.Take averages for each activity
    12.Take averages for each subject
    13.merge the two data set and view each dataset