###### Loading in Data
###### 26 January 2023
###### BM

### Create and save a dataset
### write.table()
### write.table(x=varName, file=:outputFileName.csv", header=TRUE, sep=",")

#### these function read in a dataset
### read.table
### read.table(File="path/to/data.csv", header=TRUE, sep = ",")( this sep"," is for when there is a csv file that you are grabbing)
#allows you to specify nd data without note (meta data) you can put ting like 

### read.csv()
### read.csv(file= "data.csv", header=T)
 
### use RDS object when only working in R
## saveRDS() - creates a variable that you've made in R and saves it at is table so all you need to do is give it a fine name 
#saveRDS(my_data, file="FileName.RDS")

## readRDS() - writes a single R object to a rile and to restore it
##readRDS("fineName.RDS")
## p - readRDS("FileName.RDS")

### Long vs Wide data formats
### wide format = contain values that do not repeat in the ID column
### Long format= contain values that do repeat in the ID column

library(Tidyverse)
glimpse(billboard) #wide format because that it has individual ID's in the columns section

b1 <- billboard %>%
  pivot_longer(
    cols = starts_with("wk"), #specify which columns you want to make longer
    names_to = "Week", # name of new column which will contain header names
    values_to = "Rank", # name of new column which will contain the values
    values_drop_na=TRUE
  )
View(b1) ### remove if knitting b/c Rmarkdown does not like this
### pivot_wader
### best for making occupancy matrix
glimpse(fish_encounters)
View(fish_encounters)
fish_encounters %>%
  pivot_wider(names-from = station, # which column you want to turn into multiple columns
              values_from= seen) # which column contains the values for new new column cells

fish_encounters %>%
  pivot_wider(names_from = station, 
              values_from= seen,
              values_fill= 0) # fills NA's with zeros

##### Dryad: makes research data freely reusable, citable, and discoverable
#https://datadryad.org/search

## read.table()
dryadData <- read.table(file="data/veysey-babbitt_data_amp.csv", header = TRUE, sep = ",")
glimpse(dryadData)
head(dryadData)

table(dryadData$species) # theres two species and each has 66 columns ## allows you to see different groups of character columns
summary(dryadData$mean.hydro)

dryadData$species <- factor(dryadData$species, labels=c("Spotted Salamander", "Wood Frog")) # creating labels to use for the plot
class(dryadData$treatment)

### copied below
dryadData$treatment <- factor(dryadData$treatment, 
                              levels=c("Reference",
                                       "100m", "30m"))


p<- ggplot(data=dryadData, 
           aes(x=interaction(wetland, treatment), 
               y=count.total.adults, fill=factor(year))) + geom_bar(position="dodge", stat="identity", color="black") +
  ylab("Number of breeding adults") +
  xlab("") +
  scale_y_continuous(breaks = c(0,100,200,300,400,500)) +
  scale_x_discrete(labels=c("30 (Ref)", "124 (Ref)", "141 (Ref)", "25 (100m)","39 (100m)","55 (100m)","129 (100m)", "7 (30m)","19 (30m)","20 (30m)","59 (30m)")) +
  facet_wrap(~species, nrow=2, strip.position="right") +
  theme_few() + scale_fill_grey() + 
  theme(panel.background = element_rect(fill = 'gray94', color = 'black'), legend.position="top",  legend.title= element_blank(), axis.title.y = element_text(size=12, face="bold", colour = "black"), strip.text.y = element_text(size = 10, face="bold", colour = "black")) + 
  guides(fill=guide_legend(nrow=1,byrow=TRUE)) 




