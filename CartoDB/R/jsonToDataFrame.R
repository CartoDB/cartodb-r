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
