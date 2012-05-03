cartodb.tile <-
function(name = NULL, x = NULL, y = NULL, z = NULL, sql = NULL, method="bytes") {
    if (is.numeric(x) && is.numeric(y) && is.numeric(z)){
        if (method=="extents") {
            warning("TODO: method to return tile extents")
        } else if (is.character(name)){
            url <- cartodbMapsApi()
            if (is.character(sql)){
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png?q=",sql,sep=''))
            } else { 
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png",sep=''))
            }
            if(method=="URL") {
                return(cartodb.tile)
            } else if(url.exists(cartodb.tile)){
                if(method=="bytes") {
                    buf = binaryBuffer()
                    getURI(cartodb.tile,
                        write = getNativeSymbolInfo("R_curl_write_binary_data")$address,
                        file = buf@ref)
                        cartodb.img = as(buf, "raw")
                    return(cartodb.img)
                } else if(method=="PNG") {
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
