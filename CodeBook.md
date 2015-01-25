- The first step in the script was to set the working directory where I downloaded the data

- After the working directory setup, I set the path for the trainSet(x_train), train Label(y_train), subjects(subject_train) in the train set, and set up equivalent paths to the test dataset (testSet(x_test), testLabel(y_test), subject test(subject_test)
- The V2 of the feature txt file contrains 561 types of measurements, while the V2 of the activity labels txt file 
has the descriptive names of the activities in the study
- Then I read the components of the train data: trainSet, trainLabel, and subject train.
- I named the header of the train Label data as Labels, and the header of the subjectTrain as subjects.
- Observing that the trainSet data has as many variables as the features V2 observations, I named the headers of the trainSet according to features V2.
- I performed an equivalent operation in the testSet: named the header of the label and subject data, and attributed the
feature V2 observations to the variables
- As the test and train data sets have the same number of variables, I merged rows in the 2 datasets using the rbind command, and
getting a mergedData dataset
- As the project requires only the mean and standard deviation measures, I used the grep command to find the substrings
mean or std in the header (Features V2) - mean_std gave the indexes where these substrings appear in the headers
- I extracted only the col names which contained the 2 substrings in the train set, and merged these columns with the subject
and label datasets (only for the train set)
- I performed a similar column merge in the test data, merging the label, subjects and mean and std dev columns of the test data set
-Afterwards I merged the rows of the 2 datasets again
- I created a new Variable called activity, to represent the name of the activity label according to the label number in the merged dataset
- I aggregated the average mean and std dev observations the subset obtained by each activity and each subject
- I saved the output of the tidy data as txt file
