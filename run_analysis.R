# 1. Merges the training and the test sets to create one data set.

# Loading X_train.txt and X_test.txt
training <- read.table("../UCI HAR Dataset/train/X_train.txt")
testing <- read.table("../UCI HAR Dataset/test/X_test.txt")

# Merging training and testing
data <- rbind(training, testing)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Loading dplyr library for manipulating dataframe 
library(dplyr)
# Reading features.txt 
features <- read.table("../UCI HAR Dataset/features.txt")
featuresFiltered <- filter(features, grepl("mean|std", V2))
dataselected <- subset(data, select=featuresFiltered$V1)

# 3. Uses descriptive activity names to name the activities in the data set


# 4. Appropriately labels the data set with descriptive variable names.


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.