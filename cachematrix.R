## Below are two functions that are used to create a special object that stores 
## a matrix and caches its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is actually 
## a list containing a function to:

## set value of matrix, set the inverse matrix and
## get the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setmean,
       getsolve = getsolve)
}


##The following function calculates the inverse of the special "matrix" created 
## with the previous function. However, first check if the inverse has already
## been calculated. If so, it gets the inverse from the cache and skips the 
## calculation. Otherwise, calculates the inverse of the data and sets the value 
## of the inverse in the cache using the setsolve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$geatsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}



