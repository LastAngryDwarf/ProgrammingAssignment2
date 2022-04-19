make.power <- function(n) {
        z <- 25
        pow <- function(x) {
                cat("z = ", z, "\n") # "\n" is newline
                cat("n = ", n, "\n")
                x^n
        }
        pow
}
make.power(2)
a <- make.power(2) #a is now a function, pow, with n = 2
a

a(10) #this is the make.power function with n = 2 and z = 25, then assigning
# 10 to x, which results in 10^2 when pow is called.

square.function.closure <- make.power(n = 2)
square.function.closure(x = 7)
z =  25 
n =  2 


square.function.closure(x = 25)
z =  25 
n =  2 



# One more note.
# in the Global Environment (the R workspace)
# set values for z and n (that are different 
# from the values of the z and n variables 
# within the pow function closure environment)
z <- 12345
n <- 4
square.function.closure(x = 7)
z =  25 
n =  2 


# The crucial point here is that n and z are 
# variables within the pow function closure 
# and so their values there are "safe" from 
# unintentional external modification
#
# This is also an example of having variables 
# (R objects) located # in different R 
# environments while having the same name but 
# different values (and "storage locations")
# While this is perfectly "legal in R", one 
# should still be judicious about naming variables 
# in order to avoid confusion which can lead to 
# hard to find bugs

# Along these lines one might want to look at 
# the week 3 pinned posts: Formal arguments and 
# local variable names in the lexical scoping 
# assignment Part I and Part II


## example # 2
# let's say the input for the function will be 3 (x = 3)
y <- 10
#set y's value to 10 in the parent environment

#call f as a function with input x
f <- function (x) {
        y <- 2 # in (and only in) the environment of function f, y is set to 2
        
        y^2 + g(x)
        #function calls g from the parent environment
        # 2^2 + whatever you get from the function g 
        # from below, g results in x (input) * y (from parent environment)
}

#for function g, it takes the input x (same as input for f), and 
#multiplies it by y (which is taken from the parent environment, = 10)
g <- function(x) {x * y}

f(3)
#the answer is 34 2^2 + (3 * 10) = 4 + 30 = 34










