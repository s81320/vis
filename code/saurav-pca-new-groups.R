#setwd("D:/msc-ds/course-resource/data-visualization/project")
setwd("~/Documents/studiumDataScience/semester2/vis/group-work/data")
rm(list=ls())

soccer.preprocessed <- read.csv("soccer-preprocessed-01.csv", encoding = "UTF-8")
# View(soccer.preprocessed)

##### REMOVE GOALKEEPER ##### REMOVE GOALKEEPER #####
soccer.1 <- filter(soccer.preprocessed, Position != "GK")

##### new GROUPS ##### NEW GROUPS ##### NEW Groups #####
# Broader.Position
ATK <- c("LW", "LF", "CF", "RF", "RW", "LS", "ST", "RS", "LAM", "CAM", "RAM", "RM","LM")
MDF <- c("LCM", "CM", "RCM")
DFN <- c("LB", "RB", "LWB", "LDM", "CDM", "RDM", "RWB")
BCK <- c("LCB", "CB", "RCB")

soccer.1$Broader.Position <- ifelse(
  soccer.1$Position %in% BCK, "BCK", ifelse(
    soccer.1$Position %in% DFN, "DFN", ifelse(
      soccer.1$Position %in% MDF, "MDF", "ATK"
    )
  )
)

# View(head(soccer.preprocessed[, c(1, 16, 81)], 100))

soccer.1$Broader.Position <- factor(
  soccer.1$Broader.Position,
  levels=c("ATK", "MDF", "DFN","BCK")
)

# levels(soccer.preprocessed$Broader.Position)

names(soccer.1[, 46:74])
#names(soccer.preprocessed[, 46:79])

prc.soccer <- prcomp(soccer.1[, 46:74])
# sum(prc.soccer$sdev^2)

prc.soccer.x12 <- prc.soccer$x[, 1:2]
#View(cor(prc.soccer.x12, soccer.1[, 46:74]))

# color_blind_friendly palette (with black):
cbf <- c(
  "#000000",
  "#E69F00",
  "#56B4E9",
  "#009E73",
  "#F0E442",
  "#0072B2",
  "#D55E00",
  "#CC79A7"
)
barplot(table(1:8), col=1:8)

plot(x=c(1:30), y=c(1:30), pch=c(1:30))


dev.off()

colors <- c("#56B4E9", "#009E73", "#F0E442", "#D55E00")
pch <- c(3, 4, 21, 22)

plot(
  prc.soccer.x12, 
  main="First two PCs, unscaled",
  pch=pch[as.numeric(soccer.1$Broader.Position)],
  col=colors[as.numeric(soccer.1$Broader.Position)],
  xlab=paste0("PC1, ", round(100*prc.soccer$sdev[1]^2 / sum(prc.soccer$sdev^2), 1), "%"),
  ylab=paste0("PC2, ", round(100*prc.soccer$sdev[2]^2 / sum(prc.soccer$sdev^2), 1), "%")
)

par(mar=c(1,1,1,1))
legend(
  "bottom",
  pch=pch,
  col=colors,
  legend=levels(soccer.1$Broader.Position),
  ncol=4
)

