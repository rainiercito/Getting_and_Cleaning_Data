Dataset and variable description  
=============
Both files test and trainning contains Data Sets of an experimentcarried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Using the Samsung Galaxy SII embedded accelerometer and gyroscope, was captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset in each file -training and testing- it is provided as an attribute information:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
Triaxial Angular velocity from the gyroscope
A 561-feature vector with time and frequency domain variables
Its activity label
An identifier of the subject who carried out the experiment


Input Code reference guide:

       Code Description
         1  WALKING
         2  WALKING_UPSTAIRS
         3  WALKING_DOWNSTAIRS
         4  SITTING
         5  STANDING
         6  LAYING
