cartodb.row.get<-
function(name=NULL,cartodb_id=NULL,columns=NULL,values=NULL,geomAs=NULL,quoteChars=TRUE) {
    # Methods to request a single row from CartoDB
    if (is.character(name)){
        url <- cartodb.sql.base()
        if (is.numeric(cartodb_id)){
            sql<-cartodb.sql.fromParams(name=name,geomAs=geomAs,limit=1)
            # sql<-paste("SELECT * FROM",name,"WHERE cartodb_id = ",cartodb_id,"LIMIT 1")
            cartodb.row.df <- cartodb.df(sql)
            return(cartodb.row.df)
        } else if (is.list(columns) && is.list(values)){
            if (length(columns) != length(values)){
                warning('all columns must be given one value')
            } else {
                where <- ""
                for (i in 1:length(columns)){
                    # Add AND between conditions
                    if (1<i){
                        where <- paste(where,"AND")
                    }
                    where <- paste(where,columns[[i]],"=")
                    # quote character columns
                    if(quoteChars==TRUE && is.character(values[[i]])){
                        where <- paste(where,"'",values[[i]],"'",sep="")
                    } else {
                        where <- paste(where,values[[i]])
                    }
                }
                geom <- ","
                if(!is.null(geomAs) && geomAs!="the_geom"){
                    geom <- paste(geom,cartodb.transformGeom(geomAs),sep="")
                }
                sql<-paste("SELECT *",geom,"FROM",name,"WHERE",where,"LIMIT 1")
                cartodb.row.df <- cartodb.df(sql)
                # cartodb.row.raw<-getURL(paste(url,"q=",sql,sep=""))
                # cartodb.row.json<-fromJSON(cartodb.row.raw[[1]])
                # cartodb.row.df <- data.frame(t(sapply(cartodb.row.json$rows[[1]],c)))
                return(cartodb.row.df)
            }
        } else {
            warning('you must supply a cartodb_id')
        }
    } else {
        warning('cartodb.row.get is a table based method, use cartodb.collection for arbitrary lookups')
    }
}

cartodb.row.insert<-
function(name=NULL,columns=NULL,values=NULL, quoteChars=TRUE) {
    # Methods to request a single row from CartoDB
    if (is.character(name)){
        if (is.vector(columns) && is.vector(values)){
            if (length(columns) == length(values)) {
                # add single quotes around text values
                if(quoteChars==TRUE){
                    for (i in 1:length(values)){
                        if(is.character(values[[i]])==TRUE){
                            values[[i]] <- paste("'",values[[i]],"'",sep="")
                        }
                    }
                }
                df <- cartodb.df(sql=paste("INSERT INTO ",name," (",paste(columns,sep="",collapse=","),")", " VALUES (",paste(values,sep="",collapse=","),") RETURNING cartodb_id",sep=""))
                if (is.null(df)){
                    return(NULL)
                } else {
                    return(df$cartodb_id)
                }
            } else {
                warning('all columns must be given a value')
            }
        } else {
            warning('you must supply values for your row')
        } 
    } else {
        warning('cartodb.row.insert is a table based method, use cartodb.df for arbitrary inserts')
    }
}

cartodb.row.update<-
function(name=NULL, cartodb_id=NULL, columns=NULL,values=NULL, quoteChars=TRUE) {
    # Methods to request a single row from CartoDB
    if (is.character(name)){
        if (is.numeric(cartodb_id)){
            if (is.vector(columns) && is.vector(values)){
                if (length(columns) == length(values)) {
                    # add single quotes around text values
                    if(quoteChars==TRUE){
                        for (i in 1:length(values)){
                            if(is.character(values[[i]])==TRUE){
                                values[[i]] <- paste("'",values[[i]],"'",sep="")
                            }
                        }
                    }
                    # write SET statement
                    setstat <- " SET "
                    for (i in 1:length(columns)){
                        if (1<i){
                            setstat <- paste(setstat,",",sep="")
                        }
                        setstat <- paste(setstat,columns[[i]],"=",values[[i]],sep="")
                    }
                    url <- cartodb.sql.base()
                    
                    sql<-paste("UPDATE ",name, setstat, " WHERE cartodb_id=",cartodb_id,sep="")
                    # cartodb.update.raw<-getURL(paste(url,"q=",sql,sep=""))
                    # cartodb.update.json<-fromJSON(cartodb.update.raw[[1]])
                    cartodb.update.df = cartodb.df(sql)
                    return(cartodb.update.df)
                    # if("rows" %in% names(cartodb.update.json)){
                    #     return(TRUE)
                    # } else {
                    #     warning(cartodb.update.json)
                    #     return(NULL)
                    # }
                } else {
                    warning('all columns must be given a value')
                }
            } else {
                warning('you must supply values for your row')
            } 
        } else {
            warning('you must supply a cartodb_id')
        }
    } else {
        warning('cartodb.row.update is a table based method, use cartodb.df for arbitrary updates')
    }
}