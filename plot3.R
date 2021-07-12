#Plot 3 

#Library
library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]

date <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot and saving on a png file

png(filename = "plot3.png", width = 480, height = 480)

with(dataset, plot(date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dataset, lines(date, Sub_metering_2, col = "red"))
with(dataset, lines(date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)

dev.off()