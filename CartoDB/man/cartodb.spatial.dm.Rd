\name{cartodb.spatial.dm}
\alias{cartodb.spatial.dm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Given a table, it can return the upper half of a spatial matrix in meters
}
\description{
Hopefully helpful for spatial stats where better distance methods from geoms are needed.
}
\usage{
cartodb.spatial.dm(name = NULL, method="CENTROID", limit=NULL)
}
\arguments{
  \item{name}{
  The name of the CartoDB table you are requesting a tile from
}
  \item{method}{
  Where in the geometry to measure the distance between each geometry. For points, it doesn't matter. For polygons, CENTROID is the default. EXACT will use the precise closest points on the polygon. This function needs further optimization, as it is very slow for large tables and on free accounts. Stay tuned for updates.
}
  \item{limit}{
  Number of records to compare. Defaults is NULL, but with complex polygons or large tables you should test with a limit first.
}
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
cartodb_account_name = "examples"; 
cartodb(cartodb_account_name)
tile<-cartodb.spatial.dm("earthquakes")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
