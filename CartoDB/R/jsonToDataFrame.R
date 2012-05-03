jsonToDataFrame <-
function(json) {
    names<-names(json[[1]])
    json.vecs<-lapply(json, rbind)
    col.match<-lapply(json.vecs, function(x) match(names, colnames(x)))
    fixed.cols<-lapply(1:length(json.vecs), function(i) rbind(as.character(json.vecs[[i]][,col.match[[i]]])))
    data.matrix<-do.call(rbind, fixed.cols)
    data.df<-data.frame(data.matrix, stringsAsFactors=FALSE)
    names(data.df)<-names
    return(data.df)
}
