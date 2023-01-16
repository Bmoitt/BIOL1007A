###### Programming in R
##### 12 January 2023
##### BM

## lets start with basic

## assignment operaator: used to assign a new value to a variable

x <- 5
print (x)
x

y = 4 # legal but not used except in function arguements

print (y)
y = y + 1.1

y <- y + 1.1

Z <- 3 # single letter variables
# they are fine if you just wanna see something or something is simple
plantheight <- 10 #camel case format
plant_height <- 3.3 # snake case format # a proffered mode
plant.height <- 4.2
. <- 5.5 #reserve for temporary variable


## Functions: what is a function
## function is a piece of code or blacks of code that usually perform a task: u can use short command over again instead of writing out black code multiple times

# you can create your own function

square <-  function(x = NULL){
  x <- x^2
  Print (x)
  }

z<-103
square(x = z) # the argument name is x. 

### or there are built in functions

sum(109, 3, 10) # look at package info using  ?sum or going to panel
## rose and columsn are 2-D: 2D= data frames and are apart of the matrxi

### Atomic Vectors
## vectors are 1-D: its pretty much like a ro thats buy itself

## 1 dimention would be a list or atomic vectory

#Types of vectors:
 # character springs (usually iwithin groups
# INTEGETS ) WJHOLE NUMBERS
#c-function ( combine
             
#  Print ()
  #class ()=
  ##typeof (&x0 # tg=g
                       
  ##is.numerica (z) #retirneders 1-2
                       
## character vectors
z <- c("perch", "bass", "trout")
print (z)
z <- c("this is only 'one' character string", "a second", 'a third')
print (z)
typeof(z)
is.character(z) #is. function tests whether it is a certain data type

#also called (Boolean), all quotes, all caps: True or false
# this mkaes tehm logical cause there are only 2 options
##^
z<-c(True, False, T, F) # as. function coerces data
z <- as.character(z)
is.logical(z)

#funtions we just learned
  ## type
  ## is.numeric / as.charcter
  ## typeof()
#length
Length(z)
dim(z) # would only say null in this instance because it only has vectors and that is 1D


#if some functions are confusing you can go to the help section and it will explain what the function do

##Names
z <-runif(5)
#runif gives random numbers between 0 and 1, in this case we requested 5 random numbers between 0 and 1 and then we named them below

names(z) # no names

#add names
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")
print(z)             
names (z)

#if we wanted to reset names we can type names(z) <- NULL
names(z) <- NULL
names(z)

### NA   this stands for missing data
# lets say we have a vector with missing bits of info, in that area is wil have an NA in areas wherew we are msing values

z<- c(3.2, 3.5, NA)
typeof(z)
sum(z)

#how to check for NA's
anyNA(z)
is.na(z)

which(is.na(z))
# which gives us the specific index//function which area has the NA. It is helpful for exploring data

##Subsetting vectors
# if you only want specific parts of a vector to show, you can subset it. Vectors are indexed so they are given a value of 1,2,3,... depending on the order they come in
z <- c(3.1, 9.2, 1.3, 0.4, 7.5) 
z[4] 
#use square brackets to subset by index
z[c(4,5)] # this is for when you want multiple indexes, you have to use c
z[-c(2,3)]# minus signed to exclude elements
z[-1]
z[z==7.5]
z[z==3.4]# use double equals for exact match
z[z<7.5] # use logical statements within square brackets to subset by conditions

#using the function which
z[which(z < 7.5)] # which only outputs indices; within [] it subsets those values

# creating logical vectors
z<7.5

## subsetting characters (named elements)
names(z) <- c("a", "b", "c", "d", "e")
z[c("a","d")]

# subset
subset(x=z, subset= z>1.5)

#randomly sample
#sample function
story_vec <- c("A", "Frog", "Jumped", "Here")
sample(story_vec)

#if you wanted to ramdonly slelect threee elements
sample(story_vec, size=3)

story_vec <- c(story_vec[1], "Green", story_vec[2:4])

story_vec
story_vec[2] <- "Blue"
story_vec

# vectory function
vec <- vector(mode = "numeric", length=5)

### rep and sec function
z <- rep(x=0, times= 100)
z <- rep(x=1:4, each =3)

z<- seq(from = 2, to=4)
z
seq(from= 2, to=4, by=0.5)

z<- runif (5)
seq(from=1, to=length (z))
