#plot3, start with the first sub metering group
plot3 <- function(dtCache, isSubPlot = F) {
  if (!isSubPlot) {
    #this function owns the plotting device
    png("plot3.png")
  }
  x <- cacheHPC(dtCache)
  
  with(x, plot(Sub_metering_1 ~ DateTime, type = "l", col  = "black", ylab = "Energy sub metering", xlab = ""))
  #add the remaining two sub metering groups
  with(x, lines(Sub_metering_2 ~ DateTime, type = "l", col  = "red"))
  with(x, lines(Sub_metering_3 ~ DateTime, type = "l", col  = "blue"))
  #now the legend
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         bty = ifelse(isSubPlot, "n", "o"),
         col = c("black", "red", "blue"), lty = 1)
  if (!isSubPlot) {
    dev.off()
  }
}
