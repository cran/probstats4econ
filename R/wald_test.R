#' Wald test statistic and p-value
#'
#' Given the parameter estimates and their variance-covariance matrix,
#' `wald_test` calculates the Wald test statistic and p-value for
#' a set of linear constraints on the parameters.
#'
#' @param gamma_hat L x 1 vector of parameter estimates
#' @param var_gamma_hat L x L variance-covariance matrix of parameter estimates
#' @param R Q x L matrix of linear constraints to be tested.
#'     Defaults to identity matrix of size L
#' @param c Q x 1 vector of test values for the linear constraints.
#'     Defaults to a vector of zeros of length Q to test that all
#'     the contrasts are equal to zero.
#'
#' @return A list with the following elements:
#'    * W: Wald test statistic
#'    * p_value: p-value for the Wald test (\eqn{\chi^2_Q} distribution)
#' @examples
#' # test that union workers earn the same as non-union workers
#' cps$union <- as.numeric(cps$unionstatus == "Union")
#' model <- lm(earnwk ~ union, data = cps)
#' gamma_hat <- coef(model)
#' var_gamma_hat <- vcov(model)
#' wald_test(gamma_hat, var_gamma_hat, R = c(0, 1))
#'
#' # test that non-union workers make 900/week
#' # *and* union workers make 1000/week
#' wald_test(
#'   gamma_hat,
#'   var_gamma_hat,
#'   R = matrix(c(0, 1, 1, 1), nrow = 2),
#'   c = c(900, 1000)
#' )
#'
#' @export
wald_test <- function(
    gamma_hat,
    var_gamma_hat,
    R = diag(length(gamma_hat)),
    c = default_test(R)) {
  assert_gamma(gamma_hat, var_gamma_hat)
  assert_R_matrix_gamma_hat(gamma_hat, R)
  assert_c_vector(R, c)

  R <- into_restriction_matrix(R)

  W <- local({
    f <- R %*% gamma_hat - c
    v_f <- R %*% var_gamma_hat %*% t(R)
    base::c(t(f) %*% solve(v_f, f))
  })

  p_value <- stats::pchisq(W, nrow(R), lower.tail = FALSE)

  list(W = W, p_value = p_value)
}
