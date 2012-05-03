cartodb.collection <-
function(name = NULL, columns = NULL, geomAs = "XY", limit = NULL, sql = NULL, asJson = FALSE) {
    if (is.character(name)){
        # Method to handle geomAs parameter
        geomCol <- function(option) { 
            if (option=="XY") { return('ST_X(the_geom) AS the_geom_x, ST_Y(the_geom) AS the_geom_y,null as the_geom') }
            else if (option=="WKT") { return('ST_AsText(the_geom) AS the_geom') }
            else if (option=="GeoJSON") { return('ST_AsGeoJSON(the_geom) AS the_geom') }
            else if (option=="WKB") { return('the_geom as the_geom') }
            else if (option=="the_geom") { return('the_geom') }
            else if (is.null(option)) { return(NULL) }
            else { return('ST_X(the_geom) AS the_geom_x, ST_Y(the_geom) AS the_geom_y,null as the_geom') }
        }
        if (is.list(columns)){
            sql <- paste("SELECT ", paste(columns, collapse=","), " FROM ", name,sep='')
        } else {
            sql <- paste("SELECT *, NULL as the_geom_webmercator,",geomCol(geomAs)," FROM ", name,sep='')
        }
        if (is.numeric(limit)) {
            sql <- paste(sql,"LIMIT",limit)
        }
    }
    if (is.character(sql)){
        url <- cartodbSqlApi()
        cartodb.collection.get<-getURL(URLencode(paste(url,"q=",sql,sep='')))
        if(asJson==FALSE){
            cartodb.collection.json<-fromJSON(cartodb.collection.get[[1]])
            if ( 'rows' %in% names(cartodb.collection.json)) {
                df <- jsonToDataFrame(cartodb.collection.json$rows)
                # remove null columns from geom transformations
                if (is.character(name)){
                    if(geomAs!="XY"){
                        df <- df[,!(colnames(df) %in% c("the_geom_webmercator"))]
                    } else {
                        df <- df[,!(colnames(df) %in% c("the_geom","the_geom_webmercator"))]
                    }
                }
                return(df)
            } else {
                warning(cartodb.collection.json)
                return(NULL)
            }
        } else {
            return(as.character(cartodb.collection.get))
        }
    } else {
        warning("You must supply a table name")
    }
}
