cartodb.collection <-
function(name = NULL, columns = NULL, geomAs = NULL, omitNull = FALSE, limit = NULL, sql = NULL, method = "dataframe",urlOnly=FALSE) {
    if (is.character(name)){
        sql<-cartodb.sql.fromParams(name=name,geomAs=geomAs,columns=columns,omitNull=omitNull,limit=limit)
    }
    if (is.character(sql)){
        url <- cartodb.sql.base()
        if (method=="GeoJSON"){
            url <- URLencode(paste(url,"format=geojson&q=",sql,sep=''))
            if (urlOnly==TRUE) return(url)
            # Enable cartodb.sql here
            cartodb.collection.get<-getURL(url)
        } else if(method=="dataframe"){
            df<-cartodb.df(sql)
            if ( !is.null(df) ) {
                if (!is.null(name) & is.character(name)){
                    if(!is.list(columns)) {
                        if(is.null(geomAs) || geomAs!="XY"){
                            df <- df[,!(colnames(df) %in% c("the_geom_webmercator"))]
                        } else {
                            df <- df[,!(colnames(df) %in% c("the_geom","the_geom_webmercator"))]
                        }
                    }
                }
                return(df)
            } else {
                return(NULL)
            }
        } else {
            return(as.character(cartodb.collection.get))
        }
    } else {
        warning("You must supply a table name")
    }
}
