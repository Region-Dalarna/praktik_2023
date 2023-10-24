library(sf)
library(mapview)
library(dplyr)

deso_fil <- "DeSo_2018_v2.gpkg"

deso <- st_read(deso_fil, crs = 3006) %>% 
  filter(lan == '20') %>% 
  select(deso, kom_kod = kommun, kommun = kommunnamn)

deso_kom <- deso %>% 
  group_by(kom_kod) %>% 
  summarize(geometry = st_union(geom))

mapview(deso_kom)

# Save the spatial dataset
st_write(deso, "G:/Samhällsanalys/GIS/projekt/GIS-praktik/Waleed_Liv/Praktik_2023/deso_dalarna.gpkg")



#Tar bort alla kommungränser med Dissolve

deso_utan_kom <- deso %>%
  group_by(lan) %>%
  summarize(geometry = st_union(geom))




#Buffer
dalarna_buffer <- st_buffer(deso_utan_kom, 10000)
mapview(dalarna_buffer)+
  mapview(deso, zcol = "kommun")
