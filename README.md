# Getting-and-cleaning-data-assignment
 1. The code first set the working directly, then download the .zip file from the link provided and unzip the files
 
 2. Then read all the data sets that will be used later. the data set contains data from 30 volunteers/subjects and 561 feature vectors. The features.txt file list the name of 561 features vectors, and is corresponding to the columns of the testSet(read from x_test.txt) and trainingSet ( read from x_train.txt).The testSet and trainingSet are the processed data using the data from the two folders. The testLabels (y_test.txt) and trainingLabels (y_train.txt) correspond to different activities labeled from 1 to 6. the activity dataframe (activity_labels.txt) is the 6 activities. subjectTest (subject_test.txt) and subjectTrain (subject_train.txt) label the dataset with the volunteers, they have the same length as the testSet and trainingSet.
 
 3. Lable the testSet and trainingSet with features by directly changing the column name into features, then add testLabels/trainingLabels to a column called activity add subjectTest/subjectTrain to another column called "volunteer".
 
 4. Merge the testSet and TrainingSet by activity, which is labeld from 1-6.
 
 5. Only keep the variables with "mean" or "std", 172 columns left.
 
 6. Change the values 1-6 in "activity" column into descriptive names. 
 
 7. Calculate the average of each variable for each activity and each subject.
 
 8. Output data to .txt file
