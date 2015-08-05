library(data.table)

oldWD <- getwd()
setwd("Coursera/RDevelopmentWork/ExData/ExData_Plotting1")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")
#"HPC" -> Household Power Consumption
makeCachedHPCTable <- function(fileName = "") {
  dtHPC <- NULL
  setName <- function(y) {
    fileName <<- y
    dtHPC <<- NULL
  }
  getName <- function() fileName
  setHPC <- function(hpc) dtHPC <<- hpc
  getHPC <- function() dtHPC
  list(setName = setName, getName = getName, 
       getHPC = getHPC, setHPC = setHPC)
}


## Returns the inverse of a matrix stored in cache x, possibly computing it if the cached matrix has been updated.

cacheHPC <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  hpc = x$getHPC()
  if (is.null(hpc)) {
    x$setHPC(loadPrepHPC(x$getName()))
  }
  x$getHPC()  
}

loadPrepHPC <- function(fileName) {

  dfHPCHead <- read.csv(fileName, 
           sep = ";", header = T, 
           colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), 
           nrows = 10, na.strings = c("?"))
  #Explanation of magic numbers used below:
  # there are 2075260 total records, already ordered by date and time.
  # the first is the header, we use the read above to get the col names
  # the next 215996 are year 2006, then come 525600 for year 2007, 5257040 for year 2008, 525600 for  year 2009 and 475023 for year 2010.
  # so we skip 21995 (to be conservative), read 525602 (again, conservative) to get the year 2007 data with a little overlap.
  # This was determined using git shell tools. \
  # A more straightforward solution might have been to use Perl pattern matching to select the year directly
  dtHPC <- data.table(read.csv(fileName, 
                               sep = ";", header = T, 
                               colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), 
                               col.names = colnames(dfHPCHead),
                               skip = 21995, nrows = 525602, na.strings = c("?")))
  
  #use POSIXct, Posixlt raises warning that it takes 40 bytes per entry
  DateTime <- as.POSIXct(strptime(paste(dtHPC$Date,dtHPC$Time), format = "%d/%m/%Y %H:%M:%S"))
  dtDateTimeHPC <- data.table(DateTime,dtHPC)
  # select the rows for 1 and 2 Feb, 2007
  dtFeb1and2HPC <- dtDateTimeHPC[DateTime >= "2007-02-01" & DateTime < "2007-02-03"]
  # remove the extraneous character columns in favor of DateTime
  dtFeb1and2HPC[,c("Date", "Time") := NULL]
  
  #definitely cleanup recommended
  rm("dtHPC","dfHPCHead", "DateTime","dtDateTimeHPC")
  
  dtFeb1and2HPC
}

dtCache <- makeCachedHPCTable("../../data/household_power_consumption.txt");
stopifnot(file.exists(dtCache$getName()))

# #now we can call the plots with the data.table cache, which will be initialized one time
plot1(dtCache)
plot2(dtCache)
plot3(dtCache)
plot4(dtCache)


setwd(oldWD)
