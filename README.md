

Info Visualisation Notebook

Set working directory

*# Ana's WD*

*# setwd("C:/Users/Ana-Maria's Laptop/Documents/GitHub/infoVisualization")*

*# Andrei's WD*

*# setwd("C:/Users/andre/Documents/infoVisualization/")*

Imports - libraries and read dataset

*#install.packages("png")*

*#install.packages("gifsky")*

*#install.packages("gganimate")*

*#install.packages("gapminder")*

*#install.packages("ggmap")*

*#install.packages("esquisse")*

*#install.packages("ggiraph")*

*#install.packages("gdtools")*

*#install.packages("leaflet") # interactive maps*

*#install.packages("plotly")*

**library**(ggplot2)

\## Warning: package 'ggplot2' was built under R version 4.0.5

**library**(gganimate)

\## Warning: package 'gganimate' was built under R version 4.0.5

**library**(gapminder)

\## Warning: package 'gapminder' was built under R version 4.0.5

*#library(tidyverse)*

**library**(ggmap)

\## Warning: package 'ggmap' was built under R version 4.0.5

\## Google's Terms of Service: https://cloud.google.com/maps-platform/terms/.

\## Please cite ggmap if you use it! See citation("ggmap") for details.

**library**(ggiraph)

\## Warning: package 'ggiraph' was built under R version 4.0.5

**library**(esquisse)

\## Warning: package 'esquisse' was built under R version 4.0.5

**library**(leaflet)

\## Warning: package 'leaflet' was built under R version 4.0.5

**library**(plotly)

\## Warning: package 'plotly' was built under R version 4.0.5

\##

\## Attaching package: 'plotly'

\## The following object is masked from 'package:ggmap':

\##

\##

wind

\## The following object is masked from 'package:ggplot2':

\##

\##

last\_plot

\## The following object is masked from 'package:stats':

\##

\##

filter

\## The following object is masked from 'package:graphics':

\##

\##

layout

*# esquisser(df)*

earthquakes\_csv = "eartquakes\_Romania.csv"

df <- read.csv(file = earthquakes\_csv)

*# convert time column to R timestap*

df$time <- gsub('T', ' ', df$time)

df$time <- gsub('Z', '', df$time)

df$time <- as.POSIXct(df$time, format="%Y-%m-%d %H:%M:%OS", tz=Sys.timezone())

*#split timestamp into date and time*

df$timeYear <- as.Date(df$time)

df$timeDay <- format(df$time, "%H:%M:%OS")

df$year <- format(df$time, "%Y")

df$month <- format(df$time, "%m")

df$yearInt <- as.integer(df$year)

*# see data types*

str(df)

\## 'data.frame':

\## $ time

665 obs. of 27 variables:

: POSIXct, format: "2017-03-08 13:43:13" "2017-02-08 15:08:20" ...

: num 45.7 45.5 45.7 45.7 45.9 ...

\## $ latitude

\## $ longitude

\## $ depth

\## $ mag

: num 26.5 26.3 26.7 26.5 26.8 ...

: num 149 127 129 97 90 ...

: num 4.1 4.7 4.4 5.6 4.1 5.6 4.2 2.9 4.3 4.3 ...

: chr "mb" "mb" "mb" "mww" ...

\## $ magType

\## $ nst

: int NA NA NA NA NA NA NA NA NA NA ...

\## $ gap

: num 41 19 48 14 NA 10 73 NA NA 30 ...

\## $ dmin

: num 0.259 0.222 0.559 0.466 NA ...

\## $ rms

: num 0.76 1.1 1.23 0.8 1.43 0.96 0.68 1.18 0.63 1.09 ...

: chr "us" "us" "us" "us" ...

\## $ net

\## $ id

: chr "us100087pk" "us20008ii5" "us20008ifq" "us10007n3r" ...

: chr "2017-04-20T10:53:57.224Z" "2017-03-01T06:16:37.044Z" "2017-03-05T08:24:32.472Z" "201

\## $ updated

7-03-23T22:52:05.040Z" ...

\## $ place

: chr "19km N of Gura Teghii, Romania" "11km NNW of Nehoiu, Romania" "4km WNW of Nereju, Ro

