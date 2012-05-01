cartodb <-
function(account.name, api.key = NULL, asJson = TRUE) {
    .CartoDB$data$asJson<-asJson
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