cartodb.tiles.base <-
function() {
    return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.tile,sep='' ) )
}

cartodb.tiles.tile <-
function(name = NULL, x = NULL, y = NULL, z = NULL, sql = NULL, style=NULL, method="bytes", urlOnly=FALSE) {
    if (is.numeric(x) && is.numeric(y) && is.numeric(z)){
        if (method=="extents") {
            warning("TODO: method to return tile extents")
        } else if (is.character(name)){
            url <- cartodb.tiles.base()
            if (is.character(sql)){
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png?sql=",sql,sep=''))
                if(is.character(style)){
                    cartodb.tile <- paste(cartodb.tile,"&style=",URLencode(style),sep='')
                }
            } else { 
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png",sep=''))
                if(is.character(style)){
                    cartodb.tile <- paste(cartodb.tile,"?style=",URLencode(style),sep='')
                }
            }
            if(urlOnly==TRUE) {
                return(cartodb.tile)
            } else if(url.exists(cartodb.tile)){
                if(method=="bytes") {
                    buf = binaryBuffer()
                    getURI(cartodb.tile,
                        write = getNativeSymbolInfo("R_curl_write_binary_data")$address,
                        file = buf@ref)
                        cartodb.img = as(buf, "raw")
                    return(cartodb.img)
                } else if(method=="png") {
                    warning("TODO: method to return in-memory PNG")
                }
            } else {
                return(NULL)
            }
            warning("tile support in development, tile url returned")
            return(cartodb.tile)
        } else {
            warning("You must supply the table name you are querying")
        }
    } else {
        warning("You must supply XYZ coordinates for your tile")
    }
}
