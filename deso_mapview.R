library(sf)
library(mapview)
library(dplyr)

deso_fil <- "DeSo_2018_v2.gpkg"

deso <- st_read(deso_fil, crs = 3006) %>% 
  filter(lan == '20')

mapview(deso)

# Save the spatial dataset
st_write(deso, "G:/Samhällsanalys/GIS/projekt/GIS-praktik/Waleed_Liv/Praktik_2023/deso_dalarna.gpkg")

