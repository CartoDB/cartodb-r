\name{jsonToDataFrame}
\alias{jsonToDataFrame}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
jsonToDataFrame
}
\description{
}
\usage{
jsonToDataFrame(json)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{json}{
  JSON string
}=
}
\details{
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
}
\author{
}
\note{
}
\seealso{
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (json, all.names) 
{
    json.vecs <- lapply(json$results, rbind)
    col.match <- lapply(json.vecs, function(x) match(all.names, 
        colnames(x)))
    fixed.cols <- lapply(1:length(json.vecs), function(i) rbind(as.character(json.vecs[[i]][, 
        col.match[[i]]])))
    data.matrix <- do.call(rbind, fixed.cols)
    data.df <- data.frame(data.matrix, stringsAsFactors = FALSE)
    names(data.df) <- all.names
    return(data.df)
  }
}
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
