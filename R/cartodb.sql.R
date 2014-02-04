cartodb.sql.base <-
function() {
    if ('api.key' %in% names(.CartoDB$data)) {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.sql,"?","api_key=",.CartoDB$data$api.key,"&" ,sep='') )
    } else {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.sql,"?",sep='' ) )
    }
}
cartodb.sql.fromParams<-
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