mania" "14km W of Nereju, Romania" ...

\## $ type

: chr "earthquake" "earthquake" "earthquake" "earthquake" ...

\## $ horizontalError: num 3.2 6.6 6.4 4.3 6.7 4 3 4.2 3.8 4.9 ...

\## $ depthError

\## $ magError

\## $ magNst

: num 3.9 5.4 5.4 1.8 6.4 1.8 4.2 8 5 6.6 ...

: num 0.127 0.045 0.148 NA 0.157 NA 0.062 NA 0.265 0.111 ...

: int 17 152 13 NA 11 NA 25 NA 4 23 ...

\## $ status

: chr "reviewed" "reviewed" "reviewed" "reviewed" ...

\## $ locationSource : chr "us" "us" "us" "us" ...

\## $ magSource

\## $ timeYear

\## $ timeDay

\## $ year

: chr "us" "us" "us" "us" ...

: Date, format: "2017-03-08" "2017-02-08" ...

: chr "13:43:13" "15:08:20" "09:52:06" "23:20:56" ...

: chr "2017" "2017" "2017" "2016" ...

\## $ month

: chr "03" "02" "02" "12" ...

\## $ yearInt

: int 2017 2017 2017 2016 2016 2016 2016 2016 2016 2015 ...

Describing the dataset: time - self-explanatory, includes: year, month, day, hour, minute, seconds, milliseconds latitude & longitude - the

coordinates of the earthquake source depth - the depth at which it originated mag - the physical size of the earthquake Great 8 or more Major 7 -

7.9 Strong 6 - 6.9 Moderate 5 - 5.9 Light 4 - 4.9 Minor 3 - 3.9 magType - category based on magnitude range and distance range. Details:

<https://www.usgs.gov/natural-hazards/earthquake-hazards/science/magnitude-types?qt-science_center_objects=0#qt-science_center_objects>

nst - number of seismic stations which reported P- and S- arrival times for the earthquake gap - azimuthal gap range (range: 0 to 360) dmin -

distance from the epicenter to the nearest station. In general, the smaller this number, the more reliable the calculated depth of the earthquake rms

\- root-mean-squared residual of solution (range: 0. to 1.) net - ? id updated place - explained in km and cardinal direction from nearest relevant

settlement type - if it is an earthquake or something else. All of them are the same type, we ignore this column horizontalError depthError magError

magNst - number of stations that reported the magnitude status: all of them are reviewed locationSource - the source of the earthquake location

data (the data is taken from multiple websites) magSource - the source of the earthquake magnitude data (the data is taken from multiple

websites) Extracted columns timeYear - the date at which it occured (year, month and day) timeDay - the time at which it occured (hour, minutes,

seconds, milliseconds) year month yearInt - same as year, but as int datatype, in order to use it for animated graphs

We start by exploring the variance in the dataset. This way we can better understand each column, besides its initial definition.

mag\_hist <- ggplot(df) +

geom\_histogram(mapping = aes(x = mag), fill = "steelblue", bins = 40) +

theme\_minimal()

mag\_hist + ggtitle("Number of recorded earthquakes by magnitude")

year\_bar <- ggplot(df) +

geom\_bar(mapping = aes(y = year), fill = "steelblue") +

theme\_minimal()

year\_bar + ggtitle("Number of earthquakes per year (1990 - 2017)")

month\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = month), fill = "steelblue") +

theme\_minimal()

month\_bar + ggtitle("Number of earthquakes by month (1990 - 2017)")

depth\_bar <- ggplot(df) +

geom\_histogram(mapping = aes(x = depth), fill = "steelblue") +

theme\_minimal()

depth\_bar + ggtitle("Number of earthquakes by depth")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

magtype\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = magType), fill = "steelblue") +

theme\_minimal()

magtype\_bar + ggtitle("Magnitude type (category)")

nst\_bar <- ggplot(df) +

geom\_histogram(mapping = aes(x = nst), fill = "steelblue", bins=50) +

theme\_minimal()

nst\_bar + ggtitle("Nst - number of seismic stations reporting")

