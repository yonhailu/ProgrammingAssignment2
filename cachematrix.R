
## (using the exact coding given in the example) the function below (makeCacheMatrix) creates a list 
## that creates set the value of the vector, get the value of the vector
## set the value of the inverse
## get the value of the inverse 

makeCacheMatrix <- function(x = matrix()) { n <- NULL
set <- function(y) {
  x <<- y
  n <<- NULL
}
get <- function() x
setinverse <- function(inverse) n <<- inverse
getinverse <- function() n
list(set=set, get=get, 
     setinverse=setinverse, 
     getinverse=getinverse)

}


## Given that the above function is proporly written, 
## the following function could skip the computation and retrive the inverse  matrix. 
## In doing so, it first checks if the inverse function is properly computed.  
## If not, it will set the inversein the cache solve. It also assumes invertability.
  

cacheSolve <- function(x, ...) {
  n <- x$getinverse()
  if(!is.null(n)) {
    message("getting cached data.")
    return(n)
  }
  data <- x$get()
  n <- solve(data)
  x$setinverse(n)
  n
}
