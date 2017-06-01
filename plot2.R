library(dplyr)

## Download the zip file and read the data
setwd("D://R//Course 4//Assignment1")
Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url,destfile=".//File.zip")
unzip(zipfile=".//File.zip",exdir=".")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

## Only load 1-2 Feb 2007 data, and convert their dates 

SelectedData <- tbl_df(data)
SelectedData <- filter(SelectedData, Date == "2/2/2007" | Date == "1/2/2007")
SelectedData$"Date/Time"<-paste(SelectedData$Date, SelectedData$Time)
SelectedData$"Date/Time"<- strptime(SelectedData$"Date/Time", format = "%d/%m/%Y %H:%M:%S")

plot(SelectedData$`Date/Time`, as.numeric(SelectedData$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy (png, file = "plot2.png", width=480, height = 480)
dev.off()