\## Warning: Removed 270 rows containing non-finite values (stat\_bin).

gap\_bar <- ggplot(df) +

geom\_histogram(mapping = aes(x = gap), fill = "steelblue") +

theme\_minimal()

gap\_bar + ggtitle("Gap Value (azimuthal gap range)")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 250 rows containing non-finite values (stat\_bin).

dmin\_bar <- ggplot(df) +

geom\_histogram(mapping = aes(x = dmin), fill = "steelblue") +

theme\_minimal()

dmin\_bar + ggtitle("Dmin Value (distance from epicenter)")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 620 rows containing non-finite values (stat\_bin).

rms\_bar <- ggplot(df) +

geom\_histogram(mapping = aes(x = rms), fill = "steelblue") +

theme\_minimal()

rms\_bar + ggtitle("Rms Value (root-mean-squared residual of solution)")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 331 rows containing non-finite values (stat\_bin).

net\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = net), fill = "steelblue") +

theme\_minimal()

net\_bar + ggtitle("Net Value")

type\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = type), fill = "steelblue") +

theme\_minimal()

type\_bar + ggtitle("Type of data entry")

status\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = status), fill = "steelblue") +

theme\_minimal()

status\_bar + ggtitle("Status of data entry")

locationSource\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = locationSource), fill = "steelblue") +

theme\_minimal()

locationSource\_bar + ggtitle("Location: data source")

magSourceSource\_bar <- ggplot(df) +

geom\_bar(mapping = aes(x = magSource), fill = "steelblue") +

theme\_minimal()

magSourceSource\_bar + ggtitle("Magnitude: data source")

horizontalError\_hist <- ggplot(df) +

geom\_histogram(mapping = aes(x = horizontalError), fill = "steelblue") +

theme\_minimal()

horizontalError\_hist + ggtitle("Horizontal Error")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 630 rows containing non-finite values (stat\_bin).

depthError\_hist <- ggplot(df) +

geom\_histogram(mapping = aes(x = depthError), fill = "steelblue") +

theme\_minimal()

depthError\_hist + ggtitle("Depth Error ")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 447 rows containing non-finite values (stat\_bin).

magError\_hist <- ggplot(df) +

geom\_histogram(mapping = aes(x = magError), fill = "steelblue") +

theme\_minimal()

magError\_hist + ggtitle("Magnitude Error")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 617 rows containing non-finite values (stat\_bin).

magNst\_hist <- ggplot(df) +

geom\_histogram(mapping = aes(x = magNst), fill = "steelblue") +

theme\_minimal()

magNst\_hist + ggtitle("Number of stations that reported the magnitude ")

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

\## Warning: Removed 403 rows containing non-finite values (stat\_bin).

We start by exploring the most obvious questions: where do most earthquakes happen, including their magnitude as well

ggplot(data=df) +

geom\_point(mapping = aes(x = longitude, y = latitude, color=mag))

As we can see, there is a big cluster where most earthquakes happen, with a smaller cluster that is noticeable, followed by sparsely distributed

cases Let’s now plot them on a map for a better visualization. Based on common knowledge of earthquakes in Romania, can you guess where the

main epicenter will be?

(we are using stamen source for the map, but the commented code also uses google maps. It requires an API key, though)

romania\_map <- get\_map("Brasov", maptype = "roadmap", zoom = 6)

\## Source : https://maps.googleapis.com/maps/api/staticmap?center=Brasov&zoom=6&size=640x640&scale=2&maptype=road

map&language=en-EN&key=xxx-e9WaBDXrHnFl2Tud9HT6DdUPuvs

\## Source : https://maps.googleapis.com/maps/api/geocode/json?address=Brasov&key=xxx-e9WaBDXrHnFl2Tud9HT6DdUPuvs

romania\_box <- c(20, 43, 30, 48.5)

romania\_map2 <- get\_map(location = romania\_box, **source** = "stamen", maptype = "toner", zoom = 7)

\## Source : http://tile.stamen.com/terrain/7/71/44.png

\## Source : http://tile.stamen.com/terrain/7/72/44.png

\## Source : http://tile.stamen.com/terrain/7/73/44.png

