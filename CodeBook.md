#Getting and Cleaning Data Code Book

##Objectives
The objective of this code book is to describe the raw data, the transformation process in addition to the tidy dataset variables description.

###1- The Raw Data
The raw data consist of several data sets as follows:

* 'features.txt': List of all features (561 rows and 2 variables ).

* 'activity_labels.txt': Links the class labels with their activity name (6 rows and 1 variable ).

* 'train/X_train.txt': Training data set (7352 observations) 561 variables.

* 'test/X_test.txt': Test data set (2947 observations) 561 variables.

* 'train/y_train.txt': Training labels data set (7352 observations) 1 variable.

* 'test/y_test.txt': Test labels data set (2947 observations) 1 variable.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 and (7352 observations) 1 variable.

* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 and (2947 observations)  1 variable.

###2- Transformation Process
The raw data is transformed using the run_analysis.R code in order to produce the Tiday Dataset.
The script run_analysis.R will take the following actions on the raw data sets:
* Merge both x_train (7352 observations) and x_test         (2947 observations) with 561 variables,

* Substitute column names from features dataset (561 rows and 2 variables )

* Merge both y_train (7352 observations) and y_test	 (2947 observations) with 1 variable,

* Substitute data names from activity dataset (6 rows and 2 variables )

* Merge both subject_train (7352 observations) and subject_test	 (2947 observations) with 1 variable,

* Merge the above datasets together,

* Substitute column names from features dataset (561 rows and 2 variables )

* Extracts only the measurements on the mean and standard deviation for each measurement (10299 rows, 81 variables),

* From the data set in previous step, creates a tidy dataset with the average of each variable for each activity and each subject. (6 activities * 30 subjects = 180 rows and 81 columns).

###3- The Tidy Data Set Variables
The tidy data set consist of 81 columns and 180 rows; the following is the description of the data set variables:

* Subject_Id - an identifier of the subject who carried out the experiment and has the values (1 to 30)

* Activity_Name - activity label which can take one of the following values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

* The selected mean and standard deviation variables of the raw data will get the average of each variable (of the 79 variables) for each activity (6 activities) and each subject (60 subjects). This will produce the tidy dataset with 180 rows and 81 columns.
