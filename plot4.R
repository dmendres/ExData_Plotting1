source("plot3.R")
source("plot2.R")

plot4a <- function(dtCache) {
  x <- cacheHPC(dtCache)
  with(x, plot(Voltage ~ DateTime, type = "l", xlab = "datetime", ylab = "Voltage"))
}
plot4b <- function(dtCache) {
  x <- cacheHPC(dtCache)
  with(x, plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime"))
}
plot4 <- function(dtCache, isSubPlot = F) {
  
  if (!isSubPlot) {
    png("plot4.png")
  }
  
  par(mfrow = c(2,2))
  plot2(dtCache, isSubPlot = T)
  plot4a(dtCache)
  plot3(dtCache, isSubPlot = T)
  plot4b(dtCache)
  if (!isSubPlot) {
    dev.off() 
  }
}