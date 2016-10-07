# CodeBook for the dataset in meandata.txt (= output of run_analysis.R)

The dataset in "meandata.txt" is a tidy summary data set of the "Human Activity Recognition Using Smartphones Data Set" available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. In short, the data come from the accelerometer and gyroscope of smartphones which were worn by volunteers (N=30) performing different activities (see below). For a full description of the experiment and data see link above.


## Variables included in meandata.txt :

The first two columns of the dataset are factors identifying subject and activity:

- subjectID: Subject identifier. The range is from 1 to 30. 
- activity: Activity performed by the subject. 6 levels: walking, walking upstairs, walking downstairs, standing, siting, laying.

The remaining 66 columns represent the means and the standard deviations for the following time- and frequency domain features included in the original data set (-XYZ is used to denote 3 separate columns for X, Y, and Z direction):

Time-domain features (prefix 't') include:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag

Frequency-domain features (prefix 'f') include:
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag 
- fBodyBodyAccJerkMag 
- fBodyBodyGyroMag
- fBodyBodyGyroJerkMag

For each of these features exists one column in the datset represented the mean (variable names include 'Mean') and one column representing the standard deviation (variable name include 'Std').

## Transformations:

The values for the features included in meandata.txt represent the average for each subject and each activity.