\## Source : http://tile.stamen.com/terrain/7/74/44.png

\## Source : http://tile.stamen.com/terrain/7/71/45.png

\## Source : http://tile.stamen.com/terrain/7/72/45.png

\## Source : http://tile.stamen.com/terrain/7/73/45.png

\## Source : http://tile.stamen.com/terrain/7/74/45.png

\## Source : http://tile.stamen.com/terrain/7/71/46.png

\## Source : http://tile.stamen.com/terrain/7/72/46.png

\## Source : http://tile.stamen.com/terrain/7/73/46.png

\## Source : http://tile.stamen.com/terrain/7/74/46.png

\## Source : http://tile.stamen.com/terrain/7/71/47.png

\## Source : http://tile.stamen.com/terrain/7/72/47.png

\## Source : http://tile.stamen.com/terrain/7/73/47.png

\## Source : http://tile.stamen.com/terrain/7/74/47.png

*#ggmap(romania\_map) +*

*# geom\_point(data = df, aes(x = longitude, y = latitude), color = "steelblue", size = 1)*

ggmap(romania\_map2) +

geom\_point(data = df, aes(x = longitude, y = latitude, color = mag), size = 1)

As we can see, most earthquakes are in Vrancea County, as expected.

Let’s also make an interactive map to play around it

We have colored each pin by earthquake classification type (based on magnitude) and have grouped them in clusters (and an extra without

clusters just for showcase).

green: minor blue: light pink: moderate orange: strong red: major black: great

As we can see, most of the recorder earthquakes are either minor or light. As we go up in magnitude, the number of earthquakes decreases.

getColor <- **function**(quakes) {

sapply(quakes$mag, **function**(mag) {

**if** (mag < 4) {

"green"

}

}

}

}

}

