## ------------------------------------------------------------------------
# Geolife trajectories,
# documentation: http://research.microsoft.com/apps/pubs/?id=152176 :
# data: http://research.microsoft.com/en-us/projects/geolife/
# or http://ftp.research.microsoft.com/downloads/b16d359d-d164-469e-9fd4-daa38f2b2e13/Geolife%20Trajectories%201.2.zip

# assuming we are in the "Data" directory, e.g. by:
# setwd("/home/edzer/Downloads/Geolife Trajectories 1.3/Data/")

library(sp)
library(spacetime)
library(trajectories)
#sel = 1:20
sel = IDS = c("079", "095", "111", "127", "143", "159", "175")
i = j = 1
# dirs = list.files("Data")
dirs = sel
crs = CRS("+proj=longlat +ellps=WGS84")
pb = txtProgressBar(style = 3, max = length(dirs))
elev = numeric(0)
tr = list()
for (d in dirs) {
	dir = paste(d, "Trajectory", sep = "/")
	#print(dir)
	lst = list()
	i = 1
	for (f in list.files(dir, pattern = "*plt", full.names = TRUE)) {
		tab = read.csv(f, skip = 6, stringsAsFactors=FALSE)
		tab$time = as.POSIXct(paste(tab[,6],tab[,7]))
		tab[tab[,4] == -777, 4] = NA # altitude 
		tab = tab[,-c(3,5,6,7)]
		names(tab) = c("lat", "long", "elev", "time")
		tab = na.omit(tab)
		dup = duplicated(tab["time"])
		if (any(dup))
			tab = tab[-dup,]
		tab = tab[c(TRUE, diff(tab$time) != 0),]
		if (all(tab$lat > -90 & tab$lat < 90 & tab$long < 360 
				& tab$long > -180) && nrow(tab) > 1) {
			lst[[i]] = Track(STIDF(SpatialPoints(tab[,2:1], crs), tab$time,
				data.frame(elev=elev)))
			i = i+1
		}
	}
	if (length(lst) > 0) {
		tr[[j]] = Tracks(lst)
		j = j+1
	}
	setTxtProgressBar(pb, j)
}
tc = TracksCollection(tr)
object.size(tc)
dim(tc)
object.size(tr)

plot(tc, xlim=c(116.3,116.5),ylim=c(39.8,40))
stplot(tc, xlim=c(116.3,116.5),ylim=c(39.8,40), col = 1:20)
