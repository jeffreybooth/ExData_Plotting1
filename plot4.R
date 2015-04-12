plotting <- function () {
  
  library(data.table)
  
  setwd("C:/Users/J/Documents/Coursera/Course4/Project1")
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
  
  
  refdata1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  date <- as.character(refdata1[,1])
  time <- as.character(refdata1[,2])
  date.time <- paste(date, time, sep = " ")
  date.time <- strptime(date.time, "%d/%m/%Y %H:%M:%S")
  
  refdata2 <- data.table(date.time, refdata1[,3:9])
  
  par(mfrow = c(2,2))
  
  plot(refdata2$date.time,as.numeric(as.character(refdata2$Global_active_power)),type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  plot(refdata2$date.time,as.numeric(as.character(refdata2$Voltage)),type = "l", xlab = "datetime", ylab = "Voltage")
  
  SUB1 <- as.numeric(as.character(refdata2$Sub_metering_1))
  SUB2 <- as.numeric(as.character(refdata2$Sub_metering_2))
  SUB3 <- as.numeric(as.character(refdata2$Sub_metering_3))
  
  plot(refdata2$date.time,SUB1,type = "l", xlab = "", ylab = "Energy sub metering")
  points(refdata2$date.time,SUB2,type="l", col = "red")
  points(refdata2$date.time,SUB3,type="l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, cex = 0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(refdata2$date.time,as.numeric(as.character(refdata2$Global_reactive_power)),type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  
}