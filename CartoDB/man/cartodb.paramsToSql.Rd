\name{cartodb.paramsToSql}
\alias{cartodb.paramsToSql}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Turns parameters into valid SQL for CartoDB queries
}
\description{
Turns parameters into valid SQL for CartoDB queries
}
\usage{
cartodb.paramsToSql(name=NULL,geomAs=NULL,columns=NULL,omitNull=FALSE,limit=NULL)
}
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
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
cartodb.paramsToSql("earthquakes")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
