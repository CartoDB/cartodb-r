library(rgdal)
library(maptools)
library(RCurl)
library(RJSONIO)
library(CartoDB)

# Setup our CartoDB Connection
cartodb_account_name = "viz2"; 
cartodb(cartodb_account_name)

# CartoDB the_geom columns are always the following proj string
crs <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

# Get OSM polygons for Riyadh
polyUrl <- cartodb.collection("riyadh_osm_polygon", columns=c("cartodb_id","the_geom"), omitNull=TRUE,method="GeoJSON", urlOnly=TRUE)
riyadh.poly<-readOGR(polyUrl,p4s=crs,layer = 'OGRGeoJSON')

# Get OSM roads for Riyadh
roadUrl <- cartodb.collection("riyadh_osm_roads", columns=c("cartodb_id","the_geom"), omitNull=TRUE,method="GeoJSON", urlOnly=TRUE)
riyadh.roads<-readOGR(roadUrl,p4s=crs,layer = 'OGRGeoJSON')

# Get OSM railways for Riyadh
railUrl <- cartodb.collection(sql="SELECT cartodb_id, the_geom FROM riyadh_osm_line WHERE railway IS NOT NULL",method="GeoJSON",urlOnly=TRUE)
riyadh.rails<-readOGR(railUrl,p4s=crs,layer = 'OGRGeoJSON')

# Plot the polygons and roads on a small map
plot(riyadh.poly,axes=TRUE, border="gray",col="#A2CD5A",bg="white")
lines(riyadh.roads, col="#3a3a3a", lwd=1)
lines(riyadh.rails, col="burlywood3", lwd=3)