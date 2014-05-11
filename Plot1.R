## Read subset of data
mysql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myfile <- "./household_power_consumption.txt"
mydata <- read.csv.sql(myfile, sql=mysql, sep=";")

#Create a histrogram of Global Active Power
png(file = "Plot1.png")  ## Open png device; create 'Plot1.png' in working directory
hist(mydata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()  ## Close the PNG file device