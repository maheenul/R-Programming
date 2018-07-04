complete <- function(directory, id=1:332){
    
	# List of all the .csv files in the directory
	csv.list <- list.files(path = directory, pattern = ".csv")

	# Empty vector initialisation
	id.complete <- c() 
	nobs.complete <- c()
    
	# Extracting id and nobs from all files
	for (i in id){
		data_csv <- read.csv(paste(directory, "/", csv.list[i], sep="", collapse="") )
		selected.complete <- data_csv[complete.cases(data_csv), ]
		id.complete <- c(id.complete, i)
		nobs.complete <- c(nobs.complete, nrow(selected.complete) )
	}
	data.frame(id=id.complete, nobs=nobs.complete)
}