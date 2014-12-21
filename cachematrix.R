## These two commands work together to either invert
## a matrix, or simply find the cached value for the
## inverse if it already exists

# makeCacheMatrix creates a few functions for a particular
# matrix (x)
makeCacheMatrix <- function(x = matrix()) {
        # input x will be a matix

        # inv will be the inverse of the matrix
        # and it is reset to NULL
        # every time makeCacheMatrix is called
        inv <- NULL

        get <- function() {
                # get very simply "gets" x - the original value
                # of the matrix

                # You don't need to type return() explicitly
                # but I find the code much easier this way!
                return(x)
        }

        # These next three functions are defined but not run when
        # makeCacheMatrix is called.
        #
        # Rather, they will be used by cachesolve() to get values
        # for the matrix x or for inv (the inverse of x) and
        # for calculating that inverse if it is not in the cache.
        #
        # These are usually called object 'methods'

        set <- function(y) {
                # set "sets" the input matrix
                # (note that it can be in a different enviroment
                # becuase we've used the <<- operator)
                # and then re-sets the inverse to NULL
                x <<- y
                inv <<- NULL
        }

        setInv <- function(inverse) {
                # setmean is called by cachemean() during the
                # first cachemean() access and it will store the value
                # using superassignment (the <<- operator which assigns
                # a value to )
                inv <<- inverse
        }

        getInv <- function() {
                # getInv returns the cached value to cachesolve()
                # on subsequent access
                return(inv)
        }


    # Remember that you don't have to type return explicitly
    # - it's simply whatever is last created that will be
    # returned
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}


## Cache solve returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {

        # Use the getinv() function from the object x
        # to assign the mean to m
        inv <- x$getInv()

        # If inv is *not* NULL then you're just
        # going to use that value (and print a little
        # comment to the screen to say you're using
        # cached data)
        if(!is.null(inv)) {
                message("getting cached data")

                # Remember that return() exists the function
                # so this next part means that you don't
                # go on to the next part of the code
                return(inv)
        }

        # If inv *is* NULL then use the get() function of
        # the x operator to get the matrix data
        data <- x$get()

        # Now solve the inverse of the matrix
        inv <- solve(data, ...)

        # And set this value back to the x object
        x$setInv(inv)

        # And return inv
        return(inv)

}
