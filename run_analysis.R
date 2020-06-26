##Download UCI HAR Dataset and store file locally
myfile <- "dataset.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, myfile)

##Load dplyr and tidyr
library(dplyr)
library(tidyr)

##Unzip locally stored zip file
unzipfile <- unzip(myfile)

# 1.1 Reading files

#train data
mytrain_x <- read.table("UCI HAR Dataset/train/X_train.txt")
mytrain_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

#test data
mytest_x <- read.table("UCI HAR Dataset/test/X_test.txt")
mytest_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#feature vector:
features <- read.table('UCI HAR Dataset/features.txt')

#activity labels:
activityLabels = read.table('UCI HAR Dataset/activity_labels.txt')

##Assign column names:

colnames(mytrain_x) <- features[,2]
colnames(mytrain_y) <-"activityId"
colnames(train_subject) <- "subjectId"

colnames(mytest_x) <- features[,2] 
colnames(mytest_y) <- "activityId"
colnames(test_subject) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

##Merging all data in one set:

mrg_train <- cbind(mytrain_y,train_subject,mytrain_x)
mrg_test <- cbind(mytest_y,test_subject,mytest_x)
inonedataset <- rbind(mrg_train, mrg_test)
##dim(inonedataset)
##head(inonedataset,6)
##tail(inonedataset,9)


#=================================================================
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
#=================================================================

##Reading column names:

colNames <- colnames(inonedataset)

#Create vector for defining ID, mean and standard deviation:

meanstd <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# Make nessesary subset from inonedataset:

subsetmeanstd <- inonedataset[ , meanstd == TRUE]

#=================================================================
# 3. Uses descriptive activity names to name the activities in the data set
#=================================================================

setActivityNames <- merge(subsetmeanstd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#=================================================================
#4. Appropriately labels the data set with descriptive variable names.
#=================================================================

#done in step 2 and step 3

#=================================================================
#5.creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#=================================================================

#Making a second tidy data set

TidySet <- aggregate(. ~subjectId + activityId, setActivityNames, mean)
TidySet <- secTidySet[order(TidySet$subjectId, TidySet$activityId),]

# Writing second tidy data set in txt file

write.table(TidySet, "TidySet.txt", row.name=FALSE)

#======================================================================================


