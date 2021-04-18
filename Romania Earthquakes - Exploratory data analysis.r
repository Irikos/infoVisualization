setwd("C:/Users/Ana-Maria's Laptop/Documents/GitHub/infoVisualization")
csv_file = "eartquakes_Romania.csv"
dataset <- read.csv(file = csv_file)
write.csv(dataset)