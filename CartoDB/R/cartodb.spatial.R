cartodb.spatial.dm <-
function(name = NULL, method="CENTROID", limit=NULL) {
    warning('CartoDB Distance Matrix support is experimental')
    if (is.character(name)){
        url <- cartodb.sql.base()
        if (method=="EXACT"){
            the_geom = "the_geom"
        } else if (method=="CENTROID") {
            the_geom = "ST_Centroid(the_geom)"
        } else if (method=="HULL") {
            the_geom = "ST_ConvexHull(the_geom)"
        } else {
            warning("method not recognized, defaulting to CENTROID")
            the_geom = "ST_Centroid(the_geom)"
        }
        lim = ""
        if (is.numeric(limit)){
            lim = paste(" LIMIT ",limit,sep="")
        }
        sql <- paste("with foo as (SELECT cartodb_id,",the_geom," geo FROM ",name,lim,") SELECT a.cartodb_id cartodb_a,b.cartodb_id cartodb_id_b,st_distance_sphere(a.geo,b.geo) meters FROM foo a JOIN foo b ON a.cartodb_id < b.cartodb_id",sep="")
        url <- URLencode(paste(url,"q=",sql,sep=''))
        df<-cartodb.df(sql)
        if ( !is.null(df) ) {
            return(df)
        } else {
            return(NULL)
        }
    } else {
        warning("You must supply a table name")
    }
}
