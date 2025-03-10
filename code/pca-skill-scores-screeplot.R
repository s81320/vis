setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

library(RColorBrewer)

soccer.preprocessed <- read.csv(
  "soccer-preprocessed.csv",
  encoding="UTF-8"
)
soccer.ev <- eigen(
  cov(
    soccer.preprocessed[, 46:79]
  )
)$values

pallete.dark2 <- brewer.pal(n=8, name="Dark2")

dev.off()
mm <- rbind(c(1,2))
ww <- c(1,1)
hh <- c(10)
layout(mat=mm, widths=ww, heights=hh)

plot(
  soccer.ev,
  type="b",
  xlab="PCs",
  ylab="Variance",
  ylim=c(0,6000),
  main="Variance vs. PC",
  cex.main=0.90,
  cex.lab=0.80,
  cex.axis=0.70,
  las=1,
  xpd=T
)
abline(
  h=mean(soccer.ev),
  lty="dotted",
  col=pallete.dark2[4]
)
text(
  x=21,
  y=650,
  labels=paste0("Mean (Variance) = ", round(mean(soccer.ev), 1)),
  col=pallete.dark2[4],
  cex=0.70
)


plot(
  100*cumsum(soccer.ev)/sum(soccer.ev),
  type="b",
  xlab="PCs",
  ylab="Cumulative Variance (%)",
  ylim=c(0,100),
  main="Cumulative Variance (%) vs. PC",
  cex.main=0.90,
  cex.lab=0.80,
  cex.axis=0.70,
  las=1,
  xpd=T
)
abline(
  h=75,
  lty="dotted",
  col=pallete.dark2[4]
)
text(
  x=20,
  y=70,
  labels="Cumulative Variance = 75%",
  col=pallete.dark2[4],
  cex=0.70
)
