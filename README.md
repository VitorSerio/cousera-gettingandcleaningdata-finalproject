# Coursera - Getting and Cleaning Data - Final Project

## Objectives
This project aims to to merge the data from the dataset of the *UCI Human Activity Recognition Using Smartphones Dataset*, clean the data and make it more readable. Then, using the resulting data, all variables measuring means or standard deviations will have their means calculated and grouped by the subjects and the activities variables, generating a second, independent dataset. This dataset must follow the tidy format, defined by Hadley Wickham in his article *Tidy Data* as having the following characteristics:
* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table. 

## Files discription
* *run_analysis.R:* R script with the code for processing the dataset stored in a folder called *UCI HAR Dataset* and saving the means dataset in a file named *tidy_data.txt*.
* *CodeBook.md*: Markdown file with the descriptions of the variables, the data, and any transformations or work performed to clean up the data. 

## Raw data

The raw data is separated in two sets: "test" and "train". Both sets have equivalent files and data, with only the values being different. So the description given to one set applies to the other.
The "test" set has the following data tables with the following data:
<ul>
<li>9 tables with the values for body linear acceleration, body angular velocity and total linear acceleration on each axis (x, y and z). All inside a folder called *Inertial Signals*.</li>
<li>*y_test.txt*: has the features values, obtained by doing several different calculations with the data from the *Inertial Signals* folder.</li>
<li>*subject_test.txt*: single-column table with the id of the subject related to each window.</li>
<li>*X_test.txt*: single-column table with the code of the activity that was being performed in each window.</li>
</ul>

Besides these files, there are other two generic files (that applies to both sets), called:
<ul>
<li>*activity_labels.txt*: has the labels with the actual names for each activity number.</li>
<li>*features.txt*: heas the labels for each column in the *y_test.txt* table.</li>
</ul>

The windows are relative to each row of every table of each set. The "test" set has 2947 windows and the "train" set has 7352.

## Merging the data

Since all data tables of each set have the same amount of rows and the tables of each set are equivalent (with equivalent tables having the same number of columns), we can merge all of them by column binding the tables of each set and, then, row binding the merged tables of both sets. This will result in a single table with all the data available. To keep track of windows and set, though, it is important to add a *set* and a *window* columns to each table before merging. This columns will work as our keys and they will allow the table to be broken again into smaller ones, if needed.  
Besides merging, it is also important to make the data more readable. None of the tables of the raw data has headers, so those must be added. The headers for the features tables are in the *features.txt* file, the subjects and activities tables have only one column each and can be named manually and the 9 *Inertial Signals* tables can be named based on their files names, with some numeric indicator to tell which reading that column relates to.  
Obs: the 9 *Inertial Signals* tables all have 128 columns, because each window was composed of 128 readings.  
Then, the activity column must have it's numeric codes replaced by the actual activity names, as it is labeled in the *activity_labels.txt* file.

## Getting the tidy data

With the data merged, we can then get the tidy data we need. First, we filter the merged data to get only the columns that will be used. They are: subject, activity and any other variable that measures a mean or standard deviation.  
Now, we can easily calculate the means of the filtered variables for each activity and each subject, as it was requested.  
Finally, we can store the resulting dataset into a .txt files, which will be called *tidy_data.txt*.
