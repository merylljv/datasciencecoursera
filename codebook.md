# Requirements to run the run_analysis.R:

* download [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  * saved in the same directory as run_analysis.R with folder name "UCI HAR Dataset"
* install the following package(s):
  * dplyr

# The following data set _with file path from "UCI HAR Dataset" folder_ were used:

* __/UCI HAR Dataset/activity_labels.txt__ - descriptive activity names
* __/UCI HAR Dataset/features.txt__ - header of the data set
* __/UCI HAR Dataset/test/X_test.txt__ - test data set
* __/UCI HAR Dataset/test/y_test.txt__ - activity of test data set
* __/UCI HAR Dataset/test/subject_test.txt__ - subject of test data set
* __/UCI HAR Dataset/train/X_train.txt__ - train data set
* __/UCI HAR Dataset/train/y_train.txt__ - activity of train data set
* __/UCI HAR Dataset/train/subject_train.txt__ - subject of train data set

# The run_analysis.R script does the following:

* sets the working directory to the directory of source code
* reads train data set named __train__
  * reads subject _test_subj_ and merges it to data set __train__
  * reads activity _test_activity_ and merges it to data set __train__
* reads train data set named __test__
  * reads subject _test_subj_ and merges it to data set __test__
  * reads activity _test_activity_ and merges it to data set __test__
* merges _train_ and _test_ data set to create one data set __uci_har__
* extracts only the measurements on the mean and standard deviation for each measurement: __std_mean__
* uses descriptive activity names _activity_ to name the activities in the data set __std_mean_activity__
* creates tidy data set with the average of each variable for each activity and each subject: __ave_subj_act__
