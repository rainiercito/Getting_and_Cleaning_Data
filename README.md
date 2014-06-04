Course project for Getting_and Cleaning_Data module
=========================


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

This Github folder has three files: (i) CodeBook.md file which describes the variables, the data, and any transformations or work that were performed to clean up the data. (ii) A README.md file which explains how the script work and how the required files are connected, and (iii) run_analysis.R script file that does the following: 


- Merges the training and the test sets to create one data set
- Extracts only the measurements on the mean and standard deviation for each measurement 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject  


The run_analysis.R script must use descriptive activity names to name the activities in the data set and 
appropriately labels with descriptive variable names.

The run_analysis.R script files uses two data files: test and training. 


Both files contains Data Sets of an experimentcarried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using the Samsung Galaxy SII embedded accelerometer and gyroscope, was captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


For each record in the dataset in each file -training and testing- it is provided as an attribute information: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
- Triaxial Angular velocity from the gyroscope
- A 561-feature vector with time and frequency domain variables
- Its activity label
- An identifier of the subject who carried out the experiment
