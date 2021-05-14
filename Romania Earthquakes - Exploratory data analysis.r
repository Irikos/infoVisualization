# Needed for ggplot2. Only if not already installed on machine
# install.packages("tidyverse")
# reference for ggplot: https://r4ds.had.co.nz/data-visualisation.html
library(ggplot2)

attach(mtcars)

# Ana's WD
#setwd("C:/Users/Ana-Maria's Laptop/Documents/GitHub/infoVisualization")

#Andrei's WD
setwd("C:/Users/andre/Documents/infoVisualization")
csv_file = "eartquakes_Romania.csv"
df <- read.csv(file = csv_file)
write.csv(df)

year <- df&time
dataset_agg <- aggregate(df$depth,by=list(df$Date),sum,na.rm=TRUE)
df <- cbind(df, year)
df$dateTime = pd.to_datetime(df&time)
data_ts <- ts(dataset_agg, start = 1975)
acf(data_ts, main = "Earthquake - ACF")

print(df)

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


# plots from above, switched to ggplot2. Ana, remove the ones above once you see this
ggplot(data=df) + 
        geom_point(mapping = aes(x = depth, y = mag), color = "red" ) +
        xlab('Earthquake Depth') + ylab("Earthquake Magnitude")

ggplot(data=df) + 
        geom_point(mapping = aes(x = longitude, y = mag), color = "red" ) +
        xlab('Earthquake Longitude') + ylab("Earthquake Magnitude")

ggplot(data=df) + 
        geom_point(mapping = aes(x = latitude, y = mag), color = "red" ) +
        xlab('Earthquake Latitude') + ylab("Earthquake Magnitude")

ggplot(data=df) + 
        geom_point(mapping = aes(x = longitude, y = depth), color = "red" ) +
        xlab('Earthquake Longitude') + ylab("Earthquake Depth")

ggplot(data=df) + 
        geom_point(mapping = aes(x = latitude, y = depth), color = "red" ) +
        xlab('Earthquake Latitude') + ylab("Earthquake Depth")




