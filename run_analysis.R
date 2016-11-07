#### Checking if files are present
## If there is no UCI HAR Dataset directory present, tries to download the zipped files and unzips
## them
if (!dir.exists("./UCI HAR Dataset/")) {
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    base <- basename(fileurl)
    download.file(url, base, method = "auto")
    unzip(base)
    rm("fileurl", "base")
}

#### Loading of the used libraries.
## Verifies if data.table is installed and, if not, installs it, then loads it
if (!("data.table" %in% installed.packages())) {install.packages("data.table")}
library(data.table)

#### Tidying the raw data
## This variables are meant to save typing, avoiding typing errors
sets <- c("test", "train")
main_dir <- "./UCI HAR Dataset/"

## Getting Subjects and Activities data
# Getting the labels for the activities
activity_labels <- fread(paste0(main_dir,"activity_labels.txt"))

# Getting the labels for the features, for later use
feature_labels <- fread(paste0(main_dir,"features.txt"))

# Adjusting the text of the labels
activity_labels$V2 <- gsub("_", " ", tolower(activity_labels$V2))

data_set <- list()

for (i in sets) {
    # Getting paths for files in the i folder
    dir <- paste0(main_dir, i, "/")
    files <- paste0(dir, list.files(dir))
    
    # Reading the respective subject and activity files of the i set
    subject <- fread(files[2])[, V1]
    activity <- fread(files[4])
    
    # Replaces the activity numbers by their names, as t is labeled in activity_labels
    activity <- activity[, V1 := activity_labels[activity[, V1], V2]][, V1]
    
    # Getting the length of activity as this value will be used later several times
    n <- length(activity)
    
    # Setting up the i table for the data_set list and keys it
    data_set[[i]] <- data.table(set = i,
                                window = c(1:n),
                                subject = subject,
                                activity = activity)
    rm("subject", "activity")
    
    ## Getting the Inertial Signals data
    # Getting the paths for files in the Inertial Signals folder
    dir <- paste0(main_dir, i, "/Inertial Signals/")
    files <- paste0(dir, list.files(dir))
    
    for (j in files) {
        # Reading the file
        file_data <- fread(j)
        
        # Labels the columns of file_data with the file name (without directory and extension),
        # while also removing the test/train, as it won't be necessary, attached to the V1:V128
        file_name <- gsub(paste0("(",dir,")|(.txt)|_",i), "", j)
        names(file_data) <- paste0(file_name, names(file_data))
        
        # Adds the set and window columns, puts them as the first columns and keys the table
        file_data <- file_data[, `:=` (set = i, window = c(1:n))]
        setcolorder(file_data, c("set", "window", names(file_data)[1:128]))
        
        # Merges file_data to the i data.table in data_set
        data_set[[i]] <- data_set[[i]][file_data, on= c("set", "window")]
    }
    
    ## Getting the Features data
    # Reading the file with the features data
    file_data <- fread(paste0(main_dir, i, "/X_", i, ".txt"))
    
    # Inputting the column names
    names(file_data) <- feature_labels[, V2]
    
    # Adds the set and window columns, puts them as the first columns
    file_data <- file_data[, `:=` (set = i, window = c(1:n))]
    
    # Merges file_data to the i data.table in data_set
    data_set[[i]] <- data_set[[i]][file_data, on= c("set", "window")]
}
rm("file_data", "i", "j", "file_name", "n", "main_dir", "dir", "files", "activity_labels")

# Binding the two data.tables inside data_set into one
data_set <- rbind(data_set[[sets[1]]], data_set[[sets[2]]])
rm("sets")

# Getting the subject and activity columns together with all the other columns of mean and standard
# deviations measurements
tidy_data <- data_set[, c("subject", "activity",
                          grep("mean|std", feature_labels[, V2], value = T)),
                      with = F]
rm("feature_labels")

# Cleaning the column names
names(tidy_data) <- gsub("^t", "time_", names(tidy_data))
names(tidy_data) <- gsub("^f", "FFT_", names(tidy_data))
names(tidy_data) <- gsub("Body", "body_", names(tidy_data))
names(tidy_data) <- gsub("Gravity", "gravity_", names(tidy_data))
names(tidy_data) <- gsub("Acc", "acceleration_", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "velocity_", names(tidy_data))
names(tidy_data) <- gsub("X$", "_x", names(tidy_data))
names(tidy_data) <- gsub("Y$", "_y", names(tidy_data))
names(tidy_data) <- gsub("Z$", "_z", names(tidy_data))
names(tidy_data) <- gsub("[Jj]erk", "jerk_", names(tidy_data))
names(tidy_data) <- gsub("Mag", "magnitude_", names(tidy_data))
names(tidy_data) <- gsub("-|\\(|\\)", "", names(tidy_data))

# Calcutlation of the mean for each variable grouped by subject and activity
tidy_data <- tidy_data[, lapply(.SD, mean), by = .(subject, activity)]

# Addin a "_mean" string at the end of the names of the variables that had their means calculated
names(tidy_data)[3:length(names(tidy_data))] <-
    paste0(names(tidy_data)[3:length(names(tidy_data))],
           "_mean")

# Writing the tidy_data into a txt file
# If the data.table package version is 1.9.7, it will use the fwrite function, otherwise, uses the
# write.table function
# Note: data.table package version is 1.9.7 as of this date (2016-11-7) is still under development
if (packageVersion("data.table") == as.package_version("1.9.7")) {
    fwrite(tidy_data, "tidy_data.txt", row.names = F)
} else {write.table(tidy_data, "tidy_data.txt", row.names = F)}