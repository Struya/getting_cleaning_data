



Getting and Cleaning Data CodeBook
========================================================

This Code book is a metadata file, it describes the variables in tidy datasets:

* **first_tidy_df**
* **second_tidy_df**

first_tidy_df
----------------------
This tidy data.frame according to instructions:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names.

It is a data.frame [10,299 rows x 70 columns] with variable names:


```
##  [1] "activity"                    "subject"                    
##  [3] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
##  [5] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
##  [7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
##  [9] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
## [11] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
## [13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
## [15] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
## [17] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
## [19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
## [21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
## [23] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
## [25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
## [27] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
## [29] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
## [31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
## [33] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
## [35] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
## [37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
## [39] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
## [41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
## [43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
## [45] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
## [47] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
## [49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
## [51] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
## [53] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
## [55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
## [57] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
## [59] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
## [61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
## [63] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
## [65] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
## [67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 
## [69] "sample_type"                 "activity_descr"
```


### Variable names with descriptions


* **activity** : integer : ID of the type of activity that each individual had to do during the experiment 


```
## [1] 1 2 3 4 5 6
## Levels: 1 2 3 4 5 6
```


* **activity_descr** : categorical : Label of the type of activity that each individual had to do during the experiment


```
## [1] "WALKING"            "WALKING_UPSTAIRS"   "WALKING_DOWNSTAIRS"
## [4] "SITTING"            "STANDING"           "LAYING"
```


* **subject** : integer : Individual ID number


```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
## [24] 24 25 26 27 28 29 30
```


* **sample_type** : categorical : Does an individual belong to train or test sample?


```
## [1] "01_train" "02_test"
```


* **feature_variables** : numeric : variables from **tBodyAcc-mean()-X** to **fBodyBodyGyroJerkMag-std()**

Description of feature variables is taken from the metadata of the original dataset,
that can be donloaded from [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip):

```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The set of variables that were estimated from these signals are the mean and standard deviation: 

```

```
##  [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
##  [3] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
##  [5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
##  [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
##  [9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
## [11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
## [13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
## [15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
## [17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
## [19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
## [21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
## [23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
## [25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
## [27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
## [29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
## [31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
## [33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
## [35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
## [37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
## [39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
## [41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
## [43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
## [45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
## [47] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
## [49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
## [51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
## [53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
## [55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
## [57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
## [59] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
## [61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
## [63] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
## [65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
```



second_tidy_df
----------------------
This tidy data.frame according to instructions:
* is the same as the first (except that)
* it contains the average of each variable for each activity and each subject.

It is a data.frame [180 rows x 70 columns]

Data sets copyright
----------------------
```
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
```

Tidy data sets Session Info
----------------------


```
## R version 3.1.0 (2014-04-10)
## Platform: i386-w64-mingw32/i386 (32-bit)
## 
## locale:
## [1] LC_COLLATE=Slovenian_Slovenia.1250  LC_CTYPE=Slovenian_Slovenia.1250   
## [3] LC_MONETARY=Slovenian_Slovenia.1250 LC_NUMERIC=C                       
## [5] LC_TIME=Slovenian_Slovenia.1250    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] stringr_0.6.2  reshape2_1.2.2 dplyr_0.1.3    plyr_1.8.1    
## [5] knitr_1.5     
## 
## loaded via a namespace (and not attached):
## [1] assertthat_0.1 evaluate_0.5.3 formatR_0.10   Rcpp_0.11.1   
## [5] tools_3.1.0
```

