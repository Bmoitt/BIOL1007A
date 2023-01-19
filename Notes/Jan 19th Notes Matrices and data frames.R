###### Finishing up Matrices and Data Frames
###### 19 Jan 2023
###### BM

m <-  matrix(data = 1:12, nrow=3)

## subsetting based on elements
m[1:2, ] 
m[, 3:4]
## subset with logical (conditional) statements
## select all comlums for which the totals are >15


colSums(m) >15
m[, colSums(m) >15]

## row sums now
## select rows that sum up to 22
m[rowSums(m)==22,]

##EVERYTHING THAT DOES NOT EQUAL 22
m[rowSums(m)!=22,]

### logical operators: == ! = > <

## subsetting to a vector changes the data type

z <- m[1,]
print(z)
str(z)

### if we wanted to keep it as a matrix and not its own vector
z2<- m[1, , drop=FALSE]
z2

#simulate new matrix
m2 <- matrix(data = runif(9), nrow=3)
m2

## ise assignment operator to substitute values 
m2[m2 < 0.6] <- NA
m2

data <- iris
head(data) # first 5 columns
tail(data) # last 6 column of data
data[3,2]
dataSub <- data[,c("Species", "Petal.Length")]
str(dataSub)

### sort a data by values
orderedIris <- iris[order(iris$Petal.Length),]
head(orderedIris)

###### Function in R!!

# everything in R is a function
sum(3,2) # sum
3 + 2 # + sign is a function 
sd # if you just run the name of a function, you can see the code of the function and it will tell you how to use it or whats missing

### user-defined functions
#functionName <- function(argX=defaultX, argY=defaultY){}
  ## curly bracket starts the body of the function: you can put lines of code or notes
    ## you can create local variables (only visible to R within the function)
    ### return(z) - allows us to grab anything from the inside of a variable 
argX <- c("IDK")

myFunc <- function(a=3, b=4){
  z <- a + b 
  return(z)
  }

myFunc() # runs defaults
z <- myFunc()
myFunc(a=100, b=3.4)


myFuncBad <- function(a=3){
  z <- a + b 
  return(z)
} 
myFuncBad() # error object b not found

#### Multiple return statements
######################################################################
# FUNCTION: HardyWeinberg
# input: all allele frequency p (0,1)
# output: p and the frequencies of 3 genotypes AA AB BB
#--------------------------------------------------------------
HardyWeinberg <- function(p = runif(1)){
  if(p > 1.0 | p < 0.0){
    return("Function failure: p must be between 0 and 1")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vec0ut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits=3)
  return(vec0ut)
} 
#####################################################################
HardyWeinberg()
freqs <- HardyWeinberg()
freqs
HardyWeinburg(p=3)

### CREATE A COMPLEX DEFAULT VALUE
#############################################
#FUNCTION: fitlinear2
#fits simple regression line
#input: numeric list of predictor (x) and response(y)
# outputs: slope and p-value
Fitlinear2 <- function(p=NULL){ 
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope= summary(myMod)$coefficients[2,1],
             pValue = summary(myMod)$coefficients[2,4])
  Plot(x=p$x, y=p$y) # quick plot to check output 
  retun(my0ut)
  
  
  
  
  }
fitlinear2()
