makeVector <- function(x = numeric()) {
  # input x will be a vector
  
  # m will be our "mean" and it is reset to NULL
  # every time makeVector is called
  m <- NULL
  
  # These next three functions are defined but not run when
  # makeVector is called.
  # Rather, they will be used by cachemean() to get values
  # for x or for m (mean) and for setting the mean.
  # These are usually called object 'methods'
  
  get <- function() {
    # get very simply "gets" x - the original value
    # of the vector
    x
  }
  
  set <- function(y) {
    # set "sets" the input vector
    # (note that it can be in a different enviroment)
    # and then re-sets the mean to NULL
    x <<- y
    m <<- NULL
  }
  
  setmean <- function(mean) {
    # setmean is called by cachemean() during the 
    # first cachemean() access and it will store the value
    # using superassignment (the <<- operator which assigns
    # a value to )
    m <<- mean
  }
  
  getmean <- function() {
    # getmean returns the cached value to cachemean()
    # on subsequent access
    m
  }
  
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}