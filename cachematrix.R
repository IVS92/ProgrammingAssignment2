## These two functions together will create a special "matrix" object that 
##can cache it's inverse


## The first function named makeCacheMatrix will create a special "matrix"
## object that is able to cache its inverse,
## which is really a list containing a function to:
## 1)set the value of the matrix (set) 
## 2)get the value of the matrix (get) 
## 3)set the value of the inverse (setinverse) 
## 4)get the value of the inverse (getinverse) 



makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL
set <- function(y) {
  x <<- y
  inverse <<- null
  }
get <- function() x
setinverse <- function(solve) inverse <<- solve
getinverse <- function() inverse
list (set = set, get = get, 
      setinverse = setinverse, 
      getinverse = getinverse)
}



## This function computes a matrix that is the inverse of the 
## special "matrix" which is returned by makeCacheMatrix. 
## If the inverse has already been caclutated (and the matrix
## has not been changed) cachesolve will retrieve 
## the inverse from the cache

cacheSolve <- function(x, ...) {
  inverse <-x$getinverse()
  if(!is.null(inverse)) {
          message ("getting cached data")
          return(inverse)
}
data <- x$get()
inverse <- solve(data, ...)
x$setinverse(inverse)
inverse
}
