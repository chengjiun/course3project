## Course project:  Getting and Cleaning Data 
## Introduction:

  The project load the experiement data measured using Samsung Galaxy SII of 30 volunteers. I basically clean the dataset, and write out the average value of the mean and standard deviation of the measurements. The data is downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and the description of the data can be found in the README.txt file of the package. 
  
## R script

  run_analysis.R is generated for this project. It needs to be run at the directory with the data, 'UCI HAR Dataset/'. 
  Basically, the code follows the instruction of the assignment that
  * load the data set including the label of the measurement features, the label of activities, the testing data, and the trainning data. 
  * the testing and trainning data are merged into the mergedData, along with their activities and subject id tables ( mergedAct, and mergedSub)
  * extract the mean and standard deviation measurements from the data, called cutmergedData with 66 variables
  * matched the label of activities in the id of activities in mergedAct, and group the cutmergedData according to the subject id and activities. The activities and subjectId are added to the table for reference. 
  * use aggregate to calculate the average of all variables within each group (each subject and activity), and the result is stored in the data.frame meanMeasures. 
  * write meanMeasures out to the file "meanMeasures.csv"

## Code Table of the measurement features in the output

  I didn't modify the column names of the original data much, so that they can be easilly traced back to the original data set given that the original names are already well self-explained. The detail of the name convention can be found in the features_info.txt of the data package. Here, I list some quick instructions.
  * The variable names are formated in camel case convention, instead of the horrible lower-case convention suggested in the course. I took out the redaudant dot sign.  
  * the variable names are structured as tBodyAccOpt.measure.crd
  * 	t: is either 't' or 'f', which indicates the measurements are in 'time' or 'frequency' domain. the 'frequency' domain data is calculated using the fourier transform from the raw measurements. 
  * 	Body: is either 'Gravity' or 'Body', which indicates that the values measure the acceleration of the Gravity or the body of the volunteer only.
  * 	Acc: is either 'Gyro', 'Acc', which indicates either angular or linear acclerations respectively
  * 	Opt: is an optional flag and can be "Jerk", "Mag", or "JerkMag", which indicates the method used to preprocesse the data. The detail should be found in the features_info.txt.  
  * 	measure: is either "mean" or "std", indicates the measurements are either the mean or the standard deviation of the raw measurements.
  * 	crd: the three coordinate axis, "X", "Y", or "Z". If the normalized mag is calculated, indicated by opr="Mag", crd is empty. 
  
  

