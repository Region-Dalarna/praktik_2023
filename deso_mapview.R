library(sf)
library(mapview)

deso_fil <- "DeSo_2018_v2.gpkg"
deso <- st_read(deso_fil, crs = 3006)

mapview(deso)
