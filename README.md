==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Nicholas Wong
==================================================================
Adapted from:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The data taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is processed by an R script "run_analysis.R" to compute averages of all mean and standard deviation features according to subject and activity. This processed data is placed into a new data set file named "runAve.txt".

The original data is unzipped with the directory tree preserved and the top level folder, i.e. "UCI HAR Dataset" is in the same directory as the R script "run_analysis.R", before the script is run. See 'codebook.txt' for more details about the features.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Shows information about the variables used on the feature vector.

- 'run_analysis.R': The R script used for processing the original data and producing the output data set.

Note:
========

- "run_analysis.R" Requires "dplyr" library

License:
========
Original reference: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Nicholas Wong. April 2015.
