cartodb <-
function(account.name, api.key = NULL) {
    .CartoDB$data <- list(
        api.key=NULL,
        account.name=NULL,
        api.sql=".cartodb.com/api/v2/sql",
        api.maps=".cartodb.com/tiles/"
        )
    if(is.character(api.key)){
        .CartoDB$data$api.key<-api.key   
    } else{
        warning("Without an API key you are limited to read-only")
    }
    if(is.character(account.name)){
        .CartoDB$data$account.name<-account.name
    } else{
        error("Account name must be a string")
    }
}

cartodb.test <- function() {
    url <- cartodbSqlApi()
    records<-getURL(URLencode(paste(url,"q=SELECT 1",sep='')))
    json<-fromJSON(records[[1]])
    if ( 'rows' %in% names(json)) {
        return(TRUE)
    } else {
        return(FALSE)
    }
}