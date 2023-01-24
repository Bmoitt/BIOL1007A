###### Title
###### Date
###### Bakari Moitt

Library.dplyr
library.tidyverse
#built in set
data(starwars)

## sequence 

Length(a) #length of a vector

b<- LETTERS[4:10]
length(b)

## output of %in% depends on first vector
a %in% b
b %in% a

# use %in% to subset
filter(starwars, eye_color %in% c("blue","brown"))
## using double equals (==) instead of %in%, it gives a warning and cannot compute according. You would have to do a bit more coding.
View(eyes)

## arrange(): reorders rows
arrange(starwarsClean, by=height) #default is ascending order
# can use helper function desc()
arrange(starwarsClean, by=desc(height))
# we can add additional things with one condition
arrange(starwarsClean, height, desc((mass))) # second variable used to break ties

sw <- arrange(starwars, by=height)
tail(sw) #missing values are at the end

#### select (): chooses variables or (COLUMNS) by their names
select(starwarsClean, 1:10)
select(starwarsClean, name:species)
select(starwarsClean, -(films:starships))

### rearrange columns
select(starwarsClean, name, gender, species, everything()) #everythign is a helper fucntion useful if you have a couple variable you want to move to the fronts/beggining

# contains() helper function
select(starwarsClean, contains("color")) # others include, numrange
#slect_)select(starwarsClean, haircolor = waws_color)

lets cgreat a new column
- height div
starwarS_LBS) # BROUGHT IT TO THE FROMT USING SElect
#transmute
trnamute(starwarsClean, mass, mass_lbs=mass#2.2, height
         star)

star wars <- mutatue
(starwarsClwan, mass_lbs= mass*2.2, ;after=mass)#after/before #have to use  ;.: before arguement so it recogonises it as an arguement

glipse(starwars <- )

### groupdmby and summarizes gor msxiumun undfulls \
dumarize(stronge)

#piping(%>%)
# used to emphasize a sequence of actions
#allows you to pass an intermediate results onti the next funciton)uses output of the function as input of the next function)
# avoud if you need to manipulate more than one object/variable at a time: or if variable is meaningful
# formatting: should have space before the %>% followed by a new line

starwarsClean %>%
  goup_by(gender)
summarize(meanheight=mean(height,na.rm=TRUE),
                          TotalNumber=n()) #na.rm=T skips na's
#much cleaner with piping!

#morecomplex coding
##case_when() is useful for miltiple if/ifelse statements
starwarsClean %>%
  mutatute (sp = case_when
            (species== "Human"~"Human",
              TRUE~ "Non-Human" )) #uses condition, puts "human" if TRUE in spcolumn, puts "Non-Human"if its's FAlSE

