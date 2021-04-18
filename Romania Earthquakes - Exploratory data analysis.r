attach(mtcars)

setwd("C:/Users/Ana-Maria's Laptop/Documents/GitHub/infoVisualization")
csv_file = "eartquakes_Romania.csv"
df <- read.csv(file = csv_file)
write.csv(df)

year <- df&time
dataset_agg <- aggregate(df$depth,by=list(df$Date),sum,na.rm=TRUE)
df <- cbind(df, year)
df$dateTime = pd.to_datetime(df&time)
data_ts <- ts(dataset_agg, start = 1975)
acf(data_ts, main = "Earthquake - ACF")

plot(df$depth, df$mag, main="Scatterplot - Depth & magnitude correlation",
     xlab="Earthquake depth", ylab="Earthquake maginitude", pch=19)

plot(df$longitude, df$mag, main="Scatterplot - Longitude & magnitude correlation",
     xlab="Earthquake longitude", ylab="Earthquake maginitude", pch=19)

plot(df$latitude, df$mag, main="Scatterplot - Latitude & magnitude correlation",
     xlab="Earthquake latitude", ylab="Earthquake maginitude", pch=19)

plot(df$longitude, df$depth, main="Scatterplot - Longitude & magnitude correlation",
     xlab="Earthquake longitude", ylab="Earthquake depth", pch=19)

plot(df$latitude, df$depth, main="Scatterplot - Latitude & latitude correlation",
     xlab="Earthquake latitude", ylab="Earthquake depth", pch=19)
