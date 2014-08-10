# Exploratory Data Analysis - Course Project 1
# Load data 
# data from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

datetime <- function(date, time) {
    return (strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

loaddata <- function() {
    filename <- "exdata-data-household_power_consumption/household_power_consumption.txt"
    df <- read.table(filename,
                     header=TRUE,
                     sep=";",
                     colClasses=c("character", "character", rep("numeric",7)),
                     na="?")
    # convert date time 
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    # filter data from 2007-02-01 to 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
    
    return(df)
   
}