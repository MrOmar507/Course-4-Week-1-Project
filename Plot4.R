#Using the firsts function in plot 1 and plot 2

# Transforming the Date and Time vars

Subpower$Time <- strptime(Subpower$Time, format="%H:%M:%S")

Subpower$Date <- as.Date(Subpower$Date, format="%d/%m/%Y")

Subpower[1:1440,"Time"] <- format(Subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")

Subpower[1441:2880,"Time"] <- format(Subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Creating a PNG Image
png("plot4.png", width=480, height=480) 

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function 
plot(Subpower$Time, Subpower$Voltage, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Subpower$Time, Subpower$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Subpower$Time, Subpower$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Subpower$Time, Subpower$Sub_metering_2, type="l", col="red")
lines(Subpower$Time, Subpower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Subpower$Time, Subpower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


#Closing Image 
dev.off()