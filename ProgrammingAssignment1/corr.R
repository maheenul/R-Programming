corr <- function(directory, threshold=0){
    
	# List of all the files in the directory
	csv.list <- list.files(path = directory, pattern = ".csv")
	
	# Initialising empty vector (length=0)
	selected.corr = c()
    

	for (i in 1:length(csv.list)){
	# Reading data and finding nobs
		data_csv <- read.csv(paste(directory, "/", csv.list[i],sep="", 
			collapse="") )
		selected.complete <- data_csv[complete.cases(data_csv),]
		nobs.complete <- nrow(selected.complete)
        

	# Computing correlation between sulfate and nitrate
		if (nobs.complete > threshold){
			selected.corr <- c(selected.corr, cor(x=selected.complete$sulfate,
				y=selected.complete$nitrate) )
		}
	# Returning cross correlation result
		selected.corr
	}
    
}