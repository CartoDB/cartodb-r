cartodbSqlApi <-
function() {
    if (.CartoDB$data$api.key) {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$sqlapi,"?","api_key=",.CartoDB$data$api.key,"&" ,sep='') )
    } else {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$sqlapi,"?",sep='' ) )
    }
}
