## A pair of functions which can cache the 
## inverse of a square matrix

## Function creates a special matrix and also
## caches it's the matrix and it's inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    ## Initialise the inverse variable
    m <- NULL
    
    ## Method to set the special matrix
    setmatrix <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    ## Method to retrieve the special matrix
    getmatrix <- function() x
    
    ## Method to set the inverse of the special 
    ## matrix
    setinverse <- function(matrix) m <<- matrix
    
    ## Method to retrieve the inverse of the 
    ## special matrix
    getinverse <- function() m
    
    ## Returns a list of all the methods
    list(setmatrix = setmatrix,
    getmatrix = getmatrix, 
    setinverse = setinverse,
    getinverse = getinverse)
}


## This function retrieves the cache of the matrix
## and its inverse when the inverse cache is 
## available otherwise it computes the inverse for
## the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    
    ## If the inverse cache is available it extracts
    ## the cache
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    ## If the inverse cache is not available it 
    ## calculates the inverse
    data <- x$getmatrix()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

