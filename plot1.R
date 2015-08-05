#plot1
plot1 <- function(dtCache, isSubPlot = F) {
  x <- cacheHPC(dtCache)
  
  if (!isSubPlot) {
    png("plot1.png")
  }
  
  par(mar = c(4,4,2,2))
  with(x, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", bg = "transparent", ylim = c(0,1200)))

  if (!isSubPlot) {
    dev.off()
  }
}