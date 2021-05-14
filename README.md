# Info Visualisation 

Earthquakes in Romania are a major cause of the disaster and sometimes death. It is important to recognize patterns in their behavior as this can help us minimize the caused damage. We did identify some known patterns, such as the 2 important clusters, and analyzed the difference between them (such as, the earthquakes in Vrancea county are deeper, more often and more devastating).

Predicting them with time series is next to impossible, as there are many factors. Either way, if we do look at them, there is a clear seasonality to it. Based on that, we are expecting a major earthquake in the following years.

> Source code file: infoVisualisationNotebook.Rmd

> Readable notebook: infoVisualisationNotebook.html

> Dataset: eartquakes_Romania.csv

# Dataset description

Describing the dataset: time - self-explanatory, includes: year, month, day, hour, minute, seconds, milliseconds latitude & longitude - the coordinates of the earthquake source depth - the depth at which it originated mag - the physical size of the earthquake Great 8 or more Major 7 - 7.9 Strong 6 - 6.9 Moderate 5 - 5.9 Light 4 - 4.9 Minor 3 - 3.9 magType - category based on magnitude range and distance range. Details: https://www.usgs.gov/natural-hazards/earthquake-hazards/science/magnitude-types?qt-science_center_objects=0#qt-science_center_objects

* nst: number of seismic stations which reported P- and S- arrival times for the earthquake
* gap: azimuthal gap range (range: 0 to 360)
* dmin: distance from the epicenter to the nearest station. In general, the smaller this number, the more reliable the * * * * calculated depth of the earthquake
* rms: root-mean-squared residual of solution (range: 0. to 1.)
* id
* updated
* place: explained in km and cardinal direction from nearest relevant settlement type - if it is an earthquake or something else. All of them are the same type, we ignore this column
* horizontalError
* depthError
* magError
* magNst: number of stations that reported the magnitude status: all of them are reviewed
* locationSource: the source of the earthquake location data (the data is taken from multiple websites)
* magSource: the source of the earthquake magnitude data (the data is taken from multiple websites)
* timeYear: the date at which it occured (year, month and day)
* timeDay: the time at which it occured (hour, minutes, seconds, milliseconds)
* year
* month
* yearInt: same as year, but as int datatype, in order to use it for animated graphs

# Variance

We start by exploring the variance in the dataset. This way we can better understand each column, besides its initial definition.

```bash
mag_hist <- ggplot(df) + 
  geom_histogram(mapping = aes(x = mag), fill = "steelblue", bins = 40) +
  theme_minimal()
mag_hist + ggtitle("Number of recorded earthquakes by magnitude")
```

![alt text](https://i.imgur.com/qBwFKuG.png)

# Prediction

![alt text](https://i.imgur.com/xYG4rMl.png)

> Authors:

> Andrei Dumitriu 507AI
 
> Ana-Maria Melinte 507AI

