## Function that processes the Human Activity Recognition
## Using Smart Phones Data set into a tidy data set

run_analysis <- function() {

## reading into the workspace auxiliary lookup files
        activity_labels <- read.table("activity_labels.txt")
        features <- read.table("features.txt")

## reading and combining data files for the train data set
        x_train <- read.table("train\\X_train.txt")
        y_train <- read.table("train\\y_train.txt")        
        subject_train <- read.table("train\\subject_train.txt")

        colnames(y_train) <- "activity_code"
        train_data <- cbind(y_train, x_train)
        colnames(subject_train) <- "subject_code"
        train_data <- cbind(subject_train, train_data)

## reading and combining data files for the test data set
        x_test <- read.table("test\\X_test.txt")
        y_test <- read.table("test\\y_test.txt")        
        subject_test <- read.table("test\\subject_test.txt")

        colnames(y_test) <- "activity_code"
        test_data <- cbind(y_test, x_test)
        colnames(subject_test) <- "subject_code"
        test_data <- cbind(subject_test, test_data)
        
## combining the train and test data sets
        data <- rbind(train_data, test_data)
        
## extracting the mean and standard deviation columns
        library(sqldf)
        varnames <- sqldf("select V1, V2 from features where V2 like '%mean()%' or V2 like '%std()%' ")
        f <- varnames[[1]] + 2
        f <- c(c(1,2), f)
        data <- data[,f]

## converting the activities into descriptive labels
        x <- sqldf("select d.subject_code as 'subject', a.V2 as 'activity', d.* from data d join activity_labels a on d.activity_code = a.V1")
        d <- c("subject_code", "activity_code")
        x <- x[,!(names(x) %in% d)]
        
## labeling the variables
        v <- as.vector(varnames[[2]])
        v <- c("activity", v)
        v <- c("subject", v)
        colnames(x) <- v

## aggregate data
        tidy <- aggregate(x[,3:68], by=list(subject=x$subject, activity=x$activity), mean)

## write file
        write.table(tidy, file="run_analysis_output", row.names=FALSE)
}