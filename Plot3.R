#Using the firsts function in plot 1 and plot 2

#Creating a PNG Image
png("plot3.png", width=480, height=480) 

# Calling the basic plot functions
plot(Subpower$Time,Subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))

with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))

with(Subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

#Closing the image
dev.off()