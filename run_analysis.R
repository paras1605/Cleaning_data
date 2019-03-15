library(data.table)
library(dplyr)

# Loads the labels from the features text file.
labels <- read.table("features.txt", stringsAsFactors = FALSE)
str(labels)
labels <- as.vector(labels[[2]])
str(labels)

# Loads the training datasets
data_train <- read.table("./train/X_train.txt")
dim(data_train)

# Set the column names of the training datasets as labels from features.
colnames(data_train) <- labels
str(data_train[,1:6])

# Loads the subject info
subject <- read.table("./train/subject_train.txt")
subject <- as.vector(subject[[1]])
str(subject)

# Loads the activity info 
activity <- read.table("./train/y_train.txt")
activity <- factor(activity[[1]])
str(activity)

# Add subject and activity info as columns to the training dataset
data_train <- cbind(subject, activity, data_train)
str(data_train[,1:6])

# repeat the same for test dataset
data_test <- read.table("./test/X_test.txt")
colnames(data_test) <- labels

subject <- read.table("./test/subject_test.txt")
subject <- as.vector(subject[[1]])

activity <- read.table("./test/y_test.txt")
activity <- factor(activity[[1]])

data_test <- cbind(subject, activity, data_test)
str(data_test[,1:6])
dim(data_test)

# Combine the training dataset and test dataset into one table
data_final <- rbind(data_train, data_test)
str(data_final[,1:6])
dim(data_final)

# Columns having mean and standard deviation in them are taken out 
data_stats <- data_final[, c(1, 2, grep("mean\\(\\)|std\\(\\)", names(data_final)))]
dim(data_stats)

# Activity numbers are replaced by the names of activity labels
name_activity <- read.table("activity_labels.txt")
name_activity <- tolower(as.vector(name_activity[[2]]))
levels(data_stats) <- name_activity
levels(data_stats)

str(data_stats[,1:6])
# we will remove parenthesis and replace - by _
cnames <- gsub("()", "", names(data_stats), fixed = TRUE)
cnames <- gsub("-", "_", cnames)
names(data_stats) <- cnames
str(data_stats[,1:6])

# Average of every coulmn for every subject and activity is evaluated 
mean_data <- group_by(data_stats, subject, activity) %>% summarize_all(funs(mean))
mean_data[1:10, 1:6]

# tidy data is created in text file from above data
write.table(mean_data, "mean_data.txt", row.names = FALSE)
