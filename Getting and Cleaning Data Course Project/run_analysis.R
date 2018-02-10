# source code working directory
setwd(dirname(sys.frame(1)$ofile))
setwd('./UCI HAR Dataset')

# data set header and descriptive activity names
header <- read.table('features.txt')
activity <- read.table('activity_labels.txt')

# train data set
train <- read.table('./train/X_train.txt', col.names = header$V2)
train_subj <- read.table('./train/subject_train.txt', col.names = c('volunteer'))
train_activity <- read.table('./train/y_train.txt', col.names = c('activity'))
train <- cbind(train_subj, train_activity, train)

# test data set
test <- read.table('./test/X_test.txt', col.names = header$V2)
test_subj <- read.table('./test/subject_test.txt', col.names = c('volunteer'))
test_activity <- read.table('./test/y_test.txt', col.names = c('activity'))
test <- cbind(test_subj, test_activity, test)

# Merges the training and the test sets to create one data set
uci_har <- rbind(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement
std_mean <- uci_har[, colnames(uci_har)[grep('mean|std|activity|volunteer', colnames(uci_har))]]

# Uses descriptive activity names to name the activities in the data set
std_mean_activity <- merge(std_mean, activity, by.x = 'activity', by.y = 'V1', all = TRUE)
#std_mean_activity <- std_mean_activity[, !(colnames(std_mean_activity) %in% c("activity"))]
#names(std_mean_activity)[names(std_mean_activity) == 'V2'] <- 'activity'

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
ave_subj_act <- std_mean_activity %>% group_by(volunteer,activity) %>% summarise_each(funs(mean))
ave_subj_act <- data.frame(ave_subj_act)
write.table(ave_subj_act,"ave_subj_act.txt",row.name=FALSE)
