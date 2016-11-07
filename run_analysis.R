#### Loading of the used libraries.
## Verifies if data.table is installed and, if not, installs it, then loads it
if (!("data.table" %in% installed.packages())) {install.packages("data.table")}
library(data.table)
## Verifies if lubridate is installed and, if it is, saves the current time for later use
# if (("lubridate" %in% installed.packages())) {library(lubridate); start <- now()}

#### Tidying the raw data
## This variables will be used for all tables and are meant to save typing only
sets <- c("test", "train")
main_dir <- "./UCI HAR Dataset/"

## subjectsactivities table
# Getting the labels for the activities
activity_labels <- fread(paste0(main_dir,"activity_labels.txt"))
setkey(activity_labels)

# Adjusting the text of the labels
activity_labels$V2 <- gsub("_", " ", tolower(activity_labels$V2))

subjectsactivities <- list()

for (i in sets) {
    # Getting paths for files in the i folder
    dir <- paste0(main_dir, i, "/")
    files <- paste0(dir, list.files(dir))
    
    # Reading the respective subject, feature and activity files of the i set
    subject <- fread(files[2])
    activity <- fread(files[4])
    
    # Replacing the activity numbers by their names, as it is labeled in activity_labels
    setkey(activity)
    activity <- activity[activity_labels, nomatch = 0][, V2]
    
    # Setting up the i table for the subjecactivities list
    subjectsactivities[[i]] <- data.table(set = i,
                                          window = c(1:length(activity)),
                                          subject = subject[, V1],
                                          activity = activity)
    
    rm("dir", "files", "subject", "activity")
}

rm("i", "activity_labels")

# Binding both tables inside subjectsactivities into one
subjectsactivities <- rbind(subjectsactivities[[sets[1]]],
                            subjectsactivities[[sets[2]]])

# Writing the result table into a .csv file
#fwrite(subjectsactivities, file = "./Tidy Dataset/subjectsactivities.csv")

#rm("subjectsactivities")

## readings table

readings <- list()

for (i in sets) {
    # Getting the paths for files in the Inertial Signals folder
    dir <- paste0(main_dir, i, "/Inertial Signals/")
    files <- paste0(dir, list.files(dir))
    
    for (j in files) {
        # Reading the file
        raw_data <- fread(j)
        
        # If it is the first iteration, gets the nrow and names of raw_data, to save computation
        # raw_names needs to be obtained only once
        if (j == files[1]) {
            raw_nrow <- nrow(raw_data)
            if (i == sets[1]) {raw_names <- names(raw_data)}
        }
        
        # Setting the file_data and binding the raw_data to it
        file_data <- data.table(window = c(1:raw_nrow))
        file_data <- cbind(file_data, raw_data)
        
        rm("raw_data")
        
        # Filters and splits j, to get a list of four values containing the vector 
        # readings information: body/total, acc/gyro, x/y/z and train/test
        value_name <- gsub(paste0("(",dir,")|(.txt)"), "", j)
        value_name <- strsplit(value_name, "_")
        # Putting it all together
        value_name <- paste0(value_name[[1]][1], ## body/total
                             ifelse(value_name[[1]][2] == "acc", ## acc/gyro
                                    "acceleration",
                                    "velocity"),
                             value_name[[1]][3]) ## x/y/z
        
        # Tidying the file_data
        file_data <- melt(file_data, id.vars = "window", measure.vars = raw_names)
        names(file_data) <- c("window", "reading", value_name)
        file_data[, reading := as.integer(gsub("V", "", reading))]
        setkey(file_data)
        
        # If this is the first iteration, sets the i item on readings to be file_data, otherwise
        # add the values file_data to the existing table
        ifelse(j == files[1],
               readings[[i]] <- file_data,
               readings[[i]] <- merge(readings[[i]], file_data, all.x = T))
        
        setkey(readings[[i]])
        
        rm("file_data", "value_name")
        
    }
    
    rm("dir", "files", "raw_nrow")
    
    ## Adds a set column with value i and places it as the first column
    readings[[i]][, `:=` (set = i)]
    setcolorder(readings[[i]], c("set", names(readings[[i]])[1:11]))
}

