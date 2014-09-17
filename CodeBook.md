CodeBook
==========

Reference material:
 
"UCI HAR Dataset" & the data/files present in the unzipped directory that was provided in the course project: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

This codebook contains the following:

a - A short description of the objects created in the run_analysis.R script.
    
b - Also lists the column-names (& a brief-desciption of column names) of the final tidy-data text file created containing the average of mean/std.variables for each activity per each subject
    

a - List of objects created by run_analysis.R

testdat          <- Data-frame containing the test-data

traindat         <- Data-frame containing the train-data 

combdat          <- Merged data-frame(10299 rows & 561 colums) containing the test & training data

features         <- Data-frame containing the list of features present in "UCI HAR Dataset/features.txt"

colnames(combdat)<- Create columns names from features[,2] 

id               <- Numeric vector containing column numbers/positions of the mean & standard-deviations of measurements. 

combdatsub       <- Data-frame of sub-set data out of the merged data containing only the mean+standard-deviations measurements

activitytest     <- Data-frame containing the activities in test-data from "UCI HAR Dataset/test/y_test.txt".

activitytrain    <- Data-frame containing the activities in train-data from "UCI HAR Dataset/train/y_train.txt"

combactivity     <- Data-frame containign the merged activities from test & train data-sets. 

subjecttest      <- Data-frame containing the subjects in test-data from "UCI HAR Dataset/test/subject_test.txt".

subjecttrain     <- Data-frame containing the activities in train-data from "UCI HAR Dataset/train/subject_train.txt"

combsubject      <- Data-frame containing the merged subjects from test & train data-sets. 

combdatsubjact   <- Data-frame which contains combsubject & combactivity as two columns added to the data-frame: combdatsub

meandat          <- Data-frame (180 rows & 68 colums) containing the mean of each of mean/std-deviation measurements for each of the activity per each subject

cn               <- Vector containing the column-names of the data-frame:meandat. The column names are modified to add "MEAN." infront of each of mean/std-dev. measurement names to accurately reflect the contents in the rows. And subsequently these modified names are re-assigned as column-names of data-frame: meandat

mean_data.txt    <- The data-frame: meandat is written out as this tidy-data output text file using write.table function

b - List of column-names present in the output tidy-data: mean_data.txt file

Following is a bried description of the columns names in the tidy data-set: mean_data.txt: 

1 - "Subject"   --> List of numbers in the range 1-30 representing the 30 volunteers.                        

2 - "Activity"  --> Contains the names of either of the 6 activities as per the activity labels file:  "UCI HAR Dataset/activity_lables.txt".      

For reference, following are the measurement names of interest from the file: "UCI HAR Dataset/features_info.test.txt" that were recorded: 

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The estimated variables of interest for the above measurements are mean: mean() & standard-deviation: std().

Accordingly, a grep operation (please see run_analysis.R script) was performed to obtain only the mean & std-dev measurements. Please see: "UCI HAR Dataset/features.txt" for the list of these variables. After finding the mean of each of these mean/std-dev. measurements per activity per subject, the columns-names in the tidy-data set are named as the same variables as found in this features-list but now appropriately beginning with "MEAN" indicating an average of these measurements was taken. These final column-names(66) are listed below:

3 - "MEAN.tBodyAcc.mean...X"          
4 - "MEAN.tBodyAcc.mean...Y"           
5 - "MEAN.tBodyAcc.mean...Z"           
6 - "MEAN.tGravityAcc.mean...X"       
7 - "MEAN.tGravityAcc.mean...Y"        
8 - "MEAN.tGravityAcc.mean...Z"        
9 - "MEAN.tBodyAccJerk.mean...X"      
10 - "MEAN.tBodyAccJerk.mean...Y"       
11 - "MEAN.tBodyAccJerk.mean...Z"       
12 - "MEAN.tBodyGyro.mean...X"         
13 - "MEAN.tBodyGyro.mean...Y"          
14 - "MEAN.tBodyGyro.mean...Z"          
15 - "MEAN.tBodyGyroJerk.mean...X"     
16 - "MEAN.tBodyGyroJerk.mean...Y"      
17 - "MEAN.tBodyGyroJerk.mean...Z"      
18 - "MEAN.tBodyAccMag.mean.."         
19 - "MEAN.tGravityAccMag.mean.."       
20 - "MEAN.tBodyAccJerkMag.mean.."      
21 - "MEAN.tBodyGyroMag.mean.."        
22 - "MEAN.tBodyGyroJerkMag.mean.."     
23 - "MEAN.fBodyAcc.mean...X"           
24 - "MEAN.fBodyAcc.mean...Y"          
25 - "MEAN.fBodyAcc.mean...Z"           
26 - "MEAN.fBodyAccJerk.mean...X"       
27 - "MEAN.fBodyAccJerk.mean...Y"      
28 - "MEAN.fBodyAccJerk.mean...Z"       
29 - "MEAN.fBodyGyro.mean...X"          
30 - "MEAN.fBodyGyro.mean...Y"         
31 - "MEAN.fBodyGyro.mean...Z"          
32 - "MEAN.fBodyAccMag.mean.."          
33 - "MEAN.fBodyBodyAccJerkMag.mean.." 
34 - "MEAN.fBodyBodyGyroMag.mean.."     
35 - "MEAN.fBodyBodyGyroJerkMag.mean.." 
36 - "MEAN.tBodyAcc.std...X"           
37 - "MEAN.tBodyAcc.std...Y"            
38 - "MEAN.tBodyAcc.std...Z"            
39 - "MEAN.tGravityAcc.std...X"        
40 - "MEAN.tGravityAcc.std...Y"         
41 - "MEAN.tGravityAcc.std...Z"         
42 - "MEAN.tBodyAccJerk.std...X"       
43 - "MEAN.tBodyAccJerk.std...Y"        
44 - "MEAN.tBodyAccJerk.std...Z"        
45 - "MEAN.tBodyGyro.std...X"          
46 - "MEAN.tBodyGyro.std...Y"           
47 - "MEAN.tBodyGyro.std...Z"           
48 - "MEAN.tBodyGyroJerk.std...X"      
49 - "MEAN.tBodyGyroJerk.std...Y"       
50 - "MEAN.tBodyGyroJerk.std...Z"       
51 - "MEAN.tBodyAccMag.std.."          
52 - "MEAN.tGravityAccMag.std.."        
53 - "MEAN.tBodyAccJerkMag.std.."       
54 - "MEAN.tBodyGyroMag.std.."         
55 - "MEAN.tBodyGyroJerkMag.std.."      
56 - "MEAN.fBodyAcc.std...X"            
57 - "MEAN.fBodyAcc.std...Y"           
58 - "MEAN.fBodyAcc.std...Z"            
59 - "MEAN.fBodyAccJerk.std...X"        
60 - "MEAN.fBodyAccJerk.std...Y"       
61 - "MEAN.fBodyAccJerk.std...Z"        
62 - "MEAN.fBodyGyro.std...X"           
63 - "MEAN.fBodyGyro.std...Y"          
64 - "MEAN.fBodyGyro.std...Z"           
65 - "MEAN.fBodyAccMag.std.."           
66 - "MEAN.fBodyBodyAccJerkMag.std.."  
67 - "MEAN.fBodyBodyGyroMag.std.."      
68 - "MEAN.fBodyBodyGyroJerkMag.std.." 

