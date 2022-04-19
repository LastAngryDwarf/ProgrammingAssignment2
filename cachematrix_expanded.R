makeCacheMatrix <- function(x = numeric()) {
        m <- NULL #clear the solved matrix
        #we can reset the vector here using makeCacheMatrix$set(vector2)
        #without calling makeCacheMatrix again
        set <- function(y) {
                x <<- y  # assign y to the value x from the parent environment
                m <<- NULL # clear the cached matrix
                # whenever x is reset, m is cleared, when cacheSolve is called
        }
        get <- function() x  #R retrieves x from the parent environment
        
        #assign the input argument to the value of m in the parent
        setmatrix <- function(solve) m <<- solve
        
        
        getmatrix <- function() m #retrieve m from the parent environment
        
        #returns a list of functions that can be called via cacheSolve
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}

#when you just run makeCacheMatrix once:
m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
myMatrix_object <- makeCacheMatrix(m1)
#here's what's up

myMatrix_object$set() #does nothing, error "y" missing
myMatrix_object$set(matrix(1:4,2,2)) #allows you to change the matrix
#without calling makeCacheMatrix again.

myMatrix_object$get() 
#gets either the original input for makeCacheMatrix,
#or the new input from myMatrix_object$set

myMatrix_object$setmatrix() #argument solve missing
myMatrix_object$getmatrix() #NULL, since the matrix hasn't been solved yet

#once you run this...
m2 <- cacheSolve(myMatrix_object)
cacheSolve(myMatrix_object)

#cacheSolve uses makeCacheMatrix to either return a new solved matrix
#or a cached one
cacheSolve <- function(makeCacheMatrix_object, ...) {
        #retrieves the matrix
        m.local <- makeCacheMatrix_object$getmatrix() 
        #then it checks is m.local is null.
        #when a new vector is passed to makeCacheMatrix, it will set m to NULL
        #if there is a cached matrix, it returns the value with a message
        if(!is.null(m.local)) {
                message("getting cached data")
                return(m.local)
        }
        #gets the matrix from the original input
        data <- makeCacheMatrix_object$get()
        #solves the matrix and assigns it to m.local.calculated
        m.local.calculated <- solve(data,...)
        #sets the solved matrix in the input object
        makeCacheMatrix_object$setmatrix(m.local.calculated)
        #returns the inverse matrix to the parent environment by printing it
        m.local.calculated
        
}

## TO TEST:
# m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
# myMatrix_object <- makeCacheMatrix(m1)
# cacheSolve(myMatrix_object)

