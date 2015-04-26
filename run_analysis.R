# Getting and Cleaning Data - Course Project
# run_analysis.R
#
# Merges training and test data,
# assigns descriptive feature names,
# labels activities,
# and creates a new data set based on averages of means and standard deviations.
#
# Written by Nicholas Wong, April 2015

rm(list=ls())

library(dplyr)

## Merge data:

# Read all data into respective tables
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Extract feature names
features <- read.table("./UCI HAR Dataset/features.txt")
features <- select(features,V2)     # Remove first column of indices
features <- t(features)             # Transpose into a row table

# Rename column names in data tables
# X-data column names come from "features" table
# y-data single column named "activity"
# subject-data single column named "subject"
names(X_train) <- features
names(X_test) <- features
names(y_train) <- "activity"
names(y_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"

# Combine training and test data tables:
# Append subject-data and y-data columns after X-data
trainData <- cbind(X_train,subject_train,y_train)
testData <- cbind(X_test,subject_test,y_test)

# Merge training and test data:
# Append test data rows after training data
data <- rbind(trainData,testData)


## Obtain mean and std columns:

# Select only columns whose names contain "mean()", "std()", "subject",
# "activity"
colIdx_mean <- grep("mean\\(\\)",names(data))   # Column indices containing "mean()"
colIdx_std <- grep("std\\(\\)",names(data))     # Column indices containing "std()"
colIdx_subject <- grep("subject",names(data))   # Column index containing "subject"
colIdx_activity <- grep("activity",names(data)) # Column index containing "activity"
colIdx <- sort(c(colIdx_mean,                   # Combine all indices and sort
                 colIdx_std,                    # to preserve original ordering
                 colIdx_subject,
                 colIdx_activity))
dataFiltered <- data[,colIdx]                   # Subset wanted columns out of
                                                # original data


## Map activity labels to y-data:

# Create an "activities" table with the activity labels.
# Use y-data to index "activities" table and replace each "activity" row in
# "dataFiltered" table with the corresponding activity label
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
dataFiltered$activity <- activities[dataFiltered$activity,2]


## Create a new data set:

# Compute means of columns grouped by "subject" and "activity"
runAve <- aggregate(dataFiltered[,1:(ncol(dataFiltered)-2)],
                    list(activity=dataFiltered$activity,subject=dataFiltered$subject),
                    mean)

# Reorder columns such that "subject" is first column and "activity" is second
# column
runAve <- runAve[,c(2,1,3:ncol(runAve))]

# Write the tidy table to an output file
write.table(runAve,file="runAve.txt",row.names=FALSE)