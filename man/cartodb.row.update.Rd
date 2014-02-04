\name{cartodb.row.update}
\alias{cartodb.row.update}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Update a single record in CartoDB
}
\description{
Update a single record in CartoDB
}
\usage{
cartodb.row.update(name=NULL, cartodb_id=NULL, columns=NULL,values=NULL, quoteChars=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
  The name of a table you have in CartoDB
}
  \item{cartodb_id}{
  The cartodb_id of the record you are updating
}
  \item{columns}{
  A list of the columns you are providing new values for
}
  \item{values}{
  A list of the new values for your columns
}
  \item{quoteChars}{
  For all values in your values list, if the value class = "character", it will be quoted for SQL automatically
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
## Insert a new row into CartoDB
cartodb.row.update(name="r_test",cartodb_id=1,columns=list("country","latitude","longitude"),values=list("United States",40.714,74.006))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
