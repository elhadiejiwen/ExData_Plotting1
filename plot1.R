
#### plot 1 #########
dt = read.table("household_power_consumption.txt", header = TRUE, sep= ";")
dt$Date = as.Date(dt$Date, format= "%d/%m/%Y")
df = subset(dt, dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01")
date_time = paste(df$Date, df$Time)
date_time = strptime(date_time, "%Y-%m-%d %H:%M:%S")
df1 = data.frame(df, date_time)

hist(as.numeric(df$Global_active_power), col="red", las = 0, xlab = "Global active power (Kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()