rm("i", "j", "raw_names")

# Binding both tables inside readings into one
readings <- rbind(readings[[sets[1]]], readings[[sets[2]]])

# Writing the result table into a .csv file
#fwrite(readings, file = "./Tidy Dataset/readings.csv")

#rm("readings")

## features tables
targets <- c("mean\\(\\)", "std\\(\\)", "meanFreq\\(\\)")

# Getting the labels for the y_test/train columns
feature_labels <- fread(paste0(main_dir,"features.txt"))

features <- list()

for (i in sets) {
    # Reading the file with the features data
    file_data <- fread(paste0(main_dir, i, "/X_", i, ".txt"))
    
    # Inputting the column names
    names(file_data) <- feature_labels[, V2]
    
    # Filtering the data to get only the mean(), meanFreq() and std() variables
    file_data <- file_data[, c(grep("mean|std", names(file_data), value = T)), with = F]
    
    # Cleaning the column names
    names(file_data) <- gsub("^t", "time ", names(file_data))
    names(file_data) <- gsub("^f", "FFT ", names(file_data))
    names(file_data) <- gsub("Body", "body ", names(file_data))
    names(file_data) <- gsub("Gravity", "gravity ", names(file_data))
    names(file_data) <- gsub("Acc", "acceleration ", names(file_data))
    names(file_data) <- gsub("Gyro", "velocity ", names(file_data))
    names(file_data) <- gsub("X$", "x", names(file_data))
    names(file_data) <- gsub("Y$", "y", names(file_data))
    names(file_data) <- gsub("Z$", "z", names(file_data))
    names(file_data) <- gsub("[Jj]erk", "jerk ", names(file_data))
    names(file_data) <- gsub("Mag", "magnitude", names(file_data))
    names(file_data) <- gsub("-", "", names(file_data))
    
    
    file_data <- file_data[, `:=` (window = c(1:nrow(file_data)))]
    
    for (j in targets) {
        # Fruther filtering to get only the data needed for each iteration and cleaning even more
        # the column names
        temp_data <- file_data[, c("window", grep(j, names(file_data), value = T)), with = F]
        names(temp_data) <- gsub(j, "", names(temp_data))
        
        # Tidying the temp_data
        temp_data <- melt(temp_data, id.vars = "window")
        names(temp_data) <- c("window", "signal", j)
        
        setkey(temp_data)
        
        # If this is the first iteration, sets the i item on features to be temp_data, otherwise
        # add the values temp_data to the existing table
        ifelse(j == targets[1],
               features[[i]] <- temp_data,
               features[[i]] <- merge(features[[i]], temp_data, all.x = T))
        
        setkey(features[[i]])
        
        rm("temp_data")
    }
    
    rm("file_data")
    
    ## Adds a set column with value i and places it as the first column
    features[[i]][, `:=` (set = i)]
    setcolorder(features[[i]], c("set", names(features[[i]])[1:5]))
    names(features[[i]]) <- c("set", "window", "signal", "mean", "standarddeviation", "meanfrequency")
}

rm("j", "i", "main_dir", "targets", "feature_labels")

# Binding both tables inside features into one
features <- rbind(features[[sets[1]]], features[[sets[2]]])

# Writing the resulting table into a csv file
#fwrite(features, file = "./Tidy Dataset/features.csv")

write.table(subjectsactivities, "alltables.txt", row.names = F, append = T)
write.table(readings, "alltables.txt", row.names = F, append = T)
write.table(features, "alltables.txt", row.names = F, append = T)

#rm("sets", "features")

# Prints how much time it took to run the entire script
# if (("lubridate" %in% loadedNamespaces())) {print(now() - start); rm("start")}
