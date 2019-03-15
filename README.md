# Cleaning_data

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

Load the features, training datasets and then use features as vectors to add column names to the training data set
Load the activity and convert it into factor.
Load the subject and convert it into vector.
Loads the activity and subject data and merges those columns training datasets
Training dataset now have subject and activity as columns.
The same thing for features, subject and activity is repeated for test dataset.
Merges the test and training datasets
Only columns having mean and standart deviation values are kept.
Load the activity labels as vector and then added to activity with the help of levels.
Parenthesis is removed and hyphen(-) replaced by underscore( _ ).
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file mean_data.txt.
