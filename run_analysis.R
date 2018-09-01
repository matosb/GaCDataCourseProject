# 1. Merges the training and the test sets to create one data set.
# Loading training data
X_train <- read.table("../UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("../UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("../UCI HAR Dataset/train/subject_train.txt")

# Loading testing data
X_test <- read.table("../UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("../UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("../UCI HAR Dataset/test/subject_test.txt")

# Merging training and testing
data <- rbind(X_train, X_test)
activity <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Loading dplyr library for manipulating dataframe 
library(dplyr)
# Reading features.txt 
features <- read.table("../UCI HAR Dataset/features.txt")
featuresFiltered <- filter(features, grepl("mean|std", V2))
dataselected <- subset(data, select=featuresFiltered$V1)

# 3. Appropriately labels the data set with descriptive variable names 
# and uses descriptive activity names to name the activities in the data set
names(dataselected) <- featuresFiltered$V2
# Adding activity and subject to the dataset
dataselected$activity <- activity$V1
dataselected$subject <- subject$V1
# Use descriptive activity names
dataselected$activity[dataselected$activity == 1] <- "WALKING"
dataselected$activity[dataselected$activity == 2] <- "WALKING_UPSTAIRS"
dataselected$activity[dataselected$activity == 3] <- "WALKING_DOWNSTAIRS"
dataselected$activity[dataselected$activity == 4] <- "SITTING"
dataselected$activity[dataselected$activity == 5] <- "STANDING"
dataselected$activity[dataselected$activity == 6] <- "LAYING"

# 4. From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataselected$key <- paste(dataselected$activity, dataselected$subject)
library(data.table)
dt <- data.table(dataselected)
colstoavg <- names(dt)[1:79]
dt.mean <- dt[,lapply(.SD,mean,na.rm=TRUE),by=key,.SDcols=colstoavg]