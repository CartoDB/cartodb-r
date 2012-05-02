\name{cartodb.collection}
\alias{cartodb.collection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Access data from a CartoDB table
}
\description{
This function takes a table, a table and columns, or an sql statement and returns the data from CartoDB. Optionally, asJSON when set to TRUE will allow you to receive a JSON object not a data.matrix from queries.
}
\usage{
cartodb.collection(table.name = NULL, table.columns = NULL, table.sql = NULL, asJson = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{table.name}{
%%     ~~Describe \code{table.name} here~~
}
  \item{table.columns}{
%%     ~~Describe \code{table.columns} here~~
}
  \item{table.sql}{
%%     ~~Describe \code{table.sql} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\note{
%%  ~~further notes~~
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (table.name = NULL, table.columns = NULL, table.sql = NULL) 
{
    if (is.character(table.name)) {
        if (is.character(table.columns)) {
            table.sql <- paste("SELECT ", paste(table.columns, 
                collapse = ","), " FROM ", table.name, sep = "")
        }
        else {
            table.sql <- paste("SELECT * FROM ", table.name, 
                sep = "")
        }
    }
    if (is.character(table.sql)) {
        url <- cartodbSqlApi()
        cartodb.collection.get <- getURL(URLencode(paste(url, 
            "q=", table.sql, sep = "")))
        cartodb.collection.data <- fromJSON(cartodb.collection.get)
        if (.CartoDB$data$asJson) {
            return(jsonToDataFrame(as.character(cartodb.collection.data$rows)))
        }
        else {
            return(as.character(cartodb.collection.data$rows))
        }
    }
    else {
        warning("You must supply a table name")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
