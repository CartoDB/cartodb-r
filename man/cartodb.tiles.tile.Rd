\name{cartodb.tiles.tile}
\alias{cartodb.tiles.tile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Given a set of XYZ can get a tile with rendered data.
}
\description{
Can be useful for R driven maps.
}
\usage{
cartodb.tiles.tile(name = NULL, x = NULL, y = NULL, z = NULL, sql = NULL, style=NULL, method="bytes", urlOnly=FALSE)
}
\arguments{
  \item{name}{
  The name of the CartoDB table you are requesting a tile from
}
  \item{x}{
  Numeric x coordinate of tile
}
  \item{y}{
  Numeric y coordinate of tile
}
  \item{z}{
  Numeric zoom value for tile
}
  \item{sql}{
  An SQL query for querying dynamic tiles from CartoDB
}
  \item{style}{
  A Carto style string to restyle tiles dynamically (see http://developers.cartodb.com/)
}
  \item{method}{
  The format of the data you want returned, "bytes". "png" is in development
}
  \item{urlOnly}{
  Boolean if true only returns the URL of the tile but doesn't fetch
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
cartodb_account_name = "examples"; 
cartodb(cartodb_account_name)
tile<-cartodb.tiles.tile("earthquakes", 0, 0, 0, urlOnly=TRUE)
tile
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
