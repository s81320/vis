# require(devtools)
# Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
# install_github("vqv/ggbiplot")


setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

require(ggbiplot)

soccer.preprocessed <- read.csv(
  "soccer-preprocessed.csv",
  encoding = "UTF-8"
)

# Broader.Position
GLK <- c(
  "GK"
)
DFN <- c(
  "LB",
  "LCB",
  "CB",
  "RCB",
  "RB",
  "LWB",
  "LDM",
  "CDM",
  "RDM",
  "RWB"
)
MDF <- c(
  "LCM",
  "CM",
  "RCM"
)
ATK <- c(
  "LM",
  "RM",
  "LAM",
  "CAM",
  "RAM",
  "LW",
  "LF",
  "CF",
  "RF",
  "RW",
  "LS",
  "ST",
  "RS"
)

soccer.preprocessed$Broader.Position <- ifelse(
  soccer.preprocessed$Position %in% GLK, "GLK", ifelse(
    soccer.preprocessed$Position %in% DFN, "DFN", ifelse(
      soccer.preprocessed$Position %in% MDF, "MDF", "ATK"
    )
  )
)

soccer.preprocessed$Broader.Position <- factor(
  soccer.preprocessed$Broader.Position,
  levels=c("GLK","DFN","MDF", "ATK")
)

soccer.pca <- prcomp(soccer.preprocessed[, 46:79])
colors <- c("#56B4E9", "#009E73", "#F0E442", "#D55E00")
pch <- c(3, 4, 21, 22)

ggbiplot(
  soccer.pca,
  obs.scale=1,
  var.scale=1,
  pc.biplot=T,
  groups=soccer.preprocessed$Broader.Position,
  ellipse=TRUE,
  alpha=0.05
) +
scale_color_manual(
  name="Broader.Position", 
  values=colors
) +
geom_point(
  aes(
    colour=soccer.preprocessed$Broader.Position
  ),
  size=0.5,
  alpha=0.10
) +
theme(
  legend.direction='horizontal',
  legend.position='top'
)

