
R version 4.0.0 (2020-04-24) -- "Arbor Day"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> makeCacheMatrix <- function(x = matrix()) {   ## define the argument with default mode of "matrix"
+ ## This function creates a special "matrix" object that can cache its inverse 
+  j <- NULL    ## initialize j as NULL; will hold value of matrix inverse 
+   set <- function(y){  ## define the set function to assign new 
+   x <<- y   ## value of matrix in parent environment
+   j <<- NULL   ## if there is a new matrix, reset j to NULL
+   }
+   get <- function()x   ## define the get fucntion - returns value of the matrix argum
+   setInverse <- function(inverse) j <<- inverse   ## assigns value of j in parent environment
+   getInverse <- function() j     ## gets the value of j where called
+   list(set = set, get = get, 
+   setInverse = setInverse, 
+   getInverse = getInverse)
+ }    ## you need this in order to refer 
>      ## to the functions with the $ operator
> 
> 
> cacheSolve <- function(x, ...) {
+ ## Return a matrix that is the inverse of 'x'
+   j <- x$getInverse()
+   if(!is.null(j)){
+   message("getting cached data")
+   return(j)
+   }
+   mat <- x$get()
+   j <- solve(mat,...)
+   x$setInverse(j)
+   j
+ }
> 