**else if** (mag < 5) {

"blue"

**else if** (mag < 6) {

"pink"

**else if** (mag < 7) {

"orange"

**else if** (mag < 8) {

"red"

**else** {

"black"

} })

}

icons <- awesomeIcons(

icon = 'ios-close',

iconColor = 'black',

**library** = 'ion',

markerColor = getColor(df)

)

leaflet(data = df) %>%

addTiles() %>%

addAwesomeMarkers(~longitude, ~latitude, popup = ~as.character(year), label = ~as.character(mag), icon=icons, c

lusterOptions = markerClusterOptions())

**+**

**−**

5

4

3

2

516

51

9

11

57

2

5

[Leaflet](https://leafletjs.com/)[ ](https://leafletjs.com/)| © [OpenStreetMap](http://openstreetmap.org/)[ ](http://openstreetmap.org/)contributors, [CC-BY-SA](http://creativecommons.org/licenses/by-sa/2.0/)

leaflet(data = df) %>%

addTiles() %>%

addAwesomeMarkers(~longitude, ~latitude, popup = ~as.character(year), label = ~as.character(mag), icon=icons)

**+**

**−**















































































[Leaflet](https://leafletjs.com/)[ ](https://leafletjs.com/)| © [OpenStreetMap](http://openstreetmap.org/)[ ](http://openstreetmap.org/)contributors, [CC-BY-SA](http://creativecommons.org/licenses/by-sa/2.0/)

Let’s start exploring covariance, as well - starting with the number of earthquakes per magnitude, each year. We started by using a barplot and a

freqpoly, but it is quite hard to get useful information due to different number of earthquakes in each year. Thus, we switched to density plot which

takes that into consideration, as well.

ggplot(data=df) +

geom\_bar(mapping = aes(x = mag, fill = year))

\## Warning: position\_stack requires non-overlapping x intervals

ggplot(data=df) +

geom\_freqpoly(mapping = aes(x = mag, color = year))

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(data=df) +

geom\_density(mapping = aes(x = mag, color = year))

Due to the number of years, it is still hard to read the graphs. Let’s use a facet\_wrap for a better understanding.

See? Way better.

ggplot(data=df) +

geom\_bar(mapping = aes(x = mag, fill = year)) +

facet\_wrap(~ year) +

theme\_minimal()

ggplot(data=df) +

geom\_freqpoly(mapping = aes(x = mag, color = year)) +

facet\_wrap(~ year) +

theme\_minimal()

\## `stat\_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(data=df) +

geom\_density(mapping = aes(x = mag, color = year)) +

facet\_wrap(~ year) +

theme\_minimal()

There is obviously a correlation between the location and the number of earthquakes. Let’s see if we can find other correlations, as well. How

about between the depth and the magnitude

ggplot(data=df) +

geom\_point(mapping = aes(x = depth, y = mag, color = year))

ggplot(data=df) +

geom\_point(mapping = aes(x = depth, y = mag, color = year)) +

facet\_wrap(~ year) +

theme\_minimal()

ggplot(data=df) +

geom\_line(mapping = aes(x = depth, y = mag, color = year)) +

facet\_wrap(~ year) +

theme\_minimal()

Ok, let’s switch to 3D plots as it seems we need to take into account more than 2 columns.

Starting with longitude, latitude and magnitude.

longlatmag <- plot\_ly(df, x = ~longitude, y = ~latitude, z = ~mag,

marker = list(color = ~mag, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE))

longlatmag <- longlatmag %>% add\_markers()

longlatmag <- longlatmag %>% layout(scene = list(xaxis = list(title = 'Longitude'),

yaxis = list(title = 'Latitude'),

zaxis = list(title = 'Magnitude')),

annotations = list(

x = 1.13,

y = 1.05,

text = 'Magnitude',

xref = 'mag',

yref = 'mag',

showarrow = FALSE

))

longlatmag

7

6.5

6

5.5

5

4.5

4

3.5

3

2.5

Ok, now let’s take a look at the latitude, longitude and depth.

It is interesting to see that while there are 2 obvious clusters regarding the location, one cluster (Vrancea one) definitely has earthquakes with more

depth. We have also colored them based on magnitude.

longlatdepth <- plot\_ly(df, x = ~longitude, y = ~latitude, z = ~depth,

marker = list(color = ~mag, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE))

longlatdepth <- longlatdepth %>% add\_markers()

longlatdepth <- longlatdepth %>% layout(scene = list(xaxis = list(title = 'Longitude'),

yaxis = list(title = 'Latitude'),

zaxis = list(title = 'Depth')),

annotations = list(

x = 1.13,

y = 1.05,

text = 'Magnitude',

xref = 'mag',

yref = 'mag',

showarrow = FALSE

))

longlatdepth

7

6.5

6

5.5

5

4.5

4

3.5

3

2.5

Let’s do some more 3D exploring. How do the errors look? And let’s color them based on magnitude to see if the errors are correlated with the

recorder magnitude

longlatdepth <- plot\_ly(df, x = ~horizontalError, y = ~depthError, z = ~magError,

marker = list(color = ~mag, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE))

longlatdepth <- longlatdepth %>% add\_markers()

longlatdepth <- longlatdepth %>% layout(scene = list(xaxis = list(title = 'Horizontal Error'),

yaxis = list(title = 'Depth Error'),

zaxis = list(title = 'Magnitude Error')),

annotations = list(

x = 1.13,

y = 1.05,

text = 'Magnitude',

xref = 'mag',

yref = 'mag',

showarrow = FALSE

))

longlatdepth

\## Warning: Ignoring 635 observations

7

6.5

6

5.5

5

4.5

4

3.5

3

2.5

Ok, now let’s take a look at some animations. (be patient when loading them) Not extremely useful, but super cool to look at!

ggplot(data = df) +

geom\_point(mapping = aes(x = longitude, y = latitude, color = mag)) +

labs(title = 'Year: {frame\_time}', x = 'Longitude', y = 'Latitude') +

transition\_time(yearInt) +

ease\_aes('linear')

ggplot(data = df) +

geom\_bar(mapping = aes(x = mag), fill = 'steelblue') +

labs(title = 'Year: {frame\_time}', x = 'Mag') +

transition\_time(yearInt) +

ease\_aes('linear')

….and we tried this library as well, but, for some reason, it doesn’t work. Too bad.

gg\_point = ggplot(data = df) +

geom\_point\_interactive(aes(x = longitude, y = latitude, color = year)) +

theme\_minimal()

