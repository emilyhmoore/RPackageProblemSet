\name{comboreg.tval}
\alias{comboreg.tval}
\title{Reg Combo Importance Function}
\usage{
comboreg.tval(x, y, ...)
}
\arguments{
  \item{x}{A numeric matrix of covariates}

  \item{y}{A numeric vector of the same length as the
  number of rows in x.}
}
\value{
A list for each regression containing \item{x}{A matrix of
t- and p-values for that regression}
}
\description{
Runs regression on all possible combos of covariates and
returns t- and p- values.
}
\examples{
x1<-rnorm(500)
x2<-rnorm(500,3,15)
dep<-(x1+2*x2)+rnorm(500,4,100)
covars<-cbind(x1,x2)
comboreg.tval(x=covars, y=dep)
}
\author{
Emily Moore
}

