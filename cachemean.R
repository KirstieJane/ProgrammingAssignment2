cachemean <- function(x, ...) {
  
  # Use the getmean() function from the object x
  # to assign the mean to m
  m <- x$getmean()
  
  # If m is *not* NULL then you're just
  # going to use that value (and print a little
  # comment to the screen to say you're using
  # cached data)
  if(!is.null(m)) {
    message("getting cached data")
    
    # Remember that return() exists the function
    # so this next part means that you don't
    # go on to the next part of the code
    return(m)
  }
  
  # If m *is* NULL then use the get() function of
  # the x operator to get the vector data
  data <- x$get()
  
  # Now calculate the mean
  m <- mean(data, ...)
  
  # And set this value back to the x object
  x$setmean(m)
  
  # And return m (I don't like not using return 
  # explicitly - but this is apparently fine in 
  # R code)
  m

}