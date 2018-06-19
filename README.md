# getting-and-cleaning-data-course
This repo contains the code for the course project for the getting and cleaning data course on Coursera.

There are 4 files, the codebook, this README, output.txt, and run_analysis.R.

### run_analysis.R
Contains the code that actually performs data manipulation
The steps performed in the analysis file are outlined in comments in the file itself, but the general steps are:
1) Loading the data and merging it into one data frame
2) Reformatting and transforming the data - some variables were left out, some were renamed, and many of the new variables were the result of applying the mean() function across old variables.
3) Writing the data frame created at the end of step 2 to an output file.

### output.txt 
Contains the output of run_analysis - the data frame created at the end of the program.

### codebook.MD
Contains a description of the variables, and where the data came from.
