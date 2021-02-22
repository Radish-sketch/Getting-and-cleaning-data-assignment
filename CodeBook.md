---
title: "Codebook"
author: "YOU!"
date: "22/02/2021"
output: 
    md_document:
        variant:markdown_github
---

The dataset used the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- features from 'features.txt': List of all features. 1 to 561.

- activity from 'activity_labels.txt': Links the class labels with their activity name. From 1 to 6.

- testSet from 'test/X_test.txt': Test set. The processed test data.

- testLabels from 'test/y_test.txt': Test labels. The activities corresponding to each test data. From 1 to 6.

- trainingSet from 'train/X_train.txt': Training set.The processed training data.

- trainingLabels from 'train/y_train.txt': Training labels. The activities corresponding to each training data. From 1 to 6.

- subjectTrain from 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- subjectTest from 'test/subject_test.txt' : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- mergedData : merge the testSet and training trainingSet with activity

- newData : average of each variable for each activity and each subject. 172 variables, only mean and std are included.

