library(data.table)
if (!file.exists("UCI HAR Dataset")) {
	stop("
	Couldn't find the data! 
	Please make sure that the unzipped folder \"UCI HAR Dataset\" exists in the working directory,
	and that the original folder hierachy is preserved")
}
#print("Loading Files...", quote=FALSE)
#print("Loading X_test...", quote=FALSE)
xTestFile <- read.table(file.path('UCI HAR Dataset/test', 'X_test.txt'))
#print("Loading y_test...", quote=FALSE)
yTestFile <- read.table(file.path('UCI HAR Dataset/test','y_test.txt'))
#print("Loading X_train...", quote=FALSE)
xTrainFile <- read.table(file.path('UCI HAR Dataset/train', 'X_train.txt'))
#print("Loading y_train...", quote=FALSE)
yTrainFile <- read.table(file.path('UCI HAR Dataset/train', 'y_train.txt'))
#print("1. Merges the training and the test sets to create one data set.", quote=FALSE)
xTrain <- data.table(xTrainFile)
yTrain <- data.table(yTrainFile)
xTest <- data.table(xTestFile)
yTest <- data.table(yTestFile)
featureNames <- read.table(file.path('UCI HAR Dataset', 'features.txt'))
dim(featureNames)
setnames(yTest, names(yTest), "activity")
setnames(xTest, names(xTest), as.character(featureNames[,2]))
setnames(yTrain, names(yTrain), "activity")
setnames(xTrain, names(xTrain), as.character(featureNames[,2]))
dim(xTrain)
dim(xTest)
dim(yTrain)
dim(yTest)

# Extracts only the measurements on the mean and standard deviation for each measurement.
#print("2. Extracts only the measurements on the mean and standard deviation for each measurement.", quote=FALSE) 
featuresMeanStdVect <- grep("mean\\(\\)|std\\(\\)", featureNames$V2)
xTest <- xTest[, featuresMeanStdVect, with=FALSE]
dim(xTest)
xTrain <- xTrain[, featuresMeanStdVect, with=FALSE]
dim(xTrain)
subjectTest <- read.table(file.path('UCI HAR Dataset/test', 'subject_test.txt'))
dim(subjectTest)
subjectTrain <- read.table(file.path('UCI HAR Dataset/train', 'subject_train.txt'))
dim(subjectTrain)
names(subjectTrain) <- "subject"
names(subjectTest) <- "subject"
xTest <- cbind(xTest, subjectTest)
xTest <- cbind(xTest, yTest)
xTrain <- cbind(xTrain, subjectTrain)
xTrain <- cbind(xTrain, yTrain)
dim(xTest)
dim(xTrain)

# Merges the training and the test sets to create one data set.
mergedData <- rbind(xTest, xTrain)
dim(mergedData)

# Uses descriptive activity names to name the activities in the data set.
#print("3. Uses descriptive activity names to name the activities in the data set.", quote=FALSE)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- (c("activity", "activityName"))
activityLabels$activityName <- tolower(activityLabels$activityName)
activityLabels$activityName <- sub("_up", "Up", activityLabels$activityName)
activityLabels$activityName <- sub("_down", "Down", activityLabels$activityName)
dim(activityLabels)
mergedData <- merge(mergedData, activityLabels, by = "activity",  all=TRUE)
mergedData <- mergedData[, activity:=NULL]
dim(mergedData)

# Appropriately labels the data set with descriptive feature names.
#print("4. Appropriately labels the data set with descriptive feature names.", quote=FALSE) 
setnames(mergedData, names(mergedData), gsub("fBody", "freqBody", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("tBody", "timeBody", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("tGrav", "timeGrav", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("\\-std\\(\\)-", "Std", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("\\-mean\\(\\)-", "Mean", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("\\-std\\(\\)", "Std", names(mergedData)))
setnames(mergedData, names(mergedData), gsub("\\-mean\\(\\)", "Mean", names(mergedData)))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Adding two columns: One for the subsject, and one fot the activity labels (rename before adding columns)
#print("5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.", quote=FALSE) 
tidyData <- mergedData[, sapply(.SD, function(x) list(Mean=mean(x))), by=c("subject","activityName")]
tidyData <- tidyData[order(subject),]
dim(tidyData)
#print("Exporting tidy data in file: \"tidyData.txt\"", quote=FALSE)
write.table(tidyData, file="tidyData.txt",  sep="\t", row.names=FALSE, quote=FALSE)
#print("Done!", quote=FALSE)