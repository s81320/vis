setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

soccer.preprocessed <- read.csv("soccer-preprocessed.csv", encoding = "UTF-8")
# View(soccer.preprocessed)

# Broader.Position
GLK <- c("GK")
DFN <- c("LB", "LCB", "CB", "RCB", "RB", "LWB", "LDM", "CDM", "RDM", "RWB")
MDF <- c("LM", "LCM", "CM", "RCM", "RM", "LAM", "CAM", "RAM")
ATK <- c("LW", "LF", "CF", "RF", "RW", "LS", "ST", "RS")

soccer.preprocessed$Broader.Position <- ifelse(
  soccer.preprocessed$Position %in% GLK, "GLK", ifelse(
    soccer.preprocessed$Position %in% DFN, "DFN", ifelse(
      soccer.preprocessed$Position %in% MDF, "MDF", "ATK"
    )
  )
)

# View(head(soccer.preprocessed[, c(1, 16, 81)], 100))

soccer.preprocessed$Broader.Position <- factor(
  soccer.preprocessed$Broader.Position,
  levels=c("GLK","DFN","MDF", "ATK")
)

# levels(soccer.preprocessed$Broader.Position)

prc.soccer <- prcomp(soccer.preprocessed[, 46:79])
# sum(prc.soccer$sdev^2)

prc.soccer.x12 <- prc.soccer$x[, 1:2]
# View(cor(prc.soccer.x12, soccer.preprocessed[, 46:79]))


prc.soccer_scaled <- prcomp(soccer.preprocessed[, 46:79], scale. = TRUE)
# sum(prc.soccer_scaled$sdev^2)

prc.soccer_scaled.x12 <- prc.soccer_scaled$x[, 1:2]
# View(cor(prc.soccer_scaled.x12, soccer.preprocessed[, 46:79]))

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
# barplot(table(1:8), col=1:8)

# plot(x=c(1:30), y=c(1:30), pch=c(1:30))


dev.off()

mm <- rbind(c(1,2),c(3,3))
ww <- c(1,1)
hh <- c(10,1)
layout(mat=mm, widths=ww, heights=hh)

colors <- c("#56B4E9", "#009E73", "#F0E442", "#D55E00")
pch <- c(3, 4, 21, 22)

plot(
  prc.soccer.x12, 
  main="First two PCs, unscaled",
  pch=pch[as.numeric(soccer.preprocessed$Broader.Position)],
  col=colors[as.numeric(soccer.preprocessed$Broader.Position)],
  xlab=paste0("PC1, ", round(100*prc.soccer$sdev[1]^2 / sum(prc.soccer$sdev^2), 1), "%"),
  ylab=paste0("PC2, ", round(100*prc.soccer$sdev[2]^2 / sum(prc.soccer$sdev^2), 1), "%")
)
plot(
  prc.soccer_scaled.x12,
  main="First two PCs, scaled",
  pch=pch[as.numeric(soccer.preprocessed$Broader.Position)],
  col=colors[as.numeric(soccer.preprocessed$Broader.Position)],
  xlab=paste0("PC1, ", round(100*prc.soccer_scaled$sdev[1]^2 / sum(prc.soccer_scaled$sdev^2), 1), "%"),
  ylab=paste0("PC2, ", round(100*prc.soccer_scaled$sdev[2]^2 / sum(prc.soccer_scaled$sdev^2), 1), "%")
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


# TSV <- sum(prc.soccer$sdev^2)
# View(
#   cbind(
#     PC=paste0("PC", c(1:7)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer$sdev[1:7]^2))/TSV,2)),
#     PC=paste0("PC", c(8:14)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer$sdev[8:14]^2))/TSV,2)),
#     PC=paste0("PC", c(15:21)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer$sdev[15:21]^2))/TSV,2)),
#     PC=paste0("PC", c(22:28)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer$sdev[22:28]^2))/TSV,2)),
#     PC=paste0("PC", c(29:34)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer$sdev[29:34]^2))/TSV,2))
#   )
# )

# TSV <- sum(prc.soccer_scaled$sdev^2)
# View(
#   cbind(
#     PC=paste0("PC", c(1:7)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer_scaled$sdev[1:7]^2))/TSV,2)),
#     PC=paste0("PC", c(8:14)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer_scaled$sdev[8:14]^2))/TSV,2)),
#     PC=paste0("PC", c(15:21)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer_scaled$sdev[15:21]^2))/TSV,2)),
#     PC=paste0("PC", c(22:28)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer_scaled$sdev[22:28]^2))/TSV,2)),
#     PC=paste0("PC", c(29:34)),
#     "Retained Variance (%)"=paste0(round((100*(prc.soccer_scaled$sdev[29:34]^2))/TSV,2))
#   )
#)
