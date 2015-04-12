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
  
  hist(as.numeric(as.character(refdata2$Global_active_power)), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  
  
  
}