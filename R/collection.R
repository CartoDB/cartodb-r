cartodb.collection <- function(table.name = NULL, table.columns = NULL, table.query = NULL) {
    if (is.character(table.name)){
        if (is.character(table.columns)){
            table.query <- paste("SELECT ", paste(table.columns, collapse=","), " FROM ", table.name)
        } else {
            table.query <- paste("SELECT * FROM ", table.name)
        }
    }
    if (is.character(table.query)){
        url <- cartodbSqlApi()
        cartodb.collection.get<-getURL(URLencode(paste(url,"q=",table.query,sep='')))
        cartodb.collection.data<-fromJSON(geo.get)
        if(.CartoDB$data$asJson){
            return(jsonToDataFrame(as.character(cartodb.collection.data$rows)))
        } else {
            return(as.character(cartodb.collection.data$rows))
        }
    } else {
        warning("You must supply a table name")
    }
}