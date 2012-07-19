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
}
\author{
Andrew Hill <andrew@vizzuality.com>
}
\examples{
cartodb_account_name = "examples"; 
cartodb(cartodb_account_name)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
