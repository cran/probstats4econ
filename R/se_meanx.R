#' Asymptotic Standard Errors
#'
#' These functions calculate the asymptotic standard errors of
#' common statistical estimates. `se_meanx` calculates the
#' standard error of the mean, `se_sx` calculates the standard
#' error of the population standard deviation estimate, and
#' `se_rxy` calculate the standard error of the correlation
#' estimate between two vectors.
#'
#' @param x A numeric vector, representing a sample from a population
#' @param y A numeric vector, representing a sample of a different variable
#' @param na.rm A boolean, whether or not to remove any `NA`s (default `FALSE`)
#'
#' @return A number representing the asymptotic standard error of the
#'          particular estimate
#' @examples
#' # calculate the mean and se of the mean of wage in the cps data
#' paste(
#'   "The average wage is",
#'   mean(cps$wagehr, na.rm = TRUE),
#'   "with a margin of error of",
#'   se_meanx(cps$wagehr, na.rm = TRUE)
#' )
#'
#' @export
se_meanx <- function(x, na.rm = FALSE) {
  stopifnot("`x` should be a numeric vector" = is.numeric(x))
  if (na.rm) {
    x <- x[!is.na(x)]
  }
  root_n <- sqrt(length(x))
  stats::sd(x) / root_n
}
