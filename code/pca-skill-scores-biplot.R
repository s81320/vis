setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

soccer.preprocessed <- read.csv("soccer-preprocessed.csv", encoding = "UTF-8")
soccer.pca <- prcomp(soccer.preprocessed[, 46:79])

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
  col=c("grey", "#D55E00"),
  cex=0.6,
  cex.main=0.8,
  cex.lab=0.8,
  main="PCA (Soccer Skills), Covariance Based",
  xlab=paste0("PC1 (", round(100*soccer.pca$sdev[1]^2/sum(soccer.pca$sdev^2),1), "% explained var.)"),
  ylab=paste0("PC2 (", round(100*soccer.pca$sdev[2]^2/sum(soccer.pca$sdev^2),1), "% explained var.)")
)



