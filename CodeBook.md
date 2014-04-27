# Study Design


The Data Set was downloaded from this link <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> on the 20th of April 2014.


## Information regarding the Data Set

### Description of the Data Set
(Source: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>) 

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.* 


### Files included in the Data Set - Raw Data

**Files used in this study:**

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Files not used in this study:**
- 'train/Inertial Signals/total_acc_x_train.txt'
- 'train/Inertial Signals/total_acc_y_train.txt'
- 'train/Inertial Signals/total_acc_z_train.txt'
- 'train/Inertial Signals/body_acc_x_train.txt'
- 'train/Inertial Signals/body_acc_y_train.txt'
- 'train/Inertial Signals/body_acc_z_train.txt'
- 'train/Inertial Signals/body_gyro_x_train.txt'
- 'train/Inertial Signals/body_gyro_y_train.txt'
- 'train/Inertial Signals/body_gyro_z_train.txt'

**More information about the Data Set and in the features:**

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'README.txt' 

### Extracts and Transformations Applied on the Raw Data

**We perform the below steps on the raw data:**

1. Loading the following files: 'features.txt', 'activity_labels.txt', 'X_train.txt', 'y_train.txt', 'X_test.txt', 'y_test.txt' and 'subject_train.txt'. The training set has 7352 observations and 562 variables (561 dependent variables in X and one independent variable in y). The test set contains 2947 observations and 562 variables (561 dependent variables in X and one independent variable in y).

2. Name columns of the variables in X (both testing and training set)with the names of the features. Also name the variable in y with "activity".

3. Extracting from X (both training and testing set) only the features corresponding to the mean (leaving out meanFreq since mean for the same feature already exists) and standard deviation. After the extraction, the training set has 7352 observations and 67 variables (67 dependent variables in X and one independent variable in y). The test set contains 2947 observations and 67 variables (66 dependent variables in X and one independent variable in y).

4. Binding by columns the independent and dependent variables (X and y).

5. Merging the test and training set observations (for both X and y), since the test set and training set are independent (i.e. no overlapping in the observations) it is essentially binding by rows the testing and training sets.

6. Adding a column ('activityName') to the mergedData of step 5, by merging it with the table of the activity_lables file. After the of step 5 and 6, the data set has 10299 observations and 68 variables (66 feature variables, one variable representing the activities, and one variable representing the subject).

7. Change the names of the variables with more explicit names.

8. Create and export a tidy data set that contains the average of each feature of the merged file for the previous step for each activity and each subject. Please see below the Code Book section for more info about this tidy data set.


# Code Book


## Description of the Variables

In this section we describe the tidy data created from the steps described in the Study and Design section.
There are 180 observations in the tidy data set. This correspond to the 6 activities times 30 subjects.
There are 68 variables in the tidy data set.

The variable 'subject' contains an Integer that represents the id of the subject observed.
The variable 'activityName' contains a String with the type of activity the subject was performing.
And the rest of the variables (i.e. 66 variables) contain the mean of the mean or the mean of the standard deviation of a feature, for each subject-activity combination.


**Lets take two examples to describe the pattern on the 66 remaining variables:**

- For example, the variable 'timeBodyAccMagMean.Mean' contains the mean of the mean of the feature 'timeBodyAccMagMean' for each subject and each activity.
- As another example, the variable 'timeBodyAccMagStd' contains the mean of the standard deviation for each subject and each activity.


## List of the Variables


Variables  |  
---------- |
1. subject    |                     
2. activityName|                     
3. timeBodyAccMeanX.Mean|
4. timeBodyAccMeanY.Mean|           
5. timeBodyAccMeanZ.Mean|           
6. timeBodyAccStdX.Mean|            
7. timeBodyAccStdY.Mean|            
8. timeBodyAccStdZ.Mean|            
9. timeGravityAccMeanX.Mean|        
10. timeGravityAccMeanY.Mean|        
11. timeGravityAccMeanZ.Mean|        
12. timeGravityAccStdX.Mean|         
13. timeGravityAccStdY.Mean|         
14. timeGravityAccStdZ.Mean|         
15. timeBodyAccJerkMeanX.Mean|       
16. timeBodyAccJerkMeanY.Mean|       
17. timeBodyAccJerkMeanZ.Mean|       
18. timeBodyAccJerkStdX.Mean|        
19. timeBodyAccJerkStdY.Mean|        
20. timeBodyAccJerkStdZ.Mean|        
21. timeBodyGyroMeanX.Mean|          
22. timeBodyGyroMeanY.Mean|          
23. timeBodyGyroMeanZ.Mean|          
24. timeBodyGyroStdX.Mean|           
25. timeBodyGyroStdY.Mean|           
26. timeBodyGyroStdZ.Mean|           
27. timeBodyGyroJerkMeanX.Mean|      
28. timeBodyGyroJerkMeanY.Mean|      
29. timeBodyGyroJerkMeanZ.Mean|      
30. timeBodyGyroJerkStdX.Mean|       
31. timeBodyGyroJerkStdY.Mean|       
32. timeBodyGyroJerkStdZ.Mean|       
33. timeBodyAccMagMean.Mean|         
34. timeBodyAccMagStd.Mean|          
35. timeGravityAccMagMean.Mean|      
36. timeGravityAccMagStd.Mean|       
37. timeBodyAccJerkMagMean.Mean|     
38. timeBodyAccJerkMagStd.Mean|      
39. timeBodyGyroMagMean.Mean|        
40. timeBodyGyroMagStd.Mean|         
41. timeBodyGyroJerkMagMean.Mean|    
42. timeBodyGyroJerkMagStd.Mean|     
43. freqBodyAccMeanX.Mean|           
44. freqBodyAccMeanY.Mean|           
45. freqBodyAccMeanZ.Mean|           
46. freqBodyAccStdX.Mean|            
47. freqBodyAccStdY.Mean|            
48. freqBodyAccStdZ.Mean|            
49. freqBodyAccJerkMeanX.Mean|       
50. freqBodyAccJerkMeanY.Mean|       
51. freqBodyAccJerkMeanZ.Mean|       
52. freqBodyAccJerkStdX.Mean|        
53. freqBodyAccJerkStdY.Mean|        
54. freqBodyAccJerkStdZ.Mean|        
55. freqBodyGyroMeanX.Mean|          
56. freqBodyGyroMeanY.Mean|          
57. freqBodyGyroMeanZ.Mean|          
58. freqBodyGyroStdX.Mean|           
59. freqBodyGyroStdY.Mean|           
60. freqBodyGyroStdZ.Mean|           
61. freqBodyAccMagMean.Mean|         
62. freqBodyAccMagStd.Mean|          
63. freqBodyBodyAccJerkMagMean.Mean| 
64. freqBodyBodyAccJerkMagStd.Mean|
65. freqBodyBodyGyroMagMean.Mean|  
66. freqBodyBodyGyroMagStd.Mean|
67. freqBodyBodyGyroJerkMagMean.Mean|
68. freqBodyBodyGyroJerkMagStd.Mean |
