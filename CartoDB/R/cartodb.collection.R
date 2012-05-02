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
        cartodb.collection.data<-fromJSON(cartodb.collection.get)
        if(asJson){
            return(jsonToDataFrame(as.character(cartodb.collection.data$rows)))
        } else {
            return(as.character(cartodb.collection.data$rows))
        }
    } else {
        warning("You must supply a table name")
    }
}
