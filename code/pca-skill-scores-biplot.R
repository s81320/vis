setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

library(RColorBrewer)

soccer.preprocessed <- read.csv("soccer-preprocessed.csv", encoding = "UTF-8")
soccer.pca <- prcomp(soccer.preprocessed[, 46:79])

pallete.greys <- brewer.pal(n=8, name="Greys")
pallete.dark2 <- brewer.pal(n=8, name="Dark2")

dev.off()

par(
  mgp=c(1, 0, 0)
)
biplot(
  soccer.pca,
  pc.biplot=TRUE,
  xaxt="n",
  yaxt="n",
  xpd=NA,
  col=c(pallete.greys[3], pallete.dark2[4]),
  cex=0.6,
  cex.main=0.8,
  cex.lab=0.8,
  main="PCA (Soccer Skills), Covariance Based",
  xlab=paste0("PC1 (", round(100*soccer.pca$sdev[1]^2/sum(soccer.pca$sdev^2),1), "% explained var.)"),
  ylab=paste0("PC2 (", round(100*soccer.pca$sdev[2]^2/sum(soccer.pca$sdev^2),1), "% explained var.)")
)



