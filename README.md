cleaning-data-project
=====================

The objective of this project was to get the human activity recognition using smatrtphones data set from the archive of the information and computer sciences department of the University of California; extract a subset of columns into a tidy data set and compute averages by subject and activity for 66 variables.

Data description link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
###Run Instructions: 

With run_analysis.R, the train and test folders in the working directory, the program can be run by loading and executing the run_analysis function. A text file called run_analysis_output.txt will be written to the working directory. This file is an aggregation of averages for each variable in the tidy data set by activity by subject.
 
###Packages: 

Requires package sqldf 

###Description: 

The first steps of the run_analyis program are to read the needed text files into data frames. These data frames have the same name as the corresponding text file. At this time, the subjects file and activities file are combined with the data file. The train and test data frames are then merged. 

From the larger data set, through SQL, the mean and standard deviation columns are extracted. After reading the description in the features_info.txt file on the UCI site, I included columns with mean() or std() in the variable name because they were true mean and standard deviation fields and not derived columns. Note about sqldf: I was a little hesistant about using a package that is not part of the base R packages. But I went ahead with it since we have used the package in this course on quiz 2 and have not used regular expressions or grep -- what I would have used in place of the SQL. 

The activity column is then added to the data frame by translating the numeric value into a descriptive label. The original numeric column is dropped from the data frame.

The column labels are next applied to the data frame.

And finally, a text file is created called run_analysis_output.txt. This is the averages by variable by activity by subject file required as output for the course project.





