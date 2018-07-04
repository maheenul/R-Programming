rankall <- function(outcome, num = "best") {
	## Read outcome data
	outcome.complete <- read.csv('ProgAssignment3-data/outcome-of-care-measures.csv', 
		colClasses= "character")

	## Check that the outcome is valid
	outcome.choice <- c("heart attack","heart failure","pneumonia")

	## Error generation for invalid outcome
	if (!sum(as.numeric(outcome.choice==outcome) ) ) {
		stop('invalid outcome')
	}else{
		
	## For each state, find the hospital of the given rank

		## Optimised data selection based on state and outcome selection
		outcome.selected <- outcome.complete[, c(2,7,11,17,23)
			[c(TRUE,TRUE,outcome.choice==outcome) ] ]
		outcome.selected <- outcome.selected[!is.na(as.numeric(outcome.selected[,3] ) ), ]

		## Data arranged alphabetically according to Hospital's name to handle ties
		outcome.ordered <- outcome.selected[order(outcome.selected$Hospital.Name), ]
	
		## Data arranged numerically according to mortality rate
		outcome.ordered <- outcome.ordered[order(as.numeric(outcome.ordered[,3] ) ), ]

		## Data arranged numerically according to state name
		outcome.ordered <- outcome.ordered[order(outcome.ordered[,2] ), ]
		
		## Calculating and appending rank matrix
		outcome.rank <- matrix(1:nrow(outcome.ordered), nrow=nrow(outcome.ordered), ncol=1)
		outcome.ordered <- cbind(outcome.ordered,outcome.rank)

		## Assigning column names and renaming columns
		colnames(outcome.ordered)[1] <- "hospital"
		colnames(outcome.ordered)[2] <- "state"
		colnames(outcome.ordered)[3] <- "rate"
		colnames(outcome.ordered)[4] <- "rank"


		## Return a data frame with the hospital names and the (abbreviated) state name	
		
		## Creating a list of all the states
		outcome.statelist <- unique(outcome.ordered$state)

		## Initialising variable to store all the ranks
		outcome.rankall <- matrix(nrow=0, ncol=4)

		for (i in seq_along(outcome.statelist) ) {
			temporary.state <- outcome.ordered[(outcome.ordered$state==outcome.statelist
				[i] ), ]
			
			# If "best" is entered
			if (num=="best") {
				outcome.rankall <- rbind(outcome.rankall,temporary.state[1,] )
		
			# If "worst" is entered
			} else if (num=="worst") {
				outcome.rankall <- rbind(outcome.rankall,temporary.state
					[nrow(temporary.state), ] )
		
			# Is a valid num number is entered
			} else if (is.numeric(num) & (num <= nrow(temporary.state) ) ) {
				outcome.rankall <- rbind(outcome.rankall,temporary.state[num,])
			
			# If num is greater than the number of hospitals
			} else if (is.numeric(num) & (num > nrow(temporary.state) ) ) {
				temporary.state[1,] <- c(NA,temporary.state[1,2],NA,NA)
				outcome.rankall <- rbind(outcome.rankall,temporary.state[1,] )
				
			}
		
		}
		outcome.rankall[,1:2]
	}
		
}







		
		
		
		

