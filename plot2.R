#Plot 2

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
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

date <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot and saving on a png file
png(filename = "plot2.png", width = 480, height = 480)

plot(x = date, y = dataset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

dev.off()
