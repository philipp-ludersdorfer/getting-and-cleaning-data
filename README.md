# Getting and cleaning data assignment
The goal of this assignment was to create a tidy dataset based on the "Human Activity Recognition Using Smartphones Dataset" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

This repo contains 2 files (in addition to the README.md):

1) The "run_analysis.R"  script creates textfile called "meandata.txt" that includes a dataset which 
- is a combination of the training and test data set
- includes only the mean and standard deviation of each measurement included in the original data set 
- for each variable includes the average for each subject and activity

2) The "CodeBook.md" file provides a description of the variables and the data in the "meandata.txt" file created by "run_analyis.R" (e.g. performed transformations, etc.). 

IMPORTANT: The R script should be run using the "source" button in R Studio instead of highlighting all lines and pressing "run". Then the script won't crash in case the dataset is not stored in the working directory. Instead the user will be asked if the script should download and extract the dataset from the source".)
