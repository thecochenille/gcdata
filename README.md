# gcdata
------

**This repository includes two files:**

- The code book "CodeBook.md" for the Data Set.
- The script "run_analysis.R" that contains all the steps of the analysis performed on the Raw data.


**Some requirements to run the script:**

To run the script you can use `source("run_analysis.R")` if you have the file on your working directory.
Alternatively use `source(path)`, were `path` is the path were the file "run_analysis.R" resides.

The script is using the package `"data.table"`.
The first line of the script is loading the package: `library(data.table)`
so for the script to run the package `"data.table"` needs to be installed, (run `install.packages("data.table")` if needed).

Also the script assumes that you have the folder "UCI HAR Dataset" in your working directory unziped, and without to have changed the folder and files hierarchy.
It will prompt the user with an error and will stop the script if it cannot find the required folder.
You can download the folder here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

**The script is going through the following steps:**

- Loads the data and maps the related names to the variables.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Merges the training and the test sets to create one data set.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive feature names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



**Remark:**

Unfortunately due to a recent bug on the package, the files are first loaded into dataFrames, and then transformed to dataTables. So the loading part depending on the machine might take some time.
For more info on the loading function `fread()` bug:

- <http://stackoverflow.com/questions/22344161/fread-unable-to-read-csv-files-with-first-column-empty>
- <https://r-forge.r-project.org/tracker/index.php?func=detail&aid=5413&group_id=240&atid=975>

You will get the message : "Done!" when the script finishes to run.
Finally you can check the file exported in you working directory: "tidyData.txt"


*Best Regards*

*Courserian*
