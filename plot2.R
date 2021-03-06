source("load_data.R")

plot2 <- function(data=NULL) {
    if(is.null(data))
        data <- loaddata()

    png("plot2.png", width=504, height=504)
    plot(data$Time, data$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    dev.off()
}