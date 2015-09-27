## makeCacheMatrix function creates "matrix" with a list of functions to
## set the value of the matrix - $set
## get the value of the matrix - $get
## set the value of the matrix inverse - $setinverse
## get the value of the matrix inverse - $getinverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inverse <<- solve
    getinverse <- function() inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve function returns inverse of matrix, first checking 
## if it can be taken from cache

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    inverse <- solve(x$get(), ...)
    x$setinverse(inverse)
    inverse    
}
