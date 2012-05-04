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
cartodb.collection(name = NULL, columns = NULL, geomAs = NULL, omitNull = FALSE, limit = NULL, sql = NULL, method = "dataframe", urlOnly = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
  The name of a table you have in CartoDB
}
  \item{columns}{
  String vector of column names to include in your result. If using geomAs parameter, you must include 'the_geom' here
}
  \item{geomAs}{
  Defines how you want your geometries returned. Accepted values include, "the_geom", "WKB", "WKT", "GeoJSON", "XY"
}
  \item{omitNull}{
  Boolean when TRUE omits records with NULL geometry values
}
  \item{limit}{
  Integer that limits the number of records returned
}
  \item{sql}{
  Query your account with direct SQL statements. Using sql overrides all parameter above.
}
  \item{method}{
  Defines how you want your data returned. Methods include, "dataframe", "GeoJson". If you use "GeoJson", geomAs should be left NULL and you must include the_geom in your sql or columns parameter if either are included.
}
  \item{urlOnly}{
  Returns the query URL string but doesn't fetch the data
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
