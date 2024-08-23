#' Test multiple linear restrictions simultaneously
#'
#' `test_linear_restrictions` takes a set of regression results and
#' tests multiple linear restrictions simultaneously.
#'
#' @param regresults A list containing two items: `coefficients`,
#'   which is a vector of coefficient estimates, and `vcov`,
#'   which is the variance-covariance matrix of the coefficient estimates.
#' @param R A matrix of linear restrictions. Each row of `R` represents a
#'  different linear restriction. R should have the same number of columns
#'  as `length(regresults$coefficients)`.
#' @param c A vector of constants, equal to the number of rows in `R`.
#'  This is what we are testing that each linear restriction is equal to.
#'
#' @return A list with the following items:
#'   - W: The Wald (chi-square) statistic
#'   - p_value: The p-value of the test
#' @examplesIf requireNamespace("estimatr", quietly = TRUE)
#' # test both that the returns to one year of education are
#' # equal to ten years of age, and that the intercept is zero
#' model <- estimatr::lm_robust(earnwk ~ age + educ, data = cps)
#' R <- matrix(c(0, -10, 1, 1, 0, 0), nrow = 2, byrow = TRUE)
#' test_linear_restrictions(model, R)
#'
#' @export
test_linear_restrictions <- function(regresults, R, c = default_test(R)) {
  force(c)
  assert_regresults(regresults)
  assert_R_matrix_regresults(regresults, R)
  assert_c_vector(R, c)
  wald_test(regresults$coefficients, regresults$vcov, R, c)
}
