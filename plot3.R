dt = read.table("household_power_consumption.txt", header = TRUE, sep= ";")
dt$Date = as.Date(dt$Date, format= "%d/%m/%Y")
df = subset(dt, dt$Date <= "2007-02-02" & dt$Date >= "2007-02-01")
date_time = paste(df$Date, df$Time)
date_time = strptime(date_time, "%Y-%m-%d %H:%M:%S")
df1 = data.frame(df, date_time)

limitations = c(as.POSIXct(strptime("2007-02-01","%Y-%m-%d" )),as.POSIXct(strptime("2007-02-03","%Y-%m-%d")))
plot(df1$date_time,df1$Sub_metering_1,axes=F,pch=16,type="l",xlim=limitations,cex=3,col="black",ylab="Energy sub metering",xlab="")
lines(df1$date_time, df1$Sub_metering_2, col= "red")
lines(df1$date_time,df1$Sub_metering_3, col="blue")


axis.POSIXct(1, at=seq(from=strptime("2007-02-01","%Y-%m-%d" ), to=strptime("2007-02-03","%Y-%m-%d" ), by="d"), format="%d", las=2, labels = c("thu", "fri", "sat"), las= 0) # force indiquant la date de chaque jour
# Ordonnées
axis(2,c(0, 10, 20,30))

legend("topright",legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"), col= c("black", "red", "blue"), lty= 1)
box()
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()