cartodb.maps.base <-
function() {
    return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.maps,sep='' ) )
}

cartodb.maps.link <-
function(name=NULL,sql = NULL, style=NULL) {
    if (is.character(name)){
        url <- cartodb.maps.base()
        if (is.character(sql)){
            cartodb.link <- URLencode(paste(url,name,"/embed_map?sql=",sql,sep=''))
            if (any(grep("[*]",sql))==FALSE & any(grep("the_geom_webmercator",sql)) == FALSE){
                warning('Embedded maps rely on the column, the_geom_webmercator. Be sure that it is included in your results.')
            }
            if(is.character(style)){
                cartodb.link <- paste(cartodb.link,"&style=",URLencode(style),sep='')
            }
        } else { 
            cartodb.link <- URLencode(paste(url,name,"/embed_map",sep=''))
            if(is.character(style)){
                cartodb.link <- paste(cartodb.link,"?style=",URLencode(style),sep='')
            }
        }
        if(url.exists(cartodb.link) != TRUE){
            warning(paste("Invalid url - check that your account name and table name are valid, also that your SQL is working: ",name, sep=""))
        }
        return(cartodb.link)
    } else {
        warning("You must supply the table name you are querying")
    }
}