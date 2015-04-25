## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  ##function makeCacheMatrix created and input will be x which will be matrix
  m <- NULL ##preparing value m with value NULL in a global environment
  set <- function(y) { ##creating function set with input y
    x <<- y ##variable x in function with value y, not in global environment 
    m <<- NULL ##variable m in function with value NULL, not in global environment
  }
  get <- function() x ##creates function get() with input x
  setmx <- function(solve) m <<- solve
  getmx <- function() m  ##creates function getmx() with input m
  mxlist(set = set, get = get,
       setmx = setmx,
       getmx = getmx)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getmx()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmx(m)
  m
}
