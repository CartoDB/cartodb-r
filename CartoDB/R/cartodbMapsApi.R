cartodbMapsApi <-
function() {
    return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$api.maps,sep='' ) )
}