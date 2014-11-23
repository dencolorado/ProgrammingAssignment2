## Put comments here that give an overall description of what your
## functions do

## The first function, makeCacheMatrix, creates a list containing a function to 
## 1. set and get the value of a matrix and 
## 2. set and get the value of the inverse matrix

## The function, cacheSolve, calculates the inverse of the "matrix" created with the function above. 

##
makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## The function, cacheSolve, calculates the inverse of the "matrix" created with the function above. 
## If the inverse matrix already has been calculated, the function gets the inverse from the cache. 
## Otherwise it calculated the mean using the setsolve function from makeCacheMatrix.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
