library(dplyr)
library(tidyr)
measurements_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                                 colClasses = "numeric")
labels_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                           colClasses = "numeric")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                             colClasses = "numeric")
measurements_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                                colClasses = "numeric")
labels_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                          colClasses = "numeric")
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                            colClasses = "numeric")
measurements <- rbind(measurements_train, measurements_test)
labels <- rbind(labels_train, labels_test)
subjects <- rbind(subjects_train, subjects_test)
features <- read.table("./UCI HAR Dataset/features.txt",
                       colClasses = c("numeric", "character"))[, 2]
names(measurements) <- features
names(labels) <- "label"
names(subjects) <- "subject"
mean_std_vector <- grepl("mean\\()|std\\()", features)
measurements <- measurements[mean_std_vector]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
                              col.names = c("label", "activity"),
                              colClasses = c("numeric", "factor"))
activity <- merge(labels, activity_labels)$activity
mergedData <- cbind(measurements, activity, subjects)
tidyData <- tbl_df(mergedData) %>%
        gather(variable, value, -c(activity, subject)) %>%
        group_by(variable, activity, subject) %>%
        summarize(average_value = mean(value))
write.table(tidyData, "tidy_data.txt", quote = FALSE, row.names = FALSE)
