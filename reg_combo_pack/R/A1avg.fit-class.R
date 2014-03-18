#' A regression combination class
#' 
#' Object of subclass \code{Avg.Fit} as created by the \code{comboreg} functions
#'
#' 
#' An object of the class `regcombo' has the following slots:
#' \itemize{
#' \item \code{avg.fit} The mean R-squared value in all combos of coefficients
#' }
#'
#' @author Emily Moore: \email{emily.moore@@wustl.edu}
#' @export

setClass(Class="Avg.Fit",
         representation = representation(
           avg.fit="numeric"
         ),
         prototype = prototype(
          avg.fit=numeric()
         )
)
