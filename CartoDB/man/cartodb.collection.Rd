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
  \item{name}{
    The name of a table you have in CartoDB
}
  \item{table.columns}{
%%     ~~Describe \code{table.columns} here~~
}
  \item{table.sql}{
%%     ~~Describe \code{table.sql} here~~
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
## First 10 records of a table to a dataframe
cartodb.collection("monarch",limit=10)

## Only specific columns of a table and 
## transform the_geom into the_geom_x, the_geom_y
cartodb.collection("monarch",columns=c("cartodb_id","the_geom"),geomAs="XY",limit=10)

## direct SQL query 
cartodb.collection(sql="SELECT cartodb_id, the_geom FROM monarch WHERE cartodb_id < 20")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
