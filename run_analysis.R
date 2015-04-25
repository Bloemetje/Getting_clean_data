# load library
library(plyr)
library(dplyr)

# set working directory
setwd("~/Documents/coursera/UCI HAR Dataset")

#read txt files in the test folder
# file subject_test.txt
subject_test <- read.table("./test/subject_test.txt")
# file X_test.txt
X_test <- read.table("./test/X_test.txt")
# file y_test.txt
y_test <- read.table("./test/y_test.txt")

#read txt files in the train folder
# file subject_train.txt
subject_train <- read.table("./train/subject_train.txt")
# file X_train.txt
X_train <- read.table("./train/X_train.txt")
# file y_train.txt
y_train <- read.table("./train/y_train.txt")

#read features and rename
features <- read.table("./features.txt")
features[,2] <- gsub("-mean", "_Mean", features[,2])
features[,2] <- gsub("-std", "_Std", features[,2])
features[,2] <- gsub('[-()]', '', features[,2])

#merge all test data (subject_test, y_test, X_test)
testdata <- cbind(X_test, subject_test, y_test)

#merge all train data (subject_train, y_train, X_train)
traindata <- cbind(X_train,subject_train, y_train)

# merge test data with train data
data <- rbind(testdata, traindata)

#select the mean and stdev columns
columns <- grep(".*Mean.*|.*Std.*", features[,2])
columnN <- c(columns, 562,563)
features <- features[columns,]
features <- c(features[,2],"subject","activity")
data <- data[,columnN]

#label the columns
colnames(data) <- features

write.table(data, "data.txt")

## Second independent tidy data set with the 
## average of each variable for each activity and each subject

data_2 <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(data_2, "data_2.txt", row.name=FALSE)
