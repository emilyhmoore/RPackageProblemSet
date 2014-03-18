#' Reg Combo Importance Function
#'
#' Runs regression on all possible combos of covariates and returns t- and p- values.
#'
#' @param x A numeric matrix of covariates
#' @param y A numeric vector of the same length as the number of rows in x.
#'
#' @return A list for each regression containing
#'  \item{x}{A matrix of t- and p-values for that regression}
#' @author Emily Moore
#' @examples
#' 
#' x1<-rnorm(500)
#' x2<-rnorm(500,3,15)
#' dep<-(x1+2*x2)+rnorm(500,4,100)
#' covars<-cbind(x1,x2) 
#' comboreg.tval(x=covars, y=dep)
#' @rdname comboreg.tval
#' @export

######Runs regression, returning list of coefficients for each regression run
setGeneric(name="comboreg.tval",
           def=function(x, y, ...)
           {standardGeneric("comboreg.tval")}
)

setMethod(f="comboreg.tval",
          definition=function(x, y){
            library(HapEstXXR)
            library(plyr)
            set<-powerset(1:ncol(x)) ##create a list of all possible combos of variables
            list1<-list(NULL) ##empty list
            
            for (i in 1:length(set)){
              list1[1]<-list(lm(y~1)) ##intercept only
              list1[i+1]<-list(lm(y~x[,set[[i]]])) ##all combinations
            }

            t.val<-function(x){
              summary(x)$coefficients[,3:4]
            }
            
            t.vals<-lapply(list1, t.val)
            
            return(t.vals)
          }
)