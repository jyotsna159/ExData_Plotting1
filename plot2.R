
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE,sep = ";")
data_Feb <- subset(data, as.Date(data$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(data$Date,"%d/%m/%Y")=="2007-02-02")

library(datasets)

plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Global_active_power)),
     type="l",ylab = "Global Active Power (kilowatts)",xlab = "")


dev.copy(png,file="plot2.png")
dev.off()

