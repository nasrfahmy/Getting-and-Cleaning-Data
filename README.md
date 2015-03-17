# Getting and Cleaning Data

## Project:
Human Activity Recognition Using Smart Phones Dataset

## Objectives
The objectives of this project is to demonstrate our ability to process raw data, using R script, to create a tidy data set that will be used later on in data analysis.

## Components of the Tidy Dataset

### 1- Raw Data
* 'features.txt': List of all features
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'test/X_test.txt': Test set.
* 'train/y_train.txt': Training labels.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


### 2- Tidy Dataset
The tidy dataset is the result of merging the datasets in the Raw Data section according to the following steps:

* Merge both x_train (7352 observations) and x_test	 (2947 observations) with 561 variables,

* Substitute column names from features dataset (561 rows and 2 variables )

* Merge both y_train (7352 observations) and y_test	 (2947 observations) with 1 variable,

* Substitute data names from activity dataset (6 rows and 2 variables )

* Merge both subject_train (7352 observations) and subject_test	 (2947 observations) with 1 variable,

* Merge the above datasets together,

* Substitute column names from features dataset (561 rows and 2 variables )

* Extracts only the measurements on the mean and standard deviation for each measurement (10299 rows, 81 variables),

* From the data set in step (h), creates a tidy dataset with the average of each variable for each activity and each subject. (6 activities * 30 subjects = 180 rows and 81 columns).

### 3- The Code Book

The code book contains information about each variable of the tidy dataset.

### 4- The instruction list (run_analysis.R)

The recipe used to move from steps 1 to 3, which is the script written to move from the raw data to the tidy dataset. This script was written in R language and is called run_analysis.R.

## Repository Contents

The Github repository will contain the following:

* CodeBook.md: contains information about variables on tidy dataset

* Readme.md: this file

* Run_analysis.R: R script used to construct the tidy dataset.
