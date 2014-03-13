\name{comboreg}
\alias{comboreg}
\title{Reg Combo Function}
\usage{
comboreg(x, y)
}
\arguments{
  \item{x}{A numeric matrix of covariates}

  \item{y}{A numeric vector of the same length as the
  number of rows in x.}
}
\value{
A list with the elements \item{coefs}{A list of
coefficients from each regression} \item{x}{The first
object input}
}
\description{
Runs regression on all possible combos of covariates
}
\note{
Needs work
}
\examples{
myX <- matrix(c(1,2,3,4), nrow=2)
myY <- c(-2, 4.1)
comboreg(myX, myY)
}
\author{
Emily Moore
}

