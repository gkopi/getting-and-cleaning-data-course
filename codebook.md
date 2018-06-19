#Code Book

### Source of the Data
The data - downloadable at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
was sourced via the site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Further, this data was found via the Coursera course Getting and Cleaning Data as part of the course project. 
The data in the file is spatial information relating to movement, as recorded by smartphones.
The explanation of these variables is largely based off the definitions provided in the features.txt and features_info.txt files provided with the original dataset.

### The Data
1) subject
The person who performed the activities recorded. Labeled with IDs from 1-30.
	 
2) activity

One of the activies performed while collecting the data: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS". The original dataset used numbers to refer to the activities - these more descriptive names were used instead for readability/tidyness. 
	
3 - 81) 

The means of means or standard deviations of position/movement measurements taken of the subjects while performing activities, as recorded by smartphones they wore. The variables with 'tBody' in the name refer to the body's motion through time, while those variables with 'fBody' in the name are the result of applying a fast fourier transform to the time-domain variables to get variables in the frequency domain. These values were obtained by calculating the means across subject and activity for the variables in the original dataset.

