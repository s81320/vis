setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

library(RColorBrewer)

soccer.preprocessed <- read.csv("soccer-preprocessed.csv", encoding = "UTF-8")

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
soccer.pca.x12 <- soccer.pca$x[, 1:2]


soccer.pca_scaled <- prcomp(soccer.preprocessed[, 46:79], scale. = TRUE)
soccer.pca_scaled.x12 <- soccer.pca_scaled$x[, 1:2]

dev.off()
mm <- rbind(c(1,2),c(3,3))
ww <- c(1,1)
hh <- c(10,1)
layout(mat=mm, widths=ww, heights=hh)

pallete.set2 <- brewer.pal(n=8, name="Set2")
pallete.paired <- brewer.pal(n=12, name="Paired")
pallete.dark2 <- brewer.pal(n=8, name="Dark2")

colors <- c(
  pallete.paired[2],
  pallete.paired[4],
  pallete.set2[6],
  pallete.dark2[2]
)

pch <- c(3, 4, 21, 22)

plot(
  soccer.pca.x12, 
  main="First two PCs, unscaled",
  pch=pch[as.numeric(soccer.preprocessed$Broader.Position)],
  col=colors[as.numeric(soccer.preprocessed$Broader.Position)],
  xlab=paste0("PC1, ", round(100*soccer.pca$sdev[1]^2 / sum(soccer.pca$sdev^2), 1), "%"),
  ylab=paste0("PC2, ", round(100*soccer.pca$sdev[2]^2 / sum(soccer.pca$sdev^2), 1), "%")
)
plot(
  soccer.pca_scaled.x12,
  main="First two PCs, scaled",
  pch=pch[as.numeric(soccer.preprocessed$Broader.Position)],
  col=colors[as.numeric(soccer.preprocessed$Broader.Position)],
  xlab=paste0("PC1, ", round(100*soccer.pca_scaled$sdev[1]^2 / sum(soccer.pca_scaled$sdev^2), 1), "%"),
  ylab=paste0("PC2, ", round(100*soccer.pca_scaled$sdev[2]^2 / sum(soccer.pca_scaled$sdev^2), 1), "%")
)

par(mar=rep(0,4))
plot.new()
legend(
  "center",
  pch=pch,
  col=colors,
  legend=levels(soccer.preprocessed$Broader.Position),
  ncol=4
)