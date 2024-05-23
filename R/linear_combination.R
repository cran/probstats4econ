#' Test a single linear restriction of a model
#'
#' `linear_combination` takes a set of regression results
#' and a vector representing a linear combination of the
#' parameters and returns the estimate, standard error,
#' and p-value for the null hypothesis that the linear
#' combination is equal to zero.
#'
#' @param regresults A list containing two items: `coefficients`,
#'   which is a vector of coefficient estimates, and `vcov`,
#'   which is the variance-covariance matrix of the coefficient estimates.
#' @param R A vector of length equal to the number of coefficients,
#'   representing weights on each of the parameters.
#'
#' @return List with the following values:
#'   - `estimate`, the point estimate of the linear combination
#'   - `se`, the standard error of the point estimate
#'   - `p_value`, the p-value for the null hypothesis that the
#'      linear combination is equal to zero
#' @examplesIf requireNamespace("estimatr", quietly = TRUE)
#' # test that the returns to one year of education are equal to ten years of age
#' model <- estimatr::lm_robust(earnwk ~ age + educ, data = cps)
#' R <- c(0, -10, 1) # 0 * `intercept` - 10 * `age` + 1 * `education`
#' linear_combination(model, R)
#'
#' @export
linear_combination <- function(regresults, R) {
  assert_regresults(regresults)
  assert_R_matrix_regresults(regresults, R)

  R <- into_restriction_matrix(R)

  estimate <- c(R %*% regresults$coefficients)

  se <- c(sqrt(R %*% regresults$vcov %*% t(R)))

  p_value <- 2 * stats::pnorm(abs(estimate / se), lower.tail = FALSE)

  list(estimate = estimate, se = se, p_value = p_value)
}
