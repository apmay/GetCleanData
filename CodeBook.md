## Code Book

This code book provides additional information about the variables, data collection, and transformations in creating the tidy data set.

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Further information about the experiment and data set, as well as access to the data set itself, can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data Extraction and Tidying
 
1. Loading and merging files of training and test data to create a single data set.
From the full collection of files, the following text files are extracted, loaded, and merged into a single data set.

- activity_labels.txt
- features.txt
- subject_train.txt
- X_train.txt
- y_train.txt
- subject_test.txt
- X_test.txt
- y_test.txt

2. Extracts the mean and standard deviation for each measurement in the set.
The data set is narrowed down to only measurement variables that are means or standard deviations of measurements.

3. Uses descriptive activity names to name the activities in the data set.
Numerical representations of activities are replaced with descriptive text.

4. Labels the data set with descriptive variable names.
Variable names are cleaned and modified to provide descriptive representations of the measurements.

5. Creates a tidy data set with the average of each variable for each activity and each subject.
This data set is then condensed by taking the mean of each variable for each activity and subject.

6. Writes the tidy data set to a text file "tidy.txt".
The resulting data set is then written to a text tile "tidy.txt".



