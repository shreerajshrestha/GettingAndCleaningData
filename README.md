run_analysis.R
==============

This is the analysis script that does the following to the raw dats sets:

  - Merges the training and the test sets to create one data set
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set.
  - Appropriately labels the data set with descriptive variable names.
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 

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

