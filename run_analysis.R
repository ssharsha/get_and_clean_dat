#==========================================
# Problem Statement: (from course project)
#==========================================
#You should create one R script called run_analysis.R that does the following. 
#1 - Merges the training and the test sets to create one data set.
#2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 - Uses descriptive activity names to name the activities in the data set
#4 - Appropriately labels the data set with descriptive variable names. 
#5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Requirement:1 - Merge the training and the test sets to create one data set.

# Set the working directory as the directory where the data has been unzipped
setwd("/Users/HARSHA/Desktop/coursera_datascience/get_clean_data/UCI HAR Dataset/")

# Read & Store the test & train data-sets in data-frames. Then, merge the data-sets into one data-frame.
testdat<-read.table("test/X_test.txt")
traindat<-read.table("train/X_train.txt")
combdat<-rbind(testdat, traindat)

# Read the feature list and store in a data-frame
features<-read.table("features.txt")

# Assign column-names to the merged-data set using the variables in the features data-frame
colnames(combdat)<-features[,2]

# Requirement-2: Extract only the measurements on the mean and standard deviation for each measurement. 

# Find the column numbers/positions which contain the mean & standard-deviations. Store in a vector.
id<-grep("-mean\\()", as.character(colnames(combdat)))
id<-c(id,grep("-std\\()", as.character(colnames(combdat))))

# Create a sub-set data out of the merged data containing only the mean+standard-deviations measurements
combdatsub<-combdat[,id]

# Create the Activity vector by merging the activities-info from test & train data-sets
activitytest<-read.table("test/y_test.txt")
activitytrain<-read.table("train/y_train.txt")
combactivity<-rbind(activitytest, activitytrain)
colnames(combactivity)<-"Activity"

# Create the Subject vector by merging the subjects-info from test & train data-sets
subjecttest<-read.table("test/subject_test.txt")
subjecttrain<-read.table("train/subject_train.txt")
combsubject<-rbind(subjecttest, subjecttrain)
colnames(combsubject)<-"Subject"

# Add the Activity & Subject columns to the sub-set data-set
combdatsubjact<-data.frame(combsubject, combactivity, combdatsub)

# Requirement-5: Calculate the average of each variable for each activity and each subject.
p<-1
meandat <- data.frame()

# For each of the subject
for (i in 1:30) {
    # For each of the activity
    for (j in 1:6) {
        # Calculate the average/mean of each variable
        for (k in 1:ncol(combdatsubjact)) {
            q<-numeric()
            q <- as.numeric(tapply(combdatsubjact[,k], combdatsubjact$Subject == i & combdatsubjact$Activity == j, mean))
            meandat[p,k] <- q[2] 
        }
        p<-p+1
    }
}

# Assign column-names to the new data-set containing average of mean/std-dev variables for each activity per subject
colnames(meandat) <- colnames(combdatsubjact)

# Requirement-3: Use descriptive activity names to name the activities in the "Activity" column of the mean data-set
for (i in 1:length(meandat$Activity)) {
    if (meandat$Activity[i] == 1) {
        meandat$Activity[i]<- "WALKING"
    } else if (meandat$Activity[i] == 2) {
        meandat$Activity[i]<- "WALKING_UPSTAIRS"
    } else if (meandat$Activity[i] == 3) {
        meandat$Activity[i]<- "WALKING_DOWNSTAIRS"
    } 
    else if (meandat$Activity[i] == 4) {
        meandat$Activity[i]<- "SITTING"
    } 
    else if (meandat$Activity[i] == 5) {
        meandat$Activity[i]<- "STANDING"
    } else if (meandat$Activity[i] == 6) {
        meandat$Activity[i]<- "LAYING"
    } 
}

#Requirement-4: Appropriately labels the data set with descriptive variable names. 

# Store the column-names in a vector
cn <- colnames(meandat)

# Replace the original column-names of mean/std-dev of measurements with the more accurate names: mean of mean/std-dev of measurements
cn <- sub("*","\\MEAN.",cn)
colnames(meandat) <- cn

# Adjust the subject & activity column-names (changed due to the last operation)
colnames(meandat)[which(names(meandat) == "MEAN.Activity")]<-"Activity" 
colnames(meandat)[which(names(meandat) == "MEAN.Subject")]<-"Subject" 

# Write the data-frame(final tidy data-frame) into a text file(this is the final tidy data-set) using write.table with row.name=FALSE. This is the data-set that needs to be uploaded as assignment.
write.table(meandat, file = "mean_data.txt", row.name=FALSE)

