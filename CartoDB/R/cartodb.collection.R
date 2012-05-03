cartodb.collection <-
function(table.name = NULL, table.columns = NULL, table.sql = NULL, asJson = FALSE) {
    if (is.character(table.name)){
        if (is.character(table.columns)){
            table.sql <- paste("SELECT ", paste(table.columns, collapse=","), " FROM ", table.name,sep='')
        } else {
            table.sql <- paste("SELECT * FROM ", table.name,sep='')
        }
    }
    if (is.character(table.sql)){
        url <- cartodbSqlApi()
        cartodb.collection.get<-getURL(URLencode(paste(url,"q=",table.sql,sep='')))
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
