# Reading, naming and subsetting power consumption data
Power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Subpower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")

# Transforming the Date and Time vars

Subpower$Time <- strptime(Subpower$Time, format="%H:%M:%S")

Subpower$Date <- as.Date(Subpower$Date, format="%d/%m/%Y")

Subpower[1:1440,"Time"] <- format(Subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")

Subpower[1441:2880,"Time"] <- format(Subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Creating a PNG Image
png("Plot2.png", width=480, height=480)

# calling the basic plot function
plot(Subpower$Time,as.numeric(as.character(Subpower$Global_active_power)),type="l",xlab=" ",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

#Closing the image
dev.off()