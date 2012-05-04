\name{cartodb.transformGeom}
\alias{cartodb.transformGeom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Transform the_geom column SQL
}
\description{
Used to create transform SQL for the_geom column based on what type of response the user wants
}
\usage{
cartodb.transformGeom(option=NULL)
}
\arguments{
  \item{option}{
  Defines how you want your geometries returned. Accepted values include, NULL, "the_geom", "WKB", "WKT", "GeoJSON", "XY"
}
}
\examples{
cartodb.transformGeom(option="WKT")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
