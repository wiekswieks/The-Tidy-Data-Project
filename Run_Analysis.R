# Review Criteria
# The submitted data set is tidy.
# The Github repo contains the required scripts.
# GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
# The README that explains the analysis files is clear and understandable.
# The work submitted for this project is the work of the student who submitted it.

# R Script
# Clear Environment
rm(list=ls())

# Load Library
library(dplyr)

# Get and Set the working directory
getwd()
setwd("C:/Users/wcombrinck/Documents/data/UCI HAR Dataset/UCI HAR Dataset")

# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 1 - Start    @@@@@@@@@@@@@@@@@@@@@@@@@@
# Merges the training and the test sets to create one data set.
# ************************* Load Training Data *************************
# Load Training Data X
Data_Training_X <- read.csv("train/X_train.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Training_X, 2)
# Show column names
names(Data_Training_X)

# Load Training Data Y
Data_Training_Y <- read.csv("train/y_train.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Training_Y, 2)
# Show column names
names(Data_Training_Y)

# Load Training Data Subjecct
Data_Training_Subject <- read.csv("train/subject_train.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Training_Subject, 2)
# Show column names
names(Data_Training_Subject)

# ************************* Load Training Data *************************

# ************************* Load Test Data *************************
# Load Test Data X
Data_Test_X <- read.csv("test/X_test.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Test_X, 2)
# Show column names
names(Data_Test_X)

# Load Test Data Y
Data_Test_Y <- read.csv("test/y_test.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Test_Y, 2)
# Show column names
names(Data_Test_Y)

# Load Test Data Subjecct
Data_Test_Subject <- read.csv("test/subject_test.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Test_Subject, 2)
# Show column names
names(Data_Test_Subject)
# ************************* Load Test Data *************************

# ************************* Merge Training and Test Data *************************
# Merge the Training Data X / Test Data X
Data_Merge_X_Training_Test <- rbind(Data_Training_X, Data_Test_X)
# Show first 2 rows
head(Data_Merge_X_Training_Test, 2)
# Show column names
names(Data_Merge_X_Training_Test)

# Merge the Training Data Y / Test Data Y
Data_Merge_Y_Training_Test <- rbind(Data_Training_Y, Data_Test_Y)
# Show first 2 rows
head(Data_Merge_Y_Training_Test, 2)
# Show column names
names(Data_Merge_Y_Training_Test)

# Merge the Subject Data train / Subject Data Test
Data_Merge_Subject_Training_Test <- rbind(Data_Test_Subject, Data_Training_Subject)
# Show first 2 rows
head(Data_Merge_Subject_Training_Test, 2)
# Show column names
names(Data_Merge_Subject_Training_Test)
# ************************* Merge Training and Test Data *************************
# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 1 - End    @@@@@@@@@@@@@@@@@@@@@@@@@@

# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 2 - Start    @@@@@@@@@@@@@@@@@@@@@@@@@@
# Extracts only the measurements on the mean and standard deviation for each measurement.
# ************************* Load Feature Data *************************
Data_Features <- read.csv("features.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Features, 20)
# Show column names
names(Data_Features)
# ************************* Load Feature Data *************************

# ************************* Select the columns for Mean / Std from Feature Data *************************
Data_Features_Mean_Std <- grep(".*[Mm]ean.*|.*[Ss]td.*", Data_Features[,2])
# Show first 20 rows
head(Data_Features_Mean_Std, 20)
# Show column names
names(Data_Features_Mean_Std)

# Subset the merged data
Data_Merge_X_Training_Test <- Data_Merge_X_Training_Test[,Data_Features_Mean_Std]
# Show first 20 rows
head(Data_Merge_X_Training_Test, 20)
# Show column names
names(Data_Merge_X_Training_Test)
# ************************* Select the columns for Mean / Std from Feature Data *************************

# ************************* Change the mean and std descriptions from Feature Data *************************
# Change the column names to the original Data Feature names
names(Data_Merge_X_Training_Test) <- Data_Features[Data_Features_Mean_Std, 2]
# Show first 20 rows
head(Data_Merge_X_Training_Test, 20)
# Show column names
names(Data_Merge_X_Training_Test)
# ************************* Change the mean and std descriptions from Feature Data *************************
# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 2 - End    @@@@@@@@@@@@@@@@@@@@@@@@@@

# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 3 - Start    @@@@@@@@@@@@@@@@@@@@@@@@@@
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# ************************* Load Activity Data *************************
Data_Activity_Labels = read.csv("activity_labels.txt", sep="", header=FALSE)
# Show first 2 rows
head(Data_Activity_Labels, 2)
# Show column names
names(Data_Activity_Labels)
# ************************* Load Activity Data *************************

# ************************* Change the Y Training / Test Data with Activity Labels *************************
# Data_Merge_Y_Training_Test[, 1]
# Data_Activity_Labels[, 2]
Data_Merge_Y_Training_Test[, 1] <- Data_Activity_Labels[Data_Merge_Y_Training_Test[, 1], 2]
# Show first 2 rows
head(Data_Merge_Y_Training_Test, 2)
# Show column names
names(Data_Merge_Y_Training_Test)
# ************************* Change the Y Training / Test Data with Activity Labels *************************

# ************************* Change the Y Training / Test Data column name  *************************
names(Data_Merge_Y_Training_Test) <- "Activity"
# Show first 2 rows
head(Data_Merge_Y_Training_Test, 2)
# Show column names
names(Data_Merge_Y_Training_Test)
# ************************* Change the Y Training / Test Data column name  *************************

# ************************* Change the Subject Training / Test Data column name  *************************
names(Data_Merge_Subject_Training_Test) <- "Subject"
# Show first 2 rows
head(Data_Merge_Subject_Training_Test, 2)
# Show column names
names(Data_Merge_Subject_Training_Test)
# ************************* Change the Subject Training / Test Data column name  *************************

# ************************* Merge All Data X / Y / Subject Training / Test *************************
Data_Merge_All_Data <- cbind(Data_Merge_X_Training_Test, Data_Merge_Y_Training_Test, Data_Merge_Subject_Training_Test)
# Show first 2 rows
head(Data_Merge_All_Data, 2)
# Show column names
names(Data_Merge_All_Data)
# ************************* Merge All Data X / Y / Subject Training / Test *************************
# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 3 - End    @@@@@@@@@@@@@@@@@@@@@@@@@@

# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 4 - Start    @@@@@@@@@@@@@@@@@@@@@@@@@@
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# ************************* Add the mean / average for each column grouped by Activity and Subject *************************
Data_Tidy <- aggregate(Data_Merge_All_Data, list(Activity = Data_Merge_All_Data$Activity, Subject = Data_Merge_All_Data$Subject), FUN=mean) 
# Show first 2 rows
head(Data_Tidy, 2)
# Show column names
names(Data_Tidy)
# ************************* Add the mean / average for each column grouped by Activity and Subject *************************

# ************************* Remove Activity and Subject columns at the end of the Data *************************
Data_Tidy[,90] <- NULL
Data_Tidy[,89] <- NULL
# ************************* Remove Activity and Subject columns at the end of the Data *************************

# ************************* Export the clean data set *************************
write.table(Data_Tidy, "Data_Tidy.txt", sep="|", row.names = FALSE)
# ************************* Export the clean data set *************************
# @@@@@@@@@@@@@@@@@@@@@@@@@@    Step 4 - End    @@@@@@@@@@@@@@@@@@@@@@@@@@

# Clear Environment
rm(list=ls())
