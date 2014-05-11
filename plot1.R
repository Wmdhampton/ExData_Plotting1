#Loads data in a usable format from original txt file (from working directory)
power=read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- as.Date(as.factor(power$Date),format="%d/%m/%Y")
pow <- subset(power, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
pow$Date <- as.factor(pow$Date)
pow$DateTime <- strptime(paste(pow$Date, pow$Time), format="%Y-%m-%d %H:%M:%S")
pow$Global_active_power=as.numeric(as.character(pow$Global_active_power)
pow$Global_reactive_power=as.numeric(as.character(pow$Global_reactive_power))
pow$Voltage=as.numeric(as.character(pow$Voltage))

#Plots histogram of Global Power
png('plot1.png',width=480,height=480)
hist(a,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()