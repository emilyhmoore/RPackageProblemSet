\name{comboreg}
\alias{comboreg}
\title{Reg Combo Function}
\usage{
comboreg(x, y, ...)
}
\arguments{
  \item{x}{A numeric matrix of covariates}

  \item{y}{A numeric vector of the same length as the
  number of rows in x.}
}
\value{
A list with the elements \item{combo.coef}{A list of
coefficients from each regression} \item{combo.fit}{Vector
of R-squared Values}
}
\description{
Runs regression on all possible combos of covariates
}
\examples{
x1<-rnorm(500)
x2<-rnorm(500,3,15)
dep<-(x1+2*x2)+rnorm(500,4,100)
covars<-cbind(x1,x2)
comboreg(x=covars, y=dep)
}
\author{
Emily Moore
}

