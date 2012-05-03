cartodbSqlApi <-
function() {
    if ('api.key' %in% colnames(.CartoDB$data)) {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.sql,"?","api_key=",.CartoDB$data$api.key,"&" ,sep='') )
    } else {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.sql,"?",sep='' ) )
    }
}
