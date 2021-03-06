## Matrix Inversion using caching

## Creates a special matrix object called makeCacheMatrix that can cache its inverse

makeCacheMatrix <- function( x = matrix() ) {

	## Initialize the inverse property
    inv <- NULL

    ## Method to set the matrix
    set <- function( matrix ) {
            x <<- matrix
            inv <<- NULL
    }

    ## Method the get the matrix
    get <- function() {
    	## Return the matrix
    	x
    }

    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        inv <<- inverse
    }

    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        inv
    }

    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cacheSolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()

    ## Just return the inverse if its already set
    if( !is.null(inv) ) {
            message("getting cached data")
            return(inv)
    }

    ## Get the matrix from our object
    data <- x$get()

    ## Calculate the inverse using matrix multiplication
    inv <- solve(data) %*% data

    ## Set the inverse to the object
    x$setInverse(inv)

    ## Return the matrix
    inv
}