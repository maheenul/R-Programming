best <- function(state, outcome) {
	## Reads outcome data
	outcome.complete <- read.csv('ProgAssignment3-data/outcome-of-care-measures.csv', 
		colClasses= "character")

	## Checks that the state and outcome are valid
	state.choice <- levels(factor(outcome.complete$State))
	outcome.choice <- c("heart attack","heart failure","pneumonia")

	## Error generation for invalid state or outcome
	if(!sum(as.numeric(state.choice==state) ) ) {
		stop('invalid state')

	} else if(!sum(as.numeric(outcome.choice==outcome) ) ) {
		stop('invalid outcome')

	} else {

	## Return hospital name in that state with lowest 30-day death rate

		## Optimised data selection based on state and outcome selection
		outcome.selected <- outcome.complete[(outcome.complete$State==state),
			c(2,11,17,23)[c(TRUE,outcome.choice==outcome) ] ]
		outcome.selected <- outcome.selected[!is.na(as.numeric(outcome.selected[,2] ) ), ]
		
		## Data arranged alphabetically according to Hospital's name to handle ties
		outcome.ordered <- outcome.selected[order(outcome.selected$Hospital.Name), ]

		## Best hospital selected from alphabetically arranged data
		outcome.ordered <- outcome.ordered[which.min(outcome.ordered[,2] ), ]

		## Output Hospital's name to the screen
		outcome.ordered[,1]
		
	}

}