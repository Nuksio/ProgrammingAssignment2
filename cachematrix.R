## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  ##function makeCacheMatrix created and input will be x which will be matrix
  m <- NULL ##preparing value m with value NULL in a global environment
  set <- function(y) { ##creating function set with input y
    x <<- y ##cache variable x in function with value y
    m <<- NULL ##variable m in function with value NULL
  }
  get <- function() x ##creates function get() with input x
  setmx <- function(solve) m <<- solve   ##Create function to set the value of m in cache to the value of solve passed in the call to setmx
  getmx <- function() m   ## Creates function to retrieve value of m from cache.
  mxlist(set = set, get = get,
       setmx = setmx,
       getmx = getmx)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {  ##receive makeCacheMatrix as
  m <- x$getmx() ##put the value of x$getmx() from cache to local variable m
  if(!is.null(m)) { ##if m is NULL
    message("getting cached data") ##prints message
    return(m) ##prints value of m
  }
  matrix <- x$get() ##calls nested function get in x and gets the matrix from x and assign it to local variable matrix 
  m <- solve(matrix, ...) ## invertes the matrix using solve and assigns it to m
  x$setmx(m) ##calls nested function setmx in x to assign the value m to the cache environment
  m ##prints m
}
