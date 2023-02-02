##### Simple Data Analysis and More Complex Control Structures
##### 30 January 2023
##### LVA


dryadData <- read.table(file="Data/veysey-babbitt_data_amp.csv", header=TRUE, sep=",")

## set up libraries
library(tidyverse)
library(ggthemes)

### Analyses
### Experimental Designs
### independent(x-axis/explanatory variable) vs dependent ( y-axis/response variable)
### continuous (range of numbers: height, weight, etc) vs discrete/categorical (categories: species, treatment groups, etc)

glimpse(dryadData)

### Basic linear regression analysis (2 continuois variables)
## Is there a relationship between the mean ppool hydroperiod and the number of breeding frogs caught?
## y variable ~ xvariable
regModel <- lm(count.total.adults ~ mean.hydro, data=dryadData)
print(regModel)
summary(regModel)

hist(regModel$residuals)
summary(regModel)$"r.squared"
summary(regModel)[["r.squared"]]

#View(summary(regModel))

regPlot<- ggplot(data = dryadData, aes(x= mean.hydro, y= count.total.adults +1)) +
  geom_point() + 
  stat_smooth(method=lm, se = 0.99)
regPlot + theme_few()

### Basic ANOVA
### Was there a statistically significant difference in the number of adults among wetlands?
#y~x
ANOmodel <- aov(count.total.adults ~ factor(wetland), data=dryadData)
summary(ANOmodel)

dryadData %>%
  group_by(wetland) %>%
  summarise(avgHydro = mean(count.total.adults, na.rm=TRUE),N = n())

### Box plot
dryadData$wetland <- factor(dryadData$wetland)
class(dryadData$wetland)  

ANOplot <- ggplot(data=dryadData, mapping=aes(x=wetland, y=count.total.adults)) + geom_boxplot()
ANOplot

ANOplot2 <- ggplot(data=dryadData, mapping=aes(x=wetland, y=count.total.adults, fill=species)) + geom_boxplot()+
  scale_fill_grey()
ANOplot2
#ggsave(file="SpeciesBoxplots.pdf", plot=ANOplot2, device="pdf")

###logistic regression
##Data frame
# gamma probabilities - continuous variables that are always positive and have skewed distribution

xVar <- sort(rgamma(n=200, shape =5, scale= 5))
hist(xVar)

yVar <- sample(rep(c(1,0), each=100), prob= seq_len(200))

logRegData <- data.frame(xVar, yVar)

logRegModel <- glm(yVar ~ xVar, data= logRegData, family= binomial(link=logit))
summary(logRegModel)
 
logRegPlot <- ggplot(data= logRegData, aes(x=xVar, y=yVar))+ 
  geom_point() + 
  stat_smooth(method = "glm", method.args= list(family=binomial))
counter <- 0

for i in log


### Contingency Table (chi-squared) Analysis
### Are there differences in counts of males and females between species?

countData <- dryadData %>%
  group_by(species) %>%
  summarize(Male =sum(No.males, na.rm=T), Females= sum(No.females, na.rm=TRUE)) %>%
  select(-species) %>%
  as.matrix()
countData

row.names(countData) = c("SS", "WF")
countData

### chi-squared
## get residuals
testResults <- chisq.test(countData)$residuals
testResults$residuals
testResults$expected

### mosaic plot (base R)
mosaicplot(x=countData,
           col=c("goldenrod", "grey"))

### bar plot

countDataLong <- countData %>%
  as_tibble() %>%
  mutate(Species =c(rownames(countData)))
  pivot_longer(cols = Males:Females, names_to = "Sex", values_to= "Count")

  ### Plot bar graph
  ggplot(data = countDataLong, mpping = aes(x=Species, y=Count, fill=Sex)) + geom_bar(stat="identity", postion="dodge")+
                                              scale_fill_manual(values=c("darkslategrey", "midnightblue" ))# plots bars next to each other ))
  
  ###############################################################
  #### Control Structures
  
# if and ifelse statements
###### if statement
#### if (condition) {expression 1}

#### if (condition) {expression 1} else {expression 2}
#### if (condition) {expression 1} else #### if (condition2) {expression 2} else {expression 3}
### if any final unspecified else captures the rest of the unspecified conditions
# else must appear on the same line as the rxpression

# use it for single values
  z<- signif (runif(1), digits=2)
  z > 0.5
  
  ### use {} or
  if (z > 0.8) {cat(z, "is a large number", "\n")} else
    if(z < 0.2) {cat(z, "is a small number", "\n")} else
    {cat(z, "is a number of typical size", "\n")
      cat("z^2=", z^2, "\n")
      y <- cat(z, TRUE, "dog")}
  y
  
  ##### ifelse to fill vectors
  #### iffelse(condotion, yes, no)
  ##### incenst population where females lay 10.2 eggs on average, follows poisson distributionionshowinf likely nuber of times an evetnt will. 35% partitism where no eggs are laid. lets smoothe
  tester <- runif(1000
                  eggs <- ifelse)tester > False(tester>0.35,lamda=10.2, hist(eggs)
                                                
### vector of p-values from a simulation and we wanr ro creator a vectore to hyghling the signidican one for plotting
pVaLs <- runif91000)
  
###### FOR LOOPS
#### workhorse function for doing repetitive tasks
  ##3 universal in all computer languages
  ### Controversial in R\
  ### often necessary (vectorization in R)
  #### very slow with certain operation
  #3## family off apply functions
  #body of the for loop
  #}
  #var is a counter variable that holds the current value of the loop
  #sequence is an integer vectors that defines start and end of loop
  
  for(i in 1:5){
    cat("stuck in a loop", i, "\n")
    cat(3+2, "\n")
    cat(3+i, "\n")
  }
  
  print(i)
  
  ### use a counter variable that maps to the postion of each element
  my_dogs <- c("chow", "akita", "malamute", "husky", "samoyed")
for(i in 1:length(my_dogs)) {
  cat("i=",i, "my_dogs[i]=", my_dogs[i], "\n")
}
## loop over rows
  m <- matrix(round(runif(20), digits=2), nrow=5)
for  (i in 1:nrow(m)) {
  m[i,] <- m[i,] +i
}
m

### loop over columms
m <- matrix(round(runif(20), digits=2), nrow=5)
for  (j in 1:ncol(m)){
  m[,j] <- m[,j] +j 
} 

m

#### loop over rows and columns
m <- matrix(round(runif(20), digits=2), nrow=5)
for  (i in 1:nrow(m)){
for  (j in 1:ncol(m)){
  m[i,j] <- m[i,j] + i + j
}}
