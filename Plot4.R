## Read subset of data
mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myfile <- "./household_power_consumption.txt"
mydata <- read.csv.sql(myfile, sql=mysql, sep=";")

#Add a column that concatenates Date and Time
mydata$DateTime <- cbind(paste(mydata$Date, mydata$Time))

##Convert date/time values to r's date/time format
mydata$DateTime <- strptime(mydata$DateTime,"%d/%m/%Y %H:%M:%S")

#Create a line graph of Global Active Power over two day period
png(file = "Plot4.png")  ## Open png device; create 'Plot4.png' in working directory
par(mfrow = c(2,2))

#Plot1
with(mydata, plot(DateTime, Global_active_power, type = "l",
                  ylab = "Global Active Power",  
                  xlab = ""))

#Plot2
with(mydata, plot(DateTime, Voltage, type = "l",
                  ylab = "Voltage",  
                  xlab = "datetime"))

#Plot3
with(mydata, plot(DateTime, Sub_metering_1, type = "l",
                  ylab = "Energy sub metering",  
                  xlab = ""))
par(new=TRUE)
with(mydata, lines(DateTime, Sub_metering_2, type="l", col="red" ))
with(mydata, lines(DateTime, Sub_metering_3, type="l", col="blue"))
#Add legends in the topright corner of the graph
legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                              "Sub_metering_3"), col = c("black","red","blue"),lty = "solid")

#Plot4
with(mydata, plot(DateTime, Global_reactive_power, type = "l",
                  ylab = "Global_reactive_power",  
                  xlab = "datetime"))
dev.off()  ## Close the PNG file device