## Read in the data & reshape2

library(reshape2)

activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

s.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

s.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

## Combine data

train.data <- cbind(y.train, s.train, x.train)
test.data <- cbind(y.test, s.test, x.test)
dat <- rbind(train.data, test.data)

## Find desired features

feat.mean <- grep("mean", features[,2])
feat.std <- grep("std", features[,2])
feat.selec <- sort(c(feat.mean, feat.std)) + 2

## Keep only desired features

dat.feat <- dat[,c(1,2,feat.selec)]

## Add descriptive activity names

act.vec <- merge(dat.feat, activity, by.x="V1", by.y="V1")
dat.name <- cbind(dat.feat[,2], act.vec, dat.feat[,3:ncol(dat.feat)])

## Add descriptive variable names

feat.names <- as.character(features[feat.selec-2,2])
feat.names <- gsub("[()]","", feat.names) 

colnames(dat.name) <- c("subject", "activity", feat.names)

## Average each variable for each activity and each subject

dat.name$subject <- as.factor(dat.name$subject)
dat.name$activity <- as.factor(dat.name$activity)
dat.melt <- melt(dat.name, id = c("subject", "activity"))
tidy.data <- dcast(dat.melt, subject + activity ~ variable, mean)

write.table(tidy.data, file = "tidy.txt", row.name = FALSE)








