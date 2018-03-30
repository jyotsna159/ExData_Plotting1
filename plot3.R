
data <- read.table("./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE,sep = ";")
data_Feb <- subset(data, as.Date(data$Date,"%d/%m/%Y")=="2007-02-01" | as.Date(data$Date,"%d/%m/%Y")=="2007-02-02")

library(datasets)


with(data_Feb,plot(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_1)),
                   type="n",xlab = "",ylab = "Energy sub metering"))
with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_1))
                    ,col ="black"))
with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_2))
                    ,col ="red"))
with(data_Feb,lines(as.POSIXct(paste(data_Feb$Date, data_Feb$Time), format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(data_Feb$Sub_metering_3))
                    ,col ="blue"))
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png,file="plot3.png")
dev.off()

