
## read the untidy test data
cat("Reading the test data...\n")
subjectID_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activityLabel_test <- read.table("UCI HAR Dataset/test/y_test.txt")
dataSet_test <- read.table("UCI HAR Dataset/test/X_test.txt")

## read the untidy train data
cat("Reading the train data...\n")
subjectID_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activityLabel_train <- read.table("UCI HAR Dataset/train/y_train.txt")
dataSet_train <- read.table("UCI HAR Dataset/train/X_train.txt")
cat()

## bind columns of test data and train data, seperately, into one table
cat("Binding columns of test data and train data...\n")
testData <- cbind(subjectID_test,activityLabel_test,dataSet_test)
trainData <- cbind(subjectID_train,activityLabel_train,dataSet_train)

## bind rows of test data and the train data into one table
cat("Binding rows for test and train data into one table...\n")
mergedData <- rbind(testData,trainData)
colnames(mergedData) <- c("Subject_ID","Activity_Label")

## calculating mean and SD for the merged data
cat("Calculating mean and SD for the merged data...\n")
Mean <- rowMeans(mergedData[c(-1,-2)])
SD <- apply(mergedData[c(-1,-2)],1,sd)

## subsetting the merged data and adding mean and SD
cat("Subsetting required values into a separate table...\n")
untidyData <- cbind(mergedData[,1:2],Mean,SD)

## install plyr package if not already installed, then import plyr package
cat("Installing the plyr package, if necessary...\n")
if("plyr" %in% rownames(installed.packages()) == FALSE) {install.packages("plyr")}
library(plyr)

## arrange the data and add descriptive text to activity label
cat("Arranging the extracted data...\n")
arrangedData <- arrange(untidyData,Subject_ID, Activity_Label)
Descriptive_Activity_Label <- mapvalues(arrangedData$Activity_Label, 
                                        from = c(1,2,3,4,5,6), 
                                        to = c("Walking","Walking Upstairs",
                                               "Walking Downstairs","Sitting",
                                               "Standing","Laying"))

# melting the arranged data with mean and SD as measured values
cat("Melting the data...\n")
meltedData <- melt(arrangedData,id=c("Subject_ID","Activity_Label"),
                   measure.vars=c("Mean","SD"))

# casting the melted data into tidy data
cat("Casting the melted data into a tidy data frame")
tidyData <- dcast(meltedData, Subject_ID + Activity_Label ~ variable, mean)

# exporting the tidy data to a file
cat("Exporting tidy data frame to a txt file...\n")
write.table(tidyData,file = "./tidyData.txt")

# generating output location of saved file
cat(paste("tidyData.txt file is saved in ", getwd() ) )
