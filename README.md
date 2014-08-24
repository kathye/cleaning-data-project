cleaning-data-project
=====================

The objective of this project was to get the human activity recognition using smatrtphones data set from the archive of the information and computer sciences department of the University of California; extract a subset of columns into a tidy data and compute averages by subject and activity for 66 variables.

Data description link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
###Run Instructions: 

With run_analysis.R, the train and test folders in the working directory, the program can be run by loading and executing the run_analysis function. A text file called run_analysis_output.txt will be written to the working directory. This file is an aggregation of averages for each mean and standard deviation column by activity by subject.
 
###Packages: 

Requires package sqldf  

###Description: 

The first steps are to read the needed text files into data frames with the same name as the text file. At this time, the subjects and activities are combined. The train and test data frames are then merged. 

From the larger data set, the mean and standard deviation columns are extracted. After reading the description in the features_info.txt file on the UC site, I included columns with mean() or std() in the variable name because they were true mean and standard deviation fields and not derived columns.

The activity column is then added to the data frame by translating the numeric value into a descriptive label. The original numeric column is dropped from the data frame.

The column labels are next applied to the data frame.

And finally, a text file is created called run_analysis_output.txt. This is the averages by variable by activity by subject file required as output for the course project.





