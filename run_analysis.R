## Pogramming assignment for "Getting and Cleaning data" ## 
## ----------------------------------------------------- ##

# IMPORTANT: Please run this script using the "Source" button in R Studio (or
# source() in the console) instead of highlighting all lines and pressing "run". 
# Using "Source" the script won't crash when the UCI HAR dataset is not in the 
# working directory. Instead the user will asked if the dataset should be 
# downloaded and extracted.


## Preparations ##

# Load necessary R package(s)
library(dplyr)

# Check if "UCI HAR Dataset" folder is existing in working directory. If not, ask 
# user if dataset should be downloaded and extracted into the working directory.
if (!file.exists("UCI HAR Dataset")) { 
    askfordownload <- function() { 
        message("There is no 'UCI HAR Dataset' folder in the working directory!")
        n <- readline(prompt="Do you want to download the dataset to the working directory? <y/n>: ")
        if (n=='y') {
            fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            download.file(fileUrl,destfile = "UCI.zip")
            unzip("UCI.zip")
        }
        else {
            message("Okay. Please place the data folder in the working directory!")
        }
    }
    askfordownload()
}


## 1. Reading the data from text files ##

# Read labels (= activities) and features (variables) text files
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Read training data text files
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Combine training data 
traindata <- cbind(subtrain, ytrain, xtrain)

# Read test data text files
subtest<- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Combine test data (subjectID, )
testdata <- cbind(subtest, ytest, xtest)


## 2. Merge training and test data ##

# Combine "trainingdata" and "testdata" by rows
mydata <- rbind(traindata,testdata)

# Name columns of mydata (use names from features textfile)
names(mydata) <- c("subjectID", "activity", as.character(features[,2]))

# Turn "subjectID" into factor
mydata$subjectID <- factor(mydata$subjectID)

# Turn "activity" into factor and use labels from labels textfile
mydata$activity <- factor(mydata$activity, levels = labels[,1], labels = labels[,2])

# Save mydata selecting only "subjectID", "activity", and columns whose name
# contains "mean()" or "std()"
mydata <- mydata[,grep("subjectID|activity|mean\\(\\)|std\\(\\)", names(mydata), 
                    value = FALSE)]


## 2.1. Tidy up data frame (a little) ##

# Column names: 
names(mydata) <- sub("mean\\(\\)","Mean",names(mydata)) # Replace "mean()" with "Mean"
names(mydata) <- sub("std\\(\\)","Std",names(mydata)) # Replace "std()" with "Std"
names(mydata) <- gsub("-","",names(mydata)) # Delete all "-"

# Activity column: make labels lower-case
mydata$activity <- tolower(mydata$activity)

# Sort data frame according to "subjectID" and "activity" (in ascending order)
mydata <- mydata[order(mydata$subjectID,mydata$activity),]

# Check for NAs in mydata
all(colSums(is.na(mydata))==0) # if TRUE -> no NAs in data 


## 3. Create independent data set "meandata" and save to textfile ##

# Using the pipeline operator a new dataframe "meandata" is created by grouping
# "mydata" by "subjectID" and "activity" and summarising all columns (except for 
# grouping columns) by the mean value  
meandata <- mydata %>%                  # create new data frame based on mydata
    group_by(subjectID,activity) %>%    # group data frame by subjectID and activity
    summarise_all(funs(mean))           # summarise all columns by function indicated by funs

# Write "meandata" into a text file without rownames (row.names = FALSE) and without
# quotes around character strings (quote = FALSE) 
write.table(meandata, file="meandata.txt", row.names = FALSE, quote = FALSE)


## Clean up global environment ##

# Clear all data/values except for mydata and meandata
rm(xtest,xtrain,subtest,subtrain,ytest,ytrain,testdata,traindata,features,labels)