\name{cartodb.row.insert}
\alias{cartodb.row.insert}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Insert a single record into CartoDB
}
\description{
Insert a single record into CartoDB
}
\usage{
cartodb.row.insert(name=NULL,columns=NULL,values=NULL, quoteChars=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
  The name of a table you have in CartoDB
}
  \item{columns}{
  A list of the columns you are providing values for
}
  \item{values}{
  A list of values for your columns
}
  \item{quoteChars}{
  For all values in your values list, if the value class = "character", it will be quoted for SQL automatically
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
## Insert a new row into CartoDB and save the cartodb_id of the newly created row
cartodb_id <- cartodb.row.insert(name="r_test",columns=list("country","latitude","longitude"),values=list("United States",40.714,74.006))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
