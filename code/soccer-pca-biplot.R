setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

soccer.preprocessed <- read.csv("soccer-preprocessed.csv", encoding = "UTF-8")
pcs <- prcomp(soccer.preprocessed[, 46:79])

biplot(
  pcs,
  pc.biplot = TRUE,
  cex=0.8,
  xaxt="n",
  yaxt="n",
  main="Soccer Data (Skill Scores), Covariance Based",
  xpd=NA, 
  xlab=paste0("PC1 (", round(100*pcs$sdev[1]^2/sum(pcs$sdev^2),1), "% explained var.)"),
  ylab=paste0("PC2 (", round(100*pcs$sdev[2]^2/sum(pcs$sdev^2),1), "% explained var.)")
)
