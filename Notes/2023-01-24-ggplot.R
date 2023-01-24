#### ggplot2
#### 24 Jan 2023
#### LVA

# load in the right libraries
library(ggplot2)
library(ggthemes)
library(patchwork)

#### Template for ggplot code
### to start: p1 <- ggplot(data=<DATA>, mapping = aes(x= xVar, y= yVar)) +
###               <GEOM FUNCTION> ##+ geom_boxplot()
###               Print (p1)

#examples:
#### load in a built-in data set
d <- mpg
str(mpg)

library(dplyr)
glimpse(d)

#### qplot: quick, plotting
qplot(x=d$hwy)

qplot(x=d$hwy, fill= I("darkblue"), color= I("black"))

#scatterplot
qplot(x= d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm") # add method="lm" to go from a curved graph to a straight line

#boxplot
qplot(x=d$fl, y=d$cty, geom="boxplot", fill=I("forestgreen")) 

#barplot
qplot(x=d$fl, geom="bar"), fill=I("forestgreen"))

### creare some data (specified colunts)
x_trt <- c("Control", "Low", "High") 
y_resp <- c(12, 2.5, 22.9)
qplot(x=x_trt, y=y_resp, geom="col",
fill= I(c("forestgreen","slategray","goldenrod")))

### ggplot: uses dataframes instead of vectors (like qplot did )

### were making a plot called p1
p1 <- ggplot(data=d, mapping=aes(x=displ, y=cty, color = cyl)) + 
  geom_point()
p1

p1 + theme_base()
p1 + theme_bw()
p1 + theme_classic()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_minimal()
p1 + theme_void()
p1 + theme_economist() 
# you can change font size and font type
p1 + theme_bw(base_size=30, base_family="serif")

p2 <- ggplot(data=d, aes(x=fl, fill=fl)) +
  geom_bar()
p2 + coord_flip() # flips the x and the y axis
p2 + coord_flip() + theme_classic(base_size=15, base_family="sans")

# theme modifications
p3 <- ggplot(data=d, aes(x=displ, y=city)) + 
  geom_point(size=4, shape= 21, color="magenta", fill="black") + 
  xlab("Count") +
  ylab("Fuel") +
  labs(title="My Title here", subtitle="my subtitle goes here") #x=/y= axis # you can list the size and shape fo the points on the 
p3 + xlim(1, 10) +ylim(0,35)

library(viridis)
cols <- viridis(7, option = "magma") # theres a bunch of colors like magma, plasma, turbo etc
ggplot(data = d, aes(x=class, y=hwy, fill=class)) +
  geom_boxplot() +
  scale_fill_manual(values=cols)


library(patchwork)
p1 + p2 + p3

