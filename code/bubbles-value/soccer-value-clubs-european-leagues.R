# Libraries
library(packcircles)
library(ggplot2)
library(dplyr)
 
setwd("~/Documents/studiumDataScience/semester2/Vis/group-work")

rm(list=ls())

soccer.1 <- read.csv("./data/soccer-preprocessed.csv") 
value.1 <- group_by(soccer.1, Club) %>% summarise(Value.sum=sum(Value))

## clubs from bundesliga (German) and Premier League (GB/England??)
## British Premier League
PL_Clubs <- c("Arsenal","Bournemouth", "Brighton & Hove Albion", "Burnley", "Cardiff City", "Chelsea", "Crystal Palace","Everton", "Fulham", "Huddersfield Town", "Leicester City", "Liverpool", "Manchester City", "Manchester United", "Newcastle United", "Southampton", "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers")
## Spanish LaLiga
LL_Clubs <- c("Atlético Madrid","FC Barcelona", "Real Madrid", "Athletic Club de Bilbao", "Real Betis", "RC Celta", "RCD Espanyol","Real Sociedad", "Valencia CF", "Real Valladolid CF", "Deportivo Alavés", "SD Eibar", "Rayo Vallecano", "Sevilla FC", "Villarreal CF", "Levante UD", "Getafe CF","CD Leganés", "Girona FC", "SD Huesca")
## German Bundesliga
BL_Clubs <- c("FC Bayern München","Borussia Dortmund", "Borussia Mönchengladbach", "SC Freiburg", "Bayer 04 Leverkusen", "FC Schalke 04", "VfB Stuttgart","SV Werder Bremen", "Hertha BSC", "1. FSV Mainz 05", "1. FC Nürnberg", "VfL Wolfsburg", "Hannover 96", "Eintracht Frankfurt", "TSG 1899 Hoffenheim", "FC Augsburg", "Fortuna Düsseldorf", "RB Leipzig")
## Italian Serie A
SA_Clubs <- c("Atalanta","Bologna", "Cagliari","Chievo", "Empoli","Fiorentina","Frosinone","Genoa", "Inter", "Juventus","Lazio", "Milan", "Napoli", "Parma", "Roma", "Sampdoria", "Sassuolo", "Spal", "Torino", "Udinese")
## French Ligue 1
L1_Clubs <- c("FC Girondins de Bordeaux","En Avant de Guingamp", "LOSC Lille", "Olympique Lyonnais", "AS Monaco", "Montpellier HSC", "FC Nantes","OGC Nice", "Paris Saint-Germain", "Stade Rennais FC", "RC Strasbourg Alsace", "Stade Malherbe Caen", "Olympique de Marseille", "Nîmes Olympique", "Stade de Reims", "Angers SCO", "Toulouse Football Club", "Amiens SC", "AS Saint-Étienne", "Dijon FCO")

value.3 <- filter(value.1, Club %in% c(BL_Clubs,PL_Clubs,LL_Clubs,SA_Clubs,L1_Clubs)) 

## divide by 1 bilion , does not matter since the chart is without scale...
value.3$Value.sum <- value.3$Value.sum / 100000000

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

