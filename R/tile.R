cartodb.tile <- function(tile.x, tile.y, tile.z, table.name = NULL, table.query = NULL) {
    if (is.number(tile.x) && is.number(tile.y) && is.number(tile.z)){
        if (is.character(table.name)){
            url <- cartodbMapsApi()
            if (is.character(table.query)){
                cartodb.tile.png <- getURL(URLencode(paste(url,table.name,"/",z,"/",x,"/",y,".png",sep='')))
            } else { 
                cartodb.tile.png <- getURL(URLencode(paste(url,table.name,"/",z,"/",x,"/",y,".png?q=",table.query,sep='')))
            }
            return(cartodb.tile.png)
        } else {
            warning("You must supply the table name you are querying")
        }
    } else {
        warning("You must supply XYZ coordinates for your tile")
    }
}