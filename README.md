## README for dmendres forked repository, original README follows
This repository contains the files produced to meet the specifications 
for the first course project in the Exporing Data Coursera course exdata-031.

### Solution approach
Reading the specifications and grading rubrics closely, I have chosen to attempt to match the model plots character-for-character. E.g., in Plot 2, the y-label (ylab) is "Global Active Power (kilowatts)", but in Plot 4, the corresponding sub-plot has a different y-label (the units are elided). Another example is the unfortunate x-label in the two new sub-plots of Plot 4, in which "datetime" column name for the combined date/time is exposed, despite the poor aesthetics of that label.

### Source files
This repository contains **5** R script files. I chose **not** to repeat the IO and pre-processing for each plot, but the project specifications specify that each plot file should read the data. Therefore, hpcPrepAndPlot.R loads, preps, and plots the data. The load and prep is performed in a function titled loadPrepHPC, which is invoked in cacheHPC. CacheHPC is passed a 4-(function) member list that manages a cache of file name and the loaded & prepped data table. When the cache is empty, cacheHPC invokes the load etc. The resulting data table is cached and re-used. The other 4 R script files define the individual plot functions, Plot1.R, Plot2.R, Plot3.R, Plot4.R. The functions plot2 and plot3 are also used to create sub-plots of Plot4. Note that minor differences in the appearance of plots 2 and 3 when re-used as sub-plots require a flag, also used to indicate that the sub-plot doesn't need to open the PNG device.
The entire processing flow is as follows, driven by hpcPrepAndPlot.R script:

1. Load necessary libraries (data.table)

2. Preserve and set working directory.

3. Load the plotting functions.

4. Initialize the cache (cache empty, but with the desired file name).

5. Generate each plot. The first plot loads the cache. The plots are straight forward use of the base plotting package functions hist, plot, line and legend, except for the minor variations in plots 2 and 3 when used as sub-plots. Plot4 invokes specific functions for each sub-plot after configuring the plot device for 2 X 2 sub-plots.


## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

