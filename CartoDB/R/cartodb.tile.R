cartodb.tile <-
function(name = NULL, x = NULL, y = NULL, z = NULL, sql = NULL) {
    if (is.numeric(x) && is.numeric(y) && is.numeric(z)){
        if (is.character(name)){
            url <- cartodbMapsApi()
            if (is.character(sql)){
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png?q=",sql,sep=''))
            } else { 
                cartodb.tile <- URLencode(paste(url,name,"/",z,"/",x,"/",y,".png",sep=''))
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
