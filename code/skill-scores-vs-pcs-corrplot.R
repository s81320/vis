setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

library(RColorBrewer)
library(corrplot)

soccer.preprocessed <- read.csv(
  "soccer-preprocessed.csv",
  encoding = "UTF-8"
)
soccer.pca <- prcomp(soccer.preprocessed[, 46:79])

dev.off()

pallete.dark2 <- brewer.pal(n=8, name="Dark2")
pallete.brbg <- brewer.pal(n=11, name="BrBG")

par(cex.main=0.60)
corrplot(
  round(cor(soccer.pca$x[, 1:34], soccer.preprocessed[, 46:79]), 2),
  col=pallete.brbg[4:8],
  tl.cex=0.6,
  tl.col=pallete.dark2[4],
  mar=c(1, 1, 1, 1),
  title="Correlations of Skills with PCs"
)