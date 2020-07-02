# Libraries
library(packcircles)
library(ggplot2)
 
rm(list=ls())

soccer.1 <- read.csv("soccer-preprocessed-01.csv") 
value.1 <- group_by(soccer.1, Club) %>% summarise(Value.sum=sum(Value))

## clubs from bundesliga
BL_Clubs <- c("FC Bayern München","Borussia Dortmund", "Borussia Mönchengladbach", "SC Freiburg", "Bayer 04 Leverkusen", "FC Schalke 04", "VfB Stuttgart","SV Werder Bremen", "Hertha BSC", "1. FSV Mainz 05", "1. FC Nürnberg", "VfL Wolfsburg", "Hannover 96", "Eintracht Frankfurt", "TSG 1899 Hoffenheim", "FC Augsburg", "Fortuna Düsseldorf", "RB Leipzig")

value.3 <- filter(value.1, Club %in% BL_Clubs) 

## divide by 1 bilion
value.3$Value.sum <- value.3$Value.sum / 100000000

## barplot, problem with long club names
par(mfrow=c(1,1), mar=c(2,2,2,2)+1.1)
bp <- barplot(value.3$Value.sum, main="Value of all players for each club - Bundesliga", axisnames=TRUE,ylab="BN Euro")
text(x=bp, y=value.3$Value.sum, labels=value.3$Club, srt=90)

## barplot, problem with thin bars
par(mfrow=c(1,1), mar=c(2,2,2,2)+0.1)
bp <- barplot(value.3$Value.sum, width=rep(15,18), main="Value of all players for each club - Bundesliga", horiz=TRUE, xlim=c(0,7))
text(y=bp, x=rep(0.05,18), labels=value.3$Club, adj=0, cex=1)
legend('bottomright', c('Values in BN €'))

data <- data.frame(value.3)
# Generate the layout. This function return a dataframe with one line per bubble. 
# It gives its center (x and y) and its radius, proportional of the value
## silke: use sizetype='radius', alternative 'area' gave the wrong impression when comparing sizes.
## silke: no scientific fundamentals, just personal opinion.
packing <- circleProgressiveLayout(data$Value.sum, sizetype ='radius')
 
# We can add these packing information to the initial data frame
data <- cbind(data, packing)
 
# Check that radius is proportional to value. We don't want a linear relationship, since it is the AREA that must be proportionnal to the value
plot(data$radius, data$Value.sum)
## ?? What ??
 
# The next step is to go from one center + a radius to the coordinates of a circle that
# is drawn by a multitude of straight lines.
dat.gg <- circleLayoutVertices(packing, npoints=50)
 
# Make the plot
ggplot() + 
  
  # Make the bubbles
  geom_polygon(data = dat.gg, aes(x, y, group = id, fill=as.factor(id)), colour = "white", alpha = 0.9) +
  
  # Add text in the center of each bubble + control its size
  geom_text(data = data, aes(x, y, size=Value.sum, label = Club)) +
  scale_size_continuous(range = c(1,4)) +
  
  # General theme:
  theme_void() + 
  theme(legend.position="none") +
  coord_equal()