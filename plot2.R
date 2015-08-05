#plot2
plot2 <- function(dtCache, isSubPlot = F) {
  x <- cacheHPC(dtCache)

    if (!isSubPlot) {
    png("plot2.png")
  }
  
  par(col = "black")
  with(x, plot(Global_active_power ~ DateTime, type = "l", col  = "black", ylab = ifelse(isSubPlot,"Global Active Power", "Global Active Power (kilowatts)"), xlab = ""))
  
  if (!isSubPlot) {
    dev.off()
  }
}
