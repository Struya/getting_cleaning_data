getting_cleaning_data
=====================

Repository for my Coursera Getting and Cleaning Data course

A Users Guide 
=====================

Content of repository
---------------------
This repository contains three files:

```
* README.md
* run_analysis.R
* CodeBook.md
```
The first you are reading right now. It tries to explain how all of the scripts work  
and how they are connected. The second is the actual R script. Running it with minor  
modifications should get you the results I got, namely the fist and second tidy dataset  
called *first_tidy_df* and *second_tidy_df*. The third file in the repo defines  
the variables in the tidy datasets and describes them in more detail. 

Analisys summary
--------------------

**Objective** (taken from the Coursera course webpage):
*The purpose of this project is to demonstrate ones ability to collect,  
work with, and clean a data set*.

**Raw Dataset** (described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

**My R Source Code**:
The source code that is provided in the run_analisys.r  
loads the raw datasets for train and test group, renames some variables, merges  
several datasets together, filters columns according to instructions,   
and produces the required tidy datasets.

Please note that in order to reproduce the tidy datasets, replace my path  
to files with your own.

Cheers, 
M


