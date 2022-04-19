makeCacheMatrix <- function(matrix = matrix()) {
        inverse = NULL
        
        set <- function(y) {
                matrix <<- y
                inverse <<- NULL
        }
        
        get <- function() matrix
        
        setinverse <- function( inv ) inverse <<- inv
        
        getinverse <- function() inverse
        
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve: this function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated then 
## cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function( makeCacheMatrix, ...) {
        inv <- makeCacheMatrix$getinverse()
        
        if(!is.null(inv) ) {
                message("getting cached data")
                return(inv)
        }else{
                message("NOT getting cached data")
        }
        
        inv <- solve(makeCacheMatrix$get(), ...)
        makeCacheMatrix$setinverse(inv)
        inv
}
m1 <- matrix(1:4,2,2)

mm2 <- makeCacheMatrix(matrix(1:4,nrow =2,ncol = 2))
cacheSolve(mm2)

cacheSolve(makeCacheMatrix(matrix(1:4, nrow = 2, ncol=2)))
solved

