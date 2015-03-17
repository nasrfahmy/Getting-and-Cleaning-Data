# ########################### Project Requirements ################################
# You should create one R script called run_analysis.R that does the following. 
# 1-  Merges the training and the test sets to create one data set.
# 2-  Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
# 3-  Uses descriptive activity names to name the activities in the data set
# 4-  Appropriately labels the data set with descriptive variable names. 
# 5-  From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.
# ##############################################################################

# ###############################################################################
# Preparation - Loading Data
# ~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1- set the working directory
# 2- read all read all datasets, which include the following:
#       a- read training x dataset        (7352 observations) 561 variables
#          read test     x dataset        (2947 observations) 561 variables
#       b- read training y dataset        (7352 observations)   1 variable
#          read test     y dataset        (2947 observations)   1 variable
#       c- read training subject dataset  (7352 observations)   1 variable 
#          read test     subject dataset  (2947 observations)   1 variable
#       d- read          Features dataset (561 rows and 2 variables )      
#       e- read          activity dataset (6 rows and 1 variable  )      
# #############################################################################

# setting the working directory
setwd("C:/Users/N Fahmy/Desktop/Data Science -Coursera/3 - Getting and Cleaning Data/Project/UCI HAR Dataset/Wor-Dir")

# reading the x training and test data sets
X_train<-read.table("X_train.txt")
X_test<-read.table("X_test.txt")
 
# reading the y training and test data sets 
Y_train<-read.table("y_train.txt")
Y_test<-read.table("y_test.txt")
 
# read subject training and test data sets
Subject_train<-read.table("subject_train.txt")
Subject_test<-read.table("subject_test.txt")

# read Features and activity names (lookups)
Features<-read.table("features.txt")
Activity_labels<-read.table("activity_labels.txt")

# ################################################################################
# 1. Merges the training and the test sets to create one data set.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Choosen to merge each data set type separately, making each data set (train/test)
# start by:
#       a- X training/test datasets, 
#          assigning headers names for x merged data using features dataset
#       b- y training/test datasets,
#       c- subject training/test datasets
# then merge all in one dataset that has 10299 observations, of 563 variables
# ################################################################################
 
# Merge x training and test data
x_total<-rbind(X_train,X_test)
# col-names of x-data to reflect features
names(x_total)=Features[,2]
# merge y training and test data
y_total<-rbind(Y_train,Y_test)
# Merge subject training and test data sets 
subject_total<-rbind(Subject_train,Subject_test)
# name columns of y_total and subject_total
names(y_total)="Activity_Name"
names(subject_total)="Subject_Id"
# merge subject,y-total,x-total
mergedData=cbind(subject_total, y_total, x_total)

# ##############################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each 
#       measurement. 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# grep the column names that has mean or std in it
# get column indeces
# subset them out
# the result set, will maintain that Subject_ID, and Activity_Name for each 
# reading  (total= 10299 rows and 81 columns)
# ##############################################################################
 
# grep the column names that has mean or standard diviation in it (x_total)
mean_or_std_indeces<-grep("mean|std",names(mergedData))
# subset the data including Subject_ID, and Activity_Name for each reading
mergedData<-mergedData[,c(1,2,mean_or_std_indeces)]

###############################################################################
# 3. Uses descriptive activity names to name the activities in the data set
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# mergedData[,2] contains the Activity_ID in the data set
# this is matched with the Activity_Name (V2) in activities[ ,2]
# then assigned to merged_mean_std_data activity column
# then change the label from Activity_ID to Activity_Name
###############################################################################

# activity id to be lookedup from Activity_labels of mergedData to reflect activities
mergedData[,2]<-Activity_labels[mergedData[,2],2]
 
###############################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Already covered in the data preparation step (step # 1)
###############################################################################

names(mergedData)
# write.table(mergedData, file = "mergedData.txt", row.name=FALSE)

###############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# use ddply on mergedData dataset, with columns "Subject_ID" & "Activity_Name"
# the resulted dataset will be 180 rows and 81 columns
###############################################################################
 
library(plyr)
average_data<-ddply(mergedData, c("Subject_Id","Activity_Name"), 
                        numcolwise(mean))
write.table(average_data, file = "average_data.txt", row.name=FALSE)

#######################          End of project     ###########################