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
#' x1<-rnorm(500)
#' x2<-rnorm(500,3,15)
#' dep<-(x1+2*x2)+rnorm(500,4,100)
#' covars<-cbind(x1,x2) 
#' comboreg(x=covars, y=dep)
#' @rdname comboreg
#' @export

######Runs regression, returning list of coefficients for each regression run
setGeneric(name="comboreg",
           def=function(x, y, ...)
           {standardGeneric("comboreg")}
)

setMethod(f="comboreg",
          definition=function(x, y){
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

return(new("regcombo", combo.coef=thing, 
           combo.fit=fits, x = head(x), y = head(y), avg.fit=mean(fits)))
}
)

#mat<-cbind(rnorm(10, 5, 3), rnorm(10,4,4))
#dep<-2*mat[,1]+3*mat[,2]+rnorm(10,15,3)
#thing<-comboreg(x=mat, y=dep)
#thing@combo.fit

#plot(thing)