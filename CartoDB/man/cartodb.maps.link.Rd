\name{cartodb.maps.link}
\alias{cartodb.maps.link}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Given a table name and optional SQL and style parameters, returns the link of the embed URL
}
\description{
Can be useful for R driven maps.
}
\usage{
cartodb.maps.link(name=NULL,sql = NULL, style=NULL)
}
\arguments{
  \item{name}{
  The name of the CartoDB table you are requesting a tile from
}
  \item{sql}{
  An SQL query for querying dynamic tiles from CartoDB
}
  \item{style}{
  A Carto style string to restyle tiles dynamically (see http://developers.cartodb.com/)
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
cartodb_account_name = "examples"; 
cartodb(cartodb_account_name)
tile<-cartodb.maps.link("earthquakes")
"http://examples.cartodb.com/tables/earthquakes/embed_map"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
