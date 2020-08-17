FINAL PROJECT:
## Put comments here that give an overall description of what your

## Descrptiom: This function creates a special "matrix" object that can cache its inverse. The steps are the next:

makeCacheMatrix <- function(x = matrix()){  ## We are defining the argument 
  inv <- NULL                               ## We initialize inv as NULL; will and mantain the value of matrix inverse 
  set <- function(y) {                      ## We create the function set to assign new value of the matrix
    x <<- y                                 
    inv <<- NULL                            ## In case We have a new matrix, reset inv to NULL
  }
  get <- function() x                       ## Finally, we define the get fucntion - returns value of the matrix argument
}


setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
getinverse <- function() inv                     ## gets the value of inv where called
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 


## to the functions with the $ ope
## Write a short comment describing this function


### This function computes the inverse of the special "matrix" returned by makeCacheMatrix above and cacheSolve will retrieve the inverse from the cache, in case
### the inverse have being calculated.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()                               ## With this, we return a matrix that is the inverse of 'x'
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
