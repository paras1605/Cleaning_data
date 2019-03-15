# Cleaning_data

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. Load the features, training datasets and then use features as vectors to add column names to the training data set
2. Load the activity and convert it into factor.
3. Load the subject and convert it into vector.
4. Loads the activity and subject data and merges those columns training datasets
5. Training dataset now have subject and activity as columns.
6. The same thing for features, subject and activity is repeated for test dataset.
7. Merges the test and training datasets
8. Only columns having mean and standart deviation values are kept.
9. Load the activity labels as vector and then added to activity with the help of levels.
10. Parenthesis is removed and hyphen(-) replaced by underscore( _ ).
11. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file mean_data.txt.
