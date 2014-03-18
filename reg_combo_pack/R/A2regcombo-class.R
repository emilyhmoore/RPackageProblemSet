#' A regression combination class
#' 
#' Object of class \code{regcombo} as created by the \code{comboreg} functions
#'
#' 
#' An object of the class `regcombo' has the following slots:
#' \itemize{
#' \item \code{combo.coef} A list of coefficients for each possible regression
#' \item \code{combo.fit} A vector of R-Squared values
#' \item \code{x} A matrix input of covariates
#' \item \code{y} The dependent variable input  
#' }
#'
#' @author Emily Moore: \email{emily.moore@@wustl.edu}
#' @export
setClass(Class="regcombo",
         contains="Avg.Fit",
         representation = representation(
           combo.coef = "list",
           combo.fit="numeric",
           x="matrix",
           y="numeric"
         ),
         prototype = prototype(
           combo.coef=list(),
           combo.fit=numeric(),
           x = matrix(),
           y = numeric(),
           avg.fit=numeric()
         )
)

#' @export
setMethod("initialize", "regcombo",
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod("print", "regcombo",
          function(x){
            summary(x@combo.fit)
          }
            )

#' @export

setMethod("show", "regcombo",
          function(object){
            cat("Regression Fits", "\n")
            print(object@combo.fit)
            cat("Regression Coefficients", "\n")
            print(object@combo.coef)
          }
)

#' @export

setMethod(f="plot", signature="regcombo",
          definition=function(x){
            plot(x=(1:length(x@combo.fit)),y=x@combo.fit, 
                 xlab="Regression Number" , ylab="R-Squared", 
                 type="l", col="purple", ...)
                 abline(h=x@avg.fit, col="red")
          }
          )
