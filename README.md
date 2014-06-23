run_analysis.R
==============

This is the analysis script that does the following to the raw dats sets:

  - Merges the training and the test sets to create one data set
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set.
  - Appropriately labels the data set with descriptive variable names.
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - 
  
Running the script
==================
The run_analysis.R script first reads the files for the test data and the train data; namely subject_test.txt, y_test.txt and X_test.txt for the test data and subject_train.txt, y_train.txt and X_train.txt. The subject_test.txt and the subject_train.txt file consists of the index number for the subject for whom the corresponding data was taken. Similarly, the y_test.txt and the y_train.txt file consists the index for the activity labels (see CodeBook.md for further details). The X_test.txt and the X_train.txt files consists of the data set used in the analysis.

First, we read the three files for test and the train data into data frames. The three data tables are then column binded to make one data frame, each for test and the train data. These two data frames are row binded together to make a master untidy data set from which we extract our measurements for the mean and the standard deviation. By melting the untidy data with the subject ID and the activity label as ID variables and the mean and standard deviation as measured variables, the tidy data is set by casting the melted data with respect to the ID variables.

The final tidy data table is exported to a txt file using write.table() function.
 

Running the script
==================

Source the run_analysis.R file to run the cleaning script. The following output will be generated:

```
Reading the test data...
Reading the train data...
Binding columns of test data and train data...
Binding rows for test and train data into one table...
Calculating mean and SD for the merged data...
Subsetting required values into a separate table...
Installing the plyr package, if necessary...
Arranging the extracted data...
Melting the data...
Casting the melted data into a tidy data frameExporting tidy data frame to a txt file...
tidyData.txt file is saved in  /Users/default/Desktop/R [your working directory]
```

Output
======
The tidy data set will be stored in your working directory as a txt file.

