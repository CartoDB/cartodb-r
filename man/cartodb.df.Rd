\name{cartodb.df}
\alias{cartodb.df}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Executes a raw SQL statement and returns a dataframe response
}
\description{
Useful to work outside CartoDB-R APIs. If api.key has been set, it will perform writes/updates as well.
}
\usage{
cartodb.df(sql=NULL,urlOnly=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sql}{
  Query your account with direct SQL statements
}
  \item{urlOnly}{
  Returns the query URL string but doesn't fetch the data
}
}
\examples{
cartodb.df(sql="SELECT 1")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
