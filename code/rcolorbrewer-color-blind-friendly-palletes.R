setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

# install.packages("RColorBrewer")
library(RColorBrewer)

dev.off()
par(mar=c(3, 3, 1, 1), cex=0.6)
display.brewer.all(colorblindFriendly=TRUE)
mtext(
  side=1,
  line=1,
  text="RColorBrewer Color Blind Friendly Palletes",
  cex=0.75
)
