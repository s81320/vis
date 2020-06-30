setwd("D:/msc-ds/course-resource/data-visualization/project")
rm(list=ls())

soccer.preprocessed <- read.csv(
  "soccer-preprocessed.csv",
  encoding="UTF-8"
)
ev.soccer <- eigen(cov(soccer.preprocessed[, 46:79]))$values
ev.soccer_scaled <- eigen(cor(soccer.preprocessed[, 46:79]))$values

dev.off()

mm <- rbind(c(1,2),c(3,3))
ww <- c(1,1)
hh <- c(10,1)
layout(mat=mm, widths=ww, heights=hh)

plot(
  ev.soccer,
  type="b",
  ylab="Variance",
  xlab="PCs"
)
abline(
  h=mean(ev.soccer),
  lty="dotted",
  col="#D55E00"
)

plot(
  ev.soccer_scaled,
  type="b",
  ylab="Variance",
  xlab="PCs"
)
abline(
  h=mean(ev.soccer_scaled),
  lty="dotted",
  col="#D55E00"
)

par(mar=rep(0,4))
plot.new()
legend(
  "center",
  legend=c("Left: Unscaled", "Right: Scaled"),
  ncol=2
)


# sum(ev.soccer)
# cbind(
#   eigen(cov(soccer.preprocessed[, 46:79]))$values,
#   prcomp(soccer.preprocessed[, 46:79])$sdev^2
# )