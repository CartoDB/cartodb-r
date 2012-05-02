\name{cartodbMapsApi}
\alias{cartodbMapsApi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Turns the user supplied options into the base urls needed for Maps API calls.
}
\description{
A set of predefined ways of turning cartodb.R options into actionable URLs.
}
\usage{
cartodbMapsApi()
}
%- maybe also 'usage' for other objects documented here.
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
function () 
{
    return(paste("http://", .CartoDB$data$account.name, .CartoDB$data$mapsapi, 
        sep = ""))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
