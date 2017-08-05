# Getting and Cleaning Data - Course Project
This repo contains the R script and documentation for the final project of "Getting and Cleaning Data", a course in JHU's Data Science Specialization on Coursera. 

The dataset being used in this project is UCI's Human Activity Recognition Using Smartphones dataset. 

## Scripts and Documentation
`run-analysis.R` is the script that:
1. Downloads and unzips the dataset if this has not previously been done
2. Reads in the features and activity labels
3. Reads in the training and test data, and uses regular expressions to extract only variables that contain the mean or standard deviation of the measurements
4. Merges the training and test files
5. Labels the columns and activties appropriately
6. Averages the variables by activity and subject
7. Writes out this new, tidy dataset to the working directory

`Codebook.md` describes the variables, data, and workflow used to clean up the data. 
