## Read subset of data
mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myfile <- "./household_power_consumption.txt"
mydata <- read.csv.sql(myfile, sql=mysql, sep=";")

#Add a column that concatenates Date and Time
mydata$DateTime <- cbind(paste(mydata$Date, mydata$Time))

##Convert date/time values to r's date/time format
mydata$DateTime <- strptime(mydata$DateTime,"%d/%m/%Y %H:%M:%S")

#Create a line graph of Global Active Power over two day period
png(file = "Plot2.png")  ## Open png device; create 'Plot2.png' in working directory
with(mydata, plot(DateTime, Global_active_power, type = "l",
                  ylab = "Global Active Power (Kilowatts)",  
                  xlab = ""))
dev.off()  ## Close the PNG file device
