library(plyr)
library(dplyr)
library(reshape2)
library(stringr)

# getting data into R ####
# metadata, train and test destinations

# IMPORTANT !!!
# For reproducing the analysis, please use your own path for
# metadata_dest, train_dest, test_dest

metadata_dest <- 
  "H:/Users/majamiha-s/Documents/GitHub/getting_cleaning_data/UCI HAR Dataset/"

train_dest <- 
  "H:/Users/majamiha-s/Documents/GitHub/getting_cleaning_data/UCI HAR Dataset/train/"

test_dest <- 
  "H:/Users/majamiha-s/Documents/GitHub/getting_cleaning_data/UCI HAR Dataset/test/"

# activity_labels and features (dimension tables)

# activity labels
activity_labels <- 
  read.table(str_c(metadata_dest, "activity_labels.txt"),
             header = FALSE,
             colClasses = c("factor", "character")) %.%
  rename(c("V1" = "activity", "V2" = "activity_descr")) %.%
  tbl_df()

# features: labels of x_test and x_train variables  
features <-
  read.table(str_c(metadata_dest, "features.txt"), 
             header = FALSE,
             colClasses = "factor") %.%
  rename(c("V1" = "feature", "V2" = "feature_descr")) %.%
  tbl_df()

# train dataset ####

# individuals
subject_train <- 
  read.table(str_c(train_dest, "subject_train.txt"),
             header = FALSE,
             colClasses = "factor") %.%
  rename(c("V1" = "subject")) %.%
  tbl_df()

# measurements (numeric variables) on individuals
x_train <- 
  read.table(str_c(train_dest, "X_train.txt"),
             header = FALSE,
             colClasses = "numeric") %.%
  tbl_df()

# activities
y_train <- 
  read.table(str_c(train_dest, "y_train.txt"),
             header = FALSE,
             colClasses = "factor") %.%
  rename(c("V1" = "activity")) %.%
  tbl_df()

# transforming, renaming, cleaning, merging train data ####

# renaming x_train variables
names(x_train) <- 
  features$feature_descr

# merging y_train and activity_labels

y_labels_train <- 
  #   merge(y_train, 
  #         activity_labels) %.%
  y_train %.%
  tbl_df()

# selecting only "mean()" and "sd()" variables in x_train
var_select_train <- 
  str_detect(colnames(x_train), fixed("mean()")) |
  str_detect(colnames(x_train), fixed("std()")) 

reduced_x_train <- 
  x_train[, var_select_train]

# column binding subject_train, y_labels_train, reduced_x_train
# and adding column that defines the sample type
subject_y_labels_reduced_x_train <- 
  cbind(subject_train, 
        y_labels_train, 
        reduced_x_train) %.%
  mutate(sample_type = rep("01_train")) %.%
  tbl_df()

# test dataset ####

# individuals
subject_test <- 
  read.table(str_c(test_dest, "subject_test.txt"),
             header = FALSE,
             colClasses = "factor") %.%
  rename(c("V1" = "subject")) %.%
  tbl_df()

# measurements (numeric variables) on individuals
x_test <- 
  read.table(str_c(test_dest, "X_test.txt"),
             header = FALSE,
             colClasses = "numeric") %.%
  tbl_df()

# activities
y_test <- 
  read.table(str_c(test_dest, "y_test.txt"),
             header = FALSE,
             colClasses = "factor") %.%
  rename(c("V1" = "activity")) %.%
  tbl_df()

# transforming, renaming, cleaning, merging test data ####

# renaming x_test variables 
names(x_test) <- 
  features$feature_descr

# merging y_test and activity_labels

y_labels_test <- 
  #   merge(y_test, 
  #         activity_labels) %.%
  y_test %.%
  tbl_df()

# selecting only "mean()" and "sd()" variables in x_test
var_select_test <- 
  str_detect(colnames(x_test), fixed("mean()")) | 
  str_detect(colnames(x_test), fixed("std()")) 

reduced_x_test <- 
  x_test[, var_select_test]

# column binding subject_test, y_labels_test, reduced_x_test
# and adding column that defines the sample type
subject_y_labels_reduced_x_test <- 
  cbind(subject_test, 
        y_labels_test, 
        reduced_x_test) %.%
  mutate(sample_type = rep("02_test")) %.%
  tbl_df()


# merging train and test data ####

# first tidy dataset: 
# Extracted only the measurements on the mean and standard deviation
# for each measurement

first_tidy_df <- 
  rbind.fill(subject_y_labels_reduced_x_train, 
             subject_y_labels_reduced_x_test) %.%
  merge(activity_labels) %.%
  arrange(sample_type, activity, subject) %.%
  tbl_df()

# second tidy dataset:
# independent tidy data set with the average of each variable
# for each activity and each subject

second_tidy_df <-
  rbind.fill(subject_y_labels_reduced_x_train, 
             subject_y_labels_reduced_x_test) %.%
  melt(id = c("sample_type", "subject", "activity"), variable.name = "feature") %.%
  group_by(sample_type, subject, activity, feature) %.%
  summarise(value = mean(value, na.rm = TRUE)) %.%
  dcast(sample_type + subject + activity ~ feature) %.%
  #arrange(sample_type, activity, subject) %.%
  merge(activity_labels) %.%
  melt(id = c("sample_type", "subject", "activity", "activity_descr"), variable.name = "feature") %.%
  dcast(sample_type + subject + activity + activity_descr ~ feature) %.%
  arrange(sample_type, activity, subject) %.%
  tbl_df()


# write tidy datasets ####

write.table(first_tidy_df, 
            file = "first_tidy_df.csv")

write.table(second_tidy_df,
            file = "second_tidy_df.csv")