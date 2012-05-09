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
        warning("Account name must be a string")
    }
}

cartodb.test <- function() {
    url <- cartodbSqlApi()
    warning(url)
    records<-getURL(URLencode(paste(url,"q=SELECT 1",sep='')))
    json<-fromJSON(records[[1]])
    response<-data.frame(success=FALSE)
    if ( 'rows' %in% names(json)) {
        response$success = TRUE
    } else {
        warning(paste("Be sure that your account name,",.CartoDB$data$account.name, "is spelled correctly and that you have a working connection to the internet."))
        response$success = FALSE
    }
    return(response)
}
cartodb.transformGeom<-
function(option=NULL) {
    if (is.null(option)) { return('the_geom') }
    else if (option=="XY") { return('ST_X(the_geom) AS the_geom_x, ST_Y(the_geom) AS the_geom_y,null as the_geom') }
    else if (option=="WKT") { return('ST_AsText(the_geom) AS the_geom') }
    else if (option=="GeoJSON") { return('ST_AsGeoJSON(the_geom) AS the_geom') }
    else if (option=="WKB") { return('the_geom as the_geom') }
    else if (option=="the_geom") { return('the_geom') }
    else { return('ST_X(the_geom) AS the_geom_x, ST_Y(the_geom) AS the_geom_y,null as the_geom') }
}
cartodb.paramsToSql<-
function(name=NULL,geomAs=NULL,columns=NULL,omitNull=FALSE,limit=NULL){
    if (is.character(columns)){
        # replace the_geom with a processed version if asked for
        if ( 'the_geom' %in% columns) {
            if(!is.null(geomAs) && geomAs!="the_geom"){
                columns[columns=="the_geom"] = cartodb.transformGeom(geomAs)
            }
        }
        
        sql <- paste("SELECT ", paste(columns, collapse=","), " FROM ", name,sep='')
    } else {
        sql <- paste("SELECT *, NULL as the_geom_webmercator,",cartodb.transformGeom(geomAs)," FROM ", name,sep='')
    }
    if (omitNull==TRUE){
        sql <- paste(sql,"WHERE the_geom IS NOT NULL")
    }
    if (is.numeric(limit)) {
        sql <- paste(sql,"LIMIT",limit)
    }
    return(sql)
}