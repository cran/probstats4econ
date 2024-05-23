####### ARGUMENT VALIDATION #######

is_valid_regresults <- function(regresults) {
  is.list(regresults) &&
    all(c("coefficients", "vcov") %in% names(regresults)) &&
    is.numeric(regresults$coefficients) &&
    is.matrix(regresults$vcov) &&
    length(regresults$coefficients) == nrow(regresults$vcov) &&
    nrow(regresults$vcov) == ncol(regresults$vcov)
}

assert_regresults <- function(regresults) {
  stopifnot(
    "`regresults` must be a list with `coefficients` and `vcov`" = is_valid_regresults(regresults)
  )
}

is_valid_gamma <- function(gamma_hat, var_gamma_hat) {
  is.numeric(gamma_hat) &&
    is.matrix(var_gamma_hat) &&
    length(gamma_hat) == nrow(var_gamma_hat) &&
    nrow(var_gamma_hat) == ncol(var_gamma_hat)
}

assert_gamma <- function(gamma_hat, var_gamma_hat) {
  stopifnot(
    "`gamma_hat` must be a numeric vector and `var_gamma_hat` must be a square matrix of the same size as `gamma_hat`" = is_valid_gamma(gamma_hat, var_gamma_hat)
  )
}

is_valid_R_matrix <- function(coef_vector, R) {
  is.matrix(R) && ncol(R) == length(coef_vector) ||
    is.numeric(R) && length(R) == length(coef_vector)
}

assert_R_matrix_regresults <- function(regresults, R) {
  stopifnot("`R` must be a vector (matrix) with length (number of columns) equal to `length(regresults$coefficients)`" = is_valid_R_matrix(regresults$coefficients, R))
}

assert_R_matrix_gamma_hat <- function(gamma_hat, R) {
  stopifnot("`R` must be a vector (matrix) with length (number of rows) equal to `gamma_hat`" = is_valid_R_matrix(gamma_hat, R))
}

is_valid_r_vector <- function(R, r) {
  is.numeric(r) && length(r) == ifelse(is.matrix(R), nrow(R), 1)
}

assert_r_vector <- function(R, r) {
  stopifnot("`r` must be a vector of length equal to the number of rows of `R`" = is_valid_r_vector(R, r))
}


####### MISCELLANEOUS #######

into_restriction_matrix <- function(R) {
  if (!is.matrix(R)) {
    matrix(R, nrow = 1)
  } else {
    R
  }
}

default_test <- function(R) {
  rep(0, ifelse(is.matrix(R), nrow(R), 1))
}
