
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE,sep = ";")
data_Feb <- subset(data, as.Date(data$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(data$Date,"%d/%m/%Y")=="2007-02-02")

library(datasets)
  
hist(as.numeric(as.character(data_Feb$Global_active_power)),main = "Global Active Power",xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",col = "red")

dev.copy(png,file="plot1.png")
dev.off()

