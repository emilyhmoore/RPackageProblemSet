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
x1<-rnorm(5)
x2<-rnorm(5,3,15)
dep<-(x1+2*x2)+rnorm(5,4,100)
covars<-cbind(x1,x2)
comboreg(x=covars, y=dep)
}
\author{
Emily Moore
}

