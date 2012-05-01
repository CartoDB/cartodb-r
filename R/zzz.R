# File-Name:       zzz.R           
# Date:            2012-05-01                                
# Author:          Andrew Hill
# Email:           andrew@vizzuality.com                                    
# Purpose:         
# Data Used:       
# Packages Used:          
# Output File:    
# Data Output:                                                       

# Local environment to store API data and user API key
.CartoDB<-new.env()
.CartoDB$data<-list()

.onLoad<-function(libname, pkgname) {
    if(is.null(.CartoDB$data)==FALSE) {
        .CartoDB$data <- list(
            api.key=NULL,
            account.name=NULL,
            asJson=TRUE,
            sqlapi=".cartodb.com/api/v2/sql",
            mapsapi=".cartodb.com/tiles/"
            )
    }
}

cartodbSqlApi <- function() {
    if (.CartoDB$data$api.key) {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$sqlapi,"?","api_key=",.CartoDB$data$api.key,"&" ) )
    } else {
        return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$sqlapi,"?" ) )
    }
}

cartodbMapsApi <- function() {
    return( paste( "http://",.CartoDB$data$account.name,.CartoDB$data$mapsapi ) )
}

jsonToDataFrame <- 
function(json, all.names) {
    json.vecs<-lapply(json$results, rbind)
    col.match<-lapply(json.vecs, function(x) match(all.names, colnames(x)))
    fixed.cols<-lapply(1:length(json.vecs), function(i) rbind(as.character(json.vecs[[i]][,col.match[[i]]])))
    data.matrix<-do.call(rbind, fixed.cols)
    data.df<-data.frame(data.matrix, stringsAsFactors=FALSE)
    names(data.df)<-all.names
    return(data.df)
}

