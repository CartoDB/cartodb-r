cartodb.collection <-
function(name = NULL, columns = NULL, sql = NULL, geomAs = "XY", asJson = FALSE) {
    if (is.character(name)){
        if (is.character(columns)){
            sql <- paste("SELECT ", paste(columns, collapse=","), " FROM ", name,sep='')
        } else {
            sql <- paste("SELECT * FROM ", name,sep='')
        }
    }
    if (is.character(sql)){
        url <- cartodbSqlApi()
        cartodb.collection.get<-getURL(URLencode(paste(url,"q=",sql,sep='')))
        if(asJson==FALSE){
            cartodb.collection.json<-fromJSON(cartodb.collection.get[[1]])
            if ( 'rows' %in% names(cartodb.collection.json)) {
                return(jsonToDataFrame(cartodb.collection.json$rows))
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
