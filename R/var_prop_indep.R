#' @rdname var_mean_indep
#' @export
var_prop_indep <- function(pi_hat, nobs) {
  diag(pi_hat * (1 - pi_hat) / nobs)
}
