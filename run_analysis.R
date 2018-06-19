library(dplyr)

xtest = read.table("./Data/UCI HAR Dataset/test/X_test.txt")
ytest = read.table("./Data/UCI HAR Dataset/test/y_test.txt")
ytrain = read.table("./Data/UCI HAR Dataset/train/y_train.txt")
xtrain = read.table("./Data/UCI HAR Dataset/train/X_train.txt")

subjectTest = read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
subjectTrain = read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
columnNames = read.table("./Data/UCI HAR Dataset/features.txt")
activityNames = read.table("./Data/UCI HAR Dataset/activity_labels.txt")

#merge the data sets
merge = rbind(xtrain,xtest)
mergeY = rbind(ytrain,ytest)
mergeSubjects = rbind(subjectTrain,subjectTest)
merge["activity"]<-NA
merge["activity"]<- mergeY
merge["subject"]<-NA
merge["subject"]<- mergeSubjects

# label the data set with descriptive variable names
variableNames <- as.character(columnNames$V2)
variableNames <- c(variableNames, "activity", "subject")
names(merge) <- variableNames

# remove duplicate columns
mergedData <- merge[,!duplicated(colnames(merge))]

# extract means and stdevs column names
means = grep("mean",colnames(mergedData))
stds = grep("std",colnames(mergedData))
meansAndStds <- c(means, stds)

#select the desired columns from the main data set
desiredColumns <- select(mergedData, activity, subject, meansAndStds)

#update the activity names to more descriptive ones
updatedActivities = recode(desiredColumns$activity, `1`="WALKING", `2`="WALKING_UPSTAIRS", `3`="WALKING_DOWNSTAIRS",`4`="SITTING", `5`="STANDING", `6`="LAYING")
desiredColumns$activity <- updatedActivities

#create new data set
meansBySubjectAndActivity = desiredColumns %>% group_by(subject, activity) %>% summarise_all(funs(mean))

#and change the names vector to make it tidy
vNames = names(desiredColumns[3:81])
meanVNames <- paste("mean of", vNames, sep=" ")
names(meansBySubjectAndActivity) <- c("subject", "activity", meanVNames)

write.table(meansBySubjectAndActivity, file="output.txt", row.name=FALSE)
