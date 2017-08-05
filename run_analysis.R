##Downloading and Unzipping dataset after check if it already exists in working directory

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "getdata_projectfiles.zip"

if(!file.exists(filename)){
  download.file(url, filename, method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
unzip(filename)
}

##Reading in and merging train and test sets for mean and std variables

#Reading in features and activties
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Grabbing only features that record means or standard deviations
needed_features <- grep("mean\\(\\)|std\\(\\)", features[,2])

#Reading in train files with only values for mean and std
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")[needed_features]
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Merging training files
train <- cbind(trainsubject, train_y, train_x)

#Reading in test files with only values for mean and std
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")[needed_features]
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Merging test files
test <- cbind(testsubject, test_y, test_x)

#Merging train and test files
merged_data <- rbind(train, test)

##Giving columns appropriate variable names

#Rename columns 
colnames(merged_data) <- c("Subject", "Activity", features[needed_features, 2])

#Label activity column appropriately
merged_data$Activity <- activity_labels[,2][match(merged_data$Activity, activity_labels[,1])]

##Producing a tidy dataset of the average of each measurement by subject and activity

#Averaging variables by subject and activity
averaged_data <- aggregate(. ~Subject + Activity, merged_data, mean)

#Writing out tidied dataset
write.table(averaged_data, "Tidy_Averages.txt", row.name = FALSE)
