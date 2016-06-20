##Code Book - a tidy data set with data collected from the accelerometers from the Samsung Galaxy S smartphone

* activity - activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* subject - the subject who performed the activity (ranges from 1 to 30)
* columns 3-68 labeled with feature names - the average of the feature for the activity and the subject (features are normalized and bounded within [-1,1])

Transformations that were performed on the original dataset:

1. The training and the test sets were merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement were extracted.
3. Descriptive activity names were used to name the activities in the data set.
4. The data set was appropriately labeled with descriptive variable names.
5. From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject was created.