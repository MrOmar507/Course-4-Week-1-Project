#Reading, naming and subsetting power consumption data
Power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Subpower <- subset(Power,Power$Date=="1/2/2007" | Power$Date =="2/2/2007")

#Create a PNG Image
png("plot1.png", width=480, height=480)

#Using hist function
hist(as.numeric(Subpower$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kW)")

#Closing the image
dev.off()