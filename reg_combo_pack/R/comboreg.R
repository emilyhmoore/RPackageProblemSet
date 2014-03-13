#' Reg Combo Function
#'
#' Runs regression on all possible combos of covariates
#'
#' @param x A numeric matrix of covariates
#' @param y A numeric vector of the same length as the number of rows in x.
#'
#' @return A list with the elements
#'  \item{coefs}{A list of coefficients from each regression}
#'  \item{x}{The first object input} 
#' @author Emily Moore
#' @note Needs work
#' @examples
#' 
#' x1<-rnorm(5)
#' x2<-rnorm(5,3,15)
#' dep<-(x1+2*x2)+rnorm(5,4,100)
#' covars<-cbind(x1,x2) 
#' comboreg(x=covars, y=dep)
#' @rdname comboreg
#' @export

######Runs regression, returning list of coefficients for each regression run
comboreg<-function(x, y){
  library(reshape2)
  library(HapEstXXR)
  library(plyr)
set<-powerset(1:ncol(x)) ##create a list of all possible combos of variables
list1<-list(NULL) ##empty list

for (i in 1:length(set)){
  list1[1]<-list(lm(y~1)) ##intercept only
  list1[i+1]<-list(lm(y~x[,set[[i]]])) ##all combinations
}

thing<-lapply(list1, coef) ##get coefs

r.sq<-function(x){
  summary(x)$r.squared
}

fits<-lapply(list1, r.sq)

fits<-unlist(fits)
#for (i in 1:length(thing)){
 # names(thing[[i]])<-c("intercept", colnames(x)[1:(length(thing[[i]])-1)])
#}

return(list(coefs=thing, r.squared=fits))
}


#coefs<-(comboreg(x=covars, y=dep))
#coefs


