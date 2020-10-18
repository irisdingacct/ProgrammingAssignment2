## Put comments here that give an overall description of what your
## functions do

##m1 with simple matrix inverse A
m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow =2, ncol = 2)
m1

##Creating matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
          m <- NULL
          set <- function(y) {
                    x <<- y
                    m <<- NULL
          }
          get <- function() x
          setinverse <- function(inverse) m <<- inverse
          getinverse <- function() m
          list(set = set, 
               get = get,
               setinverse = setinverse, 
               getinverse = getinverse)
          
}

## Computes the inverse of the special matrix , if the inverse has already been calculated, retrieve from cache
cacheSolve <- function(x, ...) {
          m <- x$getinverse()
          if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
          }
          data <- x$get()
          m <- solve(data, ...)
          x$setinverse(m)
          m
          ## Return a matrix that is the inverse of 'x'
}

m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow =2, ncol = 2)

A <- makeCacheMatrix(m1)


##Calculate Inverse
cacheSolve(A)
##Getting cached data
cacheSolve(A)

