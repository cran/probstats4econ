#' Variance helper functions
#'
#' These functions help calculate the variance matrix of different
#' kinds of samples. `var_mean_indep` creates an asymptotic
#' covariance matrix for the sample means of a list of independent
#'  samples. `var_prop_indep` creates an asymptotic covariance
#' matrix for the sample proportions of a list of independent
#' samples. `var_mean_onesample` creates an asymptotic covariance
#'  matrix for the sample means of several variables from the same
#' sample.
#'
#' @param x_vectors A list of vectors, representing the different
#'   independent samples.
#' @param pi_hat A vector of sample proportions.
#' @param nobs The sample size.
#' @param df A data.frame object
#' @param vars A character vector of variable names in `df`.
#'
#' @return A matrix, representing the asymptotic covariance matrix
#'   of the sample means.
#' @examples
#' # list of independent samples
#' x_vectors <- list(
#'   rnorm(1000, mean = 1, sd = 2),
#'   rnorm(10, mean = 4, sd = 0.5),
#'   rnorm(1000000, mean = 0, sd = 1)
#' )
#' var_mean_indep(x_vectors)
#'
#' # sample proportions
#' pi_hat <- c(0.1, 0.6, 0.3)
#' nobs <- 1000
#' var_prop_indep(pi_hat, nobs)
#'
#' # covariance of educ and age in cps dataset
#' var_mean_onesample(cps, c("educ", "age"))
#'
#' @export
var_mean_indep <- function(x_vectors) {
  stopifnot(
    "`x_vectors` must be a list of numeric vectors." = is.list(x_vectors) && all(sapply(x_vectors, is.numeric))
  )
  diag(sapply(x_vectors, function(x) {
    stats::var(x, na.rm = TRUE) / (length(x) - sum(is.na(x)))
  }))
}
