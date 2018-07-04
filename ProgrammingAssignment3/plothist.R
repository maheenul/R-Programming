## Read outcome data
outcome <- read.csv('ProgAssignment3-data/outcome-of-care-measures.csv', 
	colClasses= "character")
	
head(outcome)

##Plot histogram
hist(as.numeric(outcome[,11]))