run_analysis <- function() {
	library(dplyr)
	
	# Load features to use later as the column names
	feats <- read.table(file.path("UCI HAR Dataset", "features.txt"), stringsAsFactors = F)
	# Load raw x
	x_train <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"), col.names = feats[,2], colClasses = rep("numeric", nrow(feats)))
	x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt", col.names = feats[,2], colClasses = rep("numeric", nrow(feats)))
	
	##############################################################################
	# 1. Merge x_train and x_test
		x_combined <- rbind(x_train, x_test)
	
	##############################################################################
	# 2. Extract only the measurements on the mean and standard deviation for each measurement.
		x_extracted <- x_combined[,grep("\\.std\\.|\\.mean\\.", colnames(x_combined))]
	
	##############################################################################
	# 3. Use descriptive activity names to name the activities in the data set.
		# Load raw y
		y_train <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"))
		y_test <- read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"))
		
		# Merge y_train and y_test
		y_merged <- rbind(y_train, y_test)
	
		# Get the labels from activity_labels.txt
		labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"), stringsAsFactors = F)
		# Replace the numeric values with the corresponding labels.
		y_merged[,1] <- as.character(factor(y_merged[,1], labels = labels[,2]))
		
		# Bind the corresponding activities as a column to the extracted data.
		x_extracted$Activity <- y_merged[,1]
	################################################################################
	
	##############################################################################
	# 4. Appropriately label the data set with descriptive variable names.
	colnames(x_extracted) <- colnames(x_extracted) %>% gsub("^f", "FreqDomain", .) %>% # For each column name, replace the first letter "f" with FreqDomain
		gsub("^t", "TimeDomain", .) %>% # Replace the first letter "t" with TimeDomain
		gsub("\\.\\.X$", "X-axis", .) %>% # Replace "..X" in the end with X-axis
		gsub("\\.\\.Y$", "Y-axis", .) %>% # Replace "..Y" in the end with Y-axis
		gsub("\\.\\.Z$", "Z-axis", .) %>% # Replace "..Z" in the end with Z-axis
		gsub("Acc", "Acceleration", .) %>% # Replace "Acc" with "Acceleration"
		gsub("Mag", "Magnitude", .) %>% # Replace "Mag" with "Magnitude"
		gsub("BodyBody", "Body", .) %>% # Replace "BodyBody" with "Body"
		gsub("\\.\\.$", "", .) # Remove ".." in the end
	##############################################################################
	
	# Load and merge the training and test subjects.
	subj_train <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"))
	subj_test <- read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"))
	subj <- rbind(subj_train, subj_test)
	
	# Bind the corresponding subjects as a column to the extracted data.
	x_extracted$Subject <- subj[,1]
	
	##############################################################################
	# 5. From x_extracted create a second, independent tidy data set with the average of each variable for 
	# each activity and each subject
		# Here the key variables subject and activity. Remove the information about magnitudes because 
		# they can be acquired from non-key variables, hence violate 3rd normal form.
		# Magnitudes can be acquired using the x, y and z components of each measurement type.
		varnames <- colnames(x_extracted)
		magnitude_vars <- varnames %>% grep("Magnitude", .)
		drops <- varnames[magnitude_vars]

		x_extracted[, !(varnames %in% drops)] %>% group_by(Subject, Activity) %>% 
		summarise_each(funs(mean(., na.rm = TRUE)))
}