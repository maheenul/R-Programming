rankhospital <- function(state, outcome, num = "best") {
	## Read outcome data
	outcome.complete <- read.csv('ProgAssignment3-data/outcome-of-care-measures.csv', 
		colClasses= "character")


	## Checks that the state and outcome are valid
	state.choice <- levels(factor(outcome.complete$State))
	outcome.choice <- c("heart attack","heart failure","pneumonia")

	## Error generation for invalid state or outcome
	if (!sum(as.numeric(state.choice==state) ) ) {
		stop('invalid state')
	
	}else if (!sum(as.numeric(outcome.choice==outcome))){
		stop('invalid outcome')

	}else{

	## Return hospital name in that state with the given rank

		## Optimised data selection based on state and outcome selection
		outcome.selected <- outcome.complete[(outcome.complete$State==state),
		c(2,11,17,23)[c(TRUE,outcome.choice==outcome) ] ]
		outcome.selected <- outcome.selected[!is.na(as.numeric(outcome.selected[,2] ) ), ]
		
		## If num is greater than the number of hospitals
		if (is.numeric(num) & (num>nrow(outcome.selected) ) ) {
		return(NA)
		}

		## Data arranged alphabetically according to Hospital's name to handle ties
		outcome.ordered <- outcome.selected[order(outcome.selected$Hospital.Name), ]

		## Data arranged numerically according to mortality rate
		outcome.ordered <- outcome.ordered[order(as.numeric(outcome.ordered[,2] ) ), ]
		
		## Calculating and appending rank matrix and renaming columns
		outcome.rank <- matrix(1:nrow(outcome.ordered), nrow=nrow(outcome.ordered), ncol=1)
		outcome.ordered <- cbind(outcome.ordered,outcome.rank)
		colnames(outcome.ordered)[2] <- "Rate"
		colnames(outcome.ordered)[3] <- "Rank"
		

		## Return hospital name in that state with the given rank

		# If "best" is entered
		if (num=="best"){
			outcome.ordered <- outcome.ordered[1,]
		
		# If "worst" is entered
		} else if (num=="worst"){
			outcome.ordered <- outcome.ordered[nrow(outcome.ordered),]
		
		# Is a valid num number is entered
		} else if (is.numeric(num)&(num <= nrow(outcome.selected) ) ) {
			outcome.ordered <- outcome.ordered[1:num,]
		}

		## 30-day death rate
		outcome.ordered
		
	}

}