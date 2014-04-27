# gcdata
------

**This repository includes two files:**

- The CodeBook for the Data Set.
- The script that contains all the steps of the analysis performed on the Raw data.

To run the script you can use `source("run_analysis.R")` if you have the file on your working directory.
Alternatively use `source(path)`, were `path` is the path were the file `"run_analysis.R"` resides.

The script is using the package `"data.table"`.
The first line of the script is loading the package: `library(data.table)`
so for the script to run the package `"data.table"` needs to be installed, (run `install.packages("data.table")` if needed).

Unfortunately due to a recent bug on the package, the files are first loaded into dataFrames, and then transformed to dataTables. So the loading part depending on the machine might take some time.
For more info on the loading function `fread()` bug:

<http://stackoverflow.com/questions/22344161/fread-unable-to-read-csv-files-with-first-column-empty>
<https://r-forge.r-project.org/tracker/index.php?func=detail&aid=5413&group_id=240&atid=975>

You will get the message : "Done!" when the script finishes to run.
Finally you can check the filed exported in you working directory: "tidyData.txt"


*Best Regards*

*Courserian*