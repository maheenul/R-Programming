pollutantmean <- function(directory, pollutant, id=1:332){
    
	# List of all the files in the directory
	csv.list <-list.files(path = directory, pattern = ".csv")
    
	# Initialising empty variable 
	pollutant.sum <- 0;
	pollutant.length <- 0;
    
	for (i in id){
	# Reading data and extracting all pollutant data 
		data_csv <- read.csv(paste(directory, "/", csv.list[i], sep="", 
			collapse="") )
		pollutant.selected <- data_csv[pollutant]
		pollutant.selected <- pollutant.selected[!is.na(pollutant.selected) ]

	# Calculating sum and length for each file
		pollutant.sum <- pollutant.sum + sum(pollutant.selected)
		pollutant.length <- pollutant.length + length(pollutant.selected)
	}

	# Displaying and calculating mean from sum and length.
	pollutant.mean <- pollutant.sum/pollutant.length
	pollutant.mean
}