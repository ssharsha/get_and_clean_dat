get_and_clean_dat
=================

This repo. contains the course project.

Link to the repository:

https://github.com/ssharsha/get_and_clean_dat

The files in this repository are the following:

1 - README.md --> This file listing all the files present in this repository.

2 - run_analysis.R --> This is the R script that performs the tasks listed in the course project. Some notes regarding this script. (Note: Detailed comments about each and every step in the script are listed within the script)

a - The launch-directory of the script doesn't matter(as long as the correct pointer to the script is provided) as the working directory is set-up in the script it-self. Example: 

  Script is located and launched from the following directory:
  
  /Users/HARSHA/Desktop/coursera_datascience/get_clean_data/
  
  source("run_analysis.R")
  
  The data is located @ (this is also the working directory set using setwd() in the script itself)
  
  /Users/HARSHA/Desktop/coursera_datascience/get_clean_data/UCI HAR Dataset/

3 - CodeBook.md --> 

a - This file contains a short description of the operations performed/objects created in the script(2) above.

b - Also lists the column-names (& a brief-desciption of col. names) of the final text file created containing the average of mean/std.variables for each activity per each subject.
    

