\name{cartodb.tile}
\alias{cartodb.tile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Given a set of XYZ can get a tile with rendered data.
}
\description{
Can be useful for R driven maps.
}
\usage{
cartodb.tile(tile.x, tile.y, tile.z, table.name = NULL, table.query = NULL)
}
\arguments{
  \item{tile.x}{
%%     ~~Describe \code{tile.x} here~~
}
  \item{tile.y}{
%%     ~~Describe \code{tile.y} here~~
}
  \item{tile.z}{
%%     ~~Describe \code{tile.z} here~~
}
  \item{table.name}{
%%     ~~Describe \code{table.name} here~~
}
  \item{table.query}{
%%     ~~Describe \code{table.query} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\note{
%%  ~~further notes~~
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (tile.x, tile.y, tile.z, table.name = NULL, table.query = NULL) 
{
    if (is.number(tile.x) && is.number(tile.y) && is.number(tile.z)) {
        if (is.character(table.name)) {
            url <- cartodbMapsApi()
            if (is.character(table.query)) {
                cartodb.tile.png <- getURL(URLencode(paste(url, 
                  table.name, "/", z, "/", x, "/", y, ".png", 
                  sep = "")))
            }
            else {
                cartodb.tile.png <- getURL(URLencode(paste(url, 
                  table.name, "/", z, "/", x, "/", y, ".png?q=", 
                  table.query, sep = "")))
            }
            return(cartodb.tile.png)
        }
        else {
            warning("You must supply the table name you are querying")
        }
    }
    else {
        warning("You must supply XYZ coordinates for your tile")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
