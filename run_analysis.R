
setwd("~/Desktop/Rcoursera/Getting_and_Cleaning_Data/")

# Step 1 
# We need to read X_train.txt, Y_train.txt, and subject_train.txt files from the data folder where they are located, 
# and store them in trainData, trainLabel and trainSubject variables. The same procedure must be done for X_test.txt,
# Y_test.txt and subject_test.txt and store them in testData, testLabel and testsubject variables

  #For train data
  trainData <- read.table("./train/X_train.txt")
  trainLabel <- read.table("./train/y_train.txt")
  table(trainLabel)
  trainSubject <- read.table("./train/subject_train.txt")

  #For test data
  testData <- read.table("./test/X_test.txt")
  testLabel <- read.table("./test/y_test.txt") 
  table(testLabel) 
  testSubject <- read.table("./test/subject_test.txt")

# 2. We need to concatenate the test and train Data. In order to make this happen, concatenate testData to trainData into
# a dataframe simply called Info. Also, the subjects and labels need to be contatenated too; therefore, we need to concatenate 
# testSubject and trainSubject to a subject data frame; and the trainLabel and testLabel to a label data frame

  #Concatenate the train and test Data
  Info <- rbind(trainData, testData)
  
  #Concatenate the subject data
  subject <- rbind(trainSubject,testSubject)
  #add the tag "subject" to the first column in the subject data frame
  names(subject) <- "subject"
  
  #concatenate the labels
  label <- rbind(trainLabel, testLabel)

# 3. We need to read the features.txt file and select only the measurements on the mean and standard deviation and place 
# them in to a vector variable called features; then we need to clean the names of the features selected  -Remove the 
# spaces and "-" from each name

  # Reading the features table
  features <- read.table("./features.txt")

  # Selecting only the indices which have the word mean or std in the column 2 of features
  Indicesformeanstd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
 
  # Removing the blank spaces from the Indices and "-" in the features
   Indicesformeanstdaux <- gsub("\\(\\)", "", features[Indicesformeanstd, 2])
   Indicesformeanstdaux <- gsub("-", "", Indicesformeanstdaux)

# 4.We need to read the activites lables stored in the activity_labels.txt file and assigned to the activities vector. 
# Also, we need to remove the undersocre and make set all activities lables lowercase

  #reading the activities labels
  activities <- read.table("./activity_labels.txt")
  #removing the underscore
  activities[, 2] <- tolower(gsub("_", "", activities[, 2]))
  #setting the activities labels lowercase
  substr(activities[2, 2], 8, 8) <- tolower(substr(activities[2, 2], 8, 8))
  substr(activities[3, 2], 8, 8) <- tolower(substr(activities[3, 2], 8, 8))
  #puting the activities label's description name instead of the numbers
  activitylabel <- activities[label[, 1], 2] 
  label[, 1] <- activitylabel
  #puting the "activity" tag to the column of the activities
  names(label) <- "activity"


# 5. We need to subset the Info data frame based on the features vector defined above and called it Info_subset
  #Subseting the info data frame with the meanStdIncides 
  Info_sub <- Info[, Indicesformeanstd]
  #Assign the subset names to the data
  names(Info_sub) <- Indicesformeanstdaux

# 6. We need to add to the Info_subset the subjects and the activity label data and saved under the "merged_data.txt" name
  compactedData <- cbind(subject, label, Info_sub)
  #dim(compactedData) # 10299*68
  #write out the data and saved under the merged_data.txt
  write.table(compactedData, "merged_data.txt") 

# 7. We need to generate an independent tidy data set called "data_with_means.txt" file with the average of each measurement
# for each activity and each subject. 
  #determining Depth and width of the matrix that will contain the averages per activity
  #depth = number of subjects (30)
  subjectsize <- length(table(subject))
  #classification of the activities (6) we can call this subcategories
  activitysize <- dim(activities)[1] 
  #width = number activities registered as a columns of the compacted subset data (68)
  columnsize <- dim(compactedData)[2]
  #creating a matrix with size 30X 68
  tempmatrix <- matrix(NA, nrow=subjectsize*activitysize, ncol=columnsize) 
  #converting the matrix as a data frame and assignating the column names based on the compacted data subset
  result <- as.data.frame(tempmatrix)
  colnames(tempmatrix) <- colnames(compactedData)
  #We are going to use a two for nested in order to make the average per each activity meaning average of 6 samples
  # per 66 activities per 30 subjets
  row <- 1
  # for for the subjects 30
  for(i in 1:subjectsize) {
    #for for the activity 66
    for(j in 1:activitysize) {
      tempmatrix[row, 1] <- sort(unique(subject)[, 1])[i]
      tempmatrix[row, 2] <- activities[j, 2]
      bool1 <- i == compactedData$subject
      bool2 <- activities[j, 2] == compactedData$activity
      tempmatrix[row, 3:columnsize] <- colMeans(compactedData[bool1&bool2, 3:columnsize])
      row <- row + 1
    }
  }
  head(tempmatrix)
  write.table(tempmatrix, "data_with_means.txt") # write out the 2nd dataset
  
 
  
  
