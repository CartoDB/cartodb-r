\name{cartodb}
\alias{cartodb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
CartoDB connection setup
}
\description{
Takes and account.name or an account.name and api.key to setup a new connection to CartoDB. 
}
\usage{
cartodb(account.name, api.key = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{account.name}{
%%     ~~Describe \code{account.name} here~~
}
  \item{api.key}{
%%     ~~Describe \code{api.key} here~~
}
  \item{asJson}{
%%     ~~Describe \code{asJson} here~~
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
function (account.name, api.key = NULL, asJson = TRUE) 
{
    .CartoDB$data$asJson <- asJson
    if (is.character(api.key)) {
        .CartoDB$data$api.key <- api.key
    }
    else {
        warning("Without an API key you are limited to read-only")
    }
    if (is.character(account.name)) {
        .CartoDB$data$account.name <- account.name
    }
    else {
        error("Account name must be a string")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
