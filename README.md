## Getting and cleaning data assignment
The goal of this assignment was to create a tidy dataset based on the "Human Activity Recognition Using Smartphones Dataset" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This repo contains 2 files (in addition to the README.md):

### 1) The "run_analysis.R"  script 
... outputs a textfile called "meandata.txt" that contains a "tidy" dataset which 
- is a combination of the training and test data set of the original data
- contains only the mean and standard deviation features included in the original data set 
- for each feature contains only the average value for each subject and activity

The script should be run using the source() function (or the "source" button in R Studio) instead of highlighting all lines and pressing "run" to avoid that the script crashes when the original dataset is not in the working directory. 

When sourced the script does the following processing steps:
- check if original data set is in working directory (if not, dataset is optionally downloaded)
- read in the relevant text files
- merge training and test data sets
- add columns names (for features) and labels for "activity" variable 
- extract only mean and standard deviation features
- transform dataset to create a tidy one containing for each feature only the averaged value for each subject and activity
- write tidy data set to text file

### 2) The "CodeBook.md" file 
... provides a description of the data set in the "meandata.txt" file created by "run_analyis.R" (e.g. performed transformations, etc.).
