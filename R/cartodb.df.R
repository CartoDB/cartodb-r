cartodb.df<-
function(sql=NULL,urlOnly=FALSE) {
    #TODO: enable format=geojson here and in params
    url <- cartodb.sql.base()
    url <- URLencode(paste(url,"q=",sql,sep=''))
    if (urlOnly==TRUE) return(url)
    #TODO: enable POST here
    cartodb.sql.get<-getURL(url)
    cartodb.sql.json<-fromJSON(cartodb.sql.get[[1]])
    if ( 'rows' %in% names(cartodb.sql.json)) {
        df <- data.frame(t(sapply(cartodb.sql.json$rows[1:length(cartodb.sql.json$rows)],c)))
        return(df)
    } else {
        warning(cartodb.sql.json)
        return(NULL)
    }
}