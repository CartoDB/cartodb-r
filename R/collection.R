cartodb.collection <- function(table.name = NULL, table.columns = NULL, table.query = NULL) {
    if (is.character(table.name)){
        if (is.character(table.columns)){
            table.query <- paste("SELECT ", paste(table.columns, collapse=","), " FROM ", table.name)
        } else {
            table.query <- paste("SELECT * FROM ", table.name)
        }
    }
    if (is.character(table.query)){
        cartodb.collection.get<-getURL(geo.url)
        cartodb.collection.data<-fromJSON(geo.get)
        return(as.character(cartodb.collection.data$rows))
    } else {
        warning("You must supply a table name")
    }
}