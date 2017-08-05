# Getting and Cleaning Data Course Project - Codebook

The intial dataset being worked with in this project is UCI's Human Activity Recognition Using Smartphones dataset. This dataset was collected by having 30 volunteers perform six activities (walking, walking upstairs, walking downstairs, siting, standing, laying) while wearing a smartphone. The data has been partioned into a training set and testing set. The full dataset is 10299 observations by 561 variables before tidying.

## Initial Files
This analysis uses 8 files from the intial dataset:

`features.txt`: A list of all features  
`activity_labels.txt`: Links numeric identifier in y_train and y_test with activity label  
`train/X_train.txt`: Training set  
`train/y_train.txt`: Training labels denoting activity  
`subject_train.txt`: Subject indentifiers for training set   
`test/X_test.txt`: Test set  
`test/y_test.txt`: Test labels deonting activity   
`subject_test.txt`: Subject indetifiers for test set  

## Analysis
`run-analysis.R` is the script that:
1. Downloads and unzips the dataset if this has not previously been done
2. Reads in the features and activity labels
3. Reads in the training and test data, and uses regular expressions to extract only variables that contain the mean or standard deviation of the measurements
    * I first create a list called `needed_features` that contains the index positions of only the mean and standard deviation features using grep()
    * Then I subset the incoming training and test sets (called `train_x` and `train_y`) using this list
4. Merges the training and test files
    * Training and test data, labels, and subject identifiers are first merged into `train` and `test` using cbind()
    * Then `train` and `test` are merged into `merged_data` using rbind()
5. Labels the columns and activties appropriately
    * Columns are labeled as "Subject", "Activity" (using activity labels is `activity_labels`), and the appropriate feature names
6. Averages the variables by activity and subject using the aggregate function (produces a dataframe called `averaged_data`)
7. Writes out this new, tidy dataset to the working directory called `Tidy_Averages.txt` 

`Tidy_Averages.txt` is a text file 181 observations by 68 variables, containing the features averaged by subject and activity.



