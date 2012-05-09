\name{cartodb.row.get}
\alias{cartodb.row.get}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Access a single record from CartoDB
}
\description{
Access a single record from CartoDB
}
\usage{
cartodb.row.get(name=NULL,cartodb_id=NULL,columns=NULL,values=NULL,geomAs=NULL,quoteChars=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
  The name of a table you have in CartoDB
}
  \item{cartodb_id}{
  The cartodb_id of the record you are selecting
}
  \item{geomAs}{
  Defines how you want your geometries returned. Accepted values include, "the_geom", "WKB", "WKT", "GeoJSON", "XY"
}
  \item{columns}{
  If you don't know the cartodb_id of your record, you can find it with a set of 1 or more columns and their values. Here, give an ordered list of your columns, e.g. columns=list("my_id")
}
  \item{values}{
  An ordered list of your values corresponding to your columns list above, e.g. values=list(35)
}
  \item{quoteChars}{
  For all values in your values list, if the value class = "character", it will be quoted for SQL automatically
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
## The row from the table monarch with cartodb_id = 1
cartodb.row.get(name="monarch",cartodb_id="1")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
