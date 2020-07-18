# require(devtools)
# Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
# install_github("vqv/ggbiplot")


setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

library(RColorBrewer)
library(ggbiplot)

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

pallete.set2 <- brewer.pal(n=8, name="Set2")
pallete.paired <- brewer.pal(n=12, name="Paired")
pallete.dark2 <- brewer.pal(n=8, name="Dark2")
pallete.greys <- brewer.pal(n=9, name="Greys")

colors <- c(
  pallete.paired[2],
  pallete.paired[4],
  pallete.set2[6],
  pallete.dark2[2]
)
shapes <- c(3, 4, 21, 22)

soccer.pca.biplot <- ggbiplot(
  soccer.pca,
  obs.scale=1,
  var.scale=1,
  pc.biplot=T,
  col=c(pallete.greys[3], pallete.dark2[4]),
  groups=soccer.preprocessed$Broader.Position,
  alpha=0
) +
scale_color_manual(
  name="Broader.Position", 
  values=colors
) +
scale_shape_manual(
  name="Broader.Position", 
  values=shapes
) +
geom_point(
  aes(
    colour=soccer.preprocessed$Broader.Position,
    shape=soccer.preprocessed$Broader.Position
  ),
  size=1.5,
  alpha=0.75
) +
theme_classic() +
theme(
  legend.direction='vertical',
  legend.position=c(0.85, 0.75),
)

layer_arrows <- soccer.pca.biplot$layers[[1]]
layer_texts <- soccer.pca.biplot$layers[[3]]
layer_points <- soccer.pca.biplot$layers[[4]]

layer_arrows$aes_params$colour <- pallete.greys[8]
layer_texts$aes_params$colour <- pallete.greys[8]

soccer.pca.biplot$layers <- c(
  layer_points,
  layer_texts,
  layer_arrows
)
soccer.pca.biplot
