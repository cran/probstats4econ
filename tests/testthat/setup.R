setup_slr <- function() {
  cps_copy <- cbind(cps, union = as.numeric(cps$unionstatus == "Union"))
  model <- estimatr::lm_robust(earnwk ~ union, data = cps_copy)
  gamma_hat <- coef(model)
  var_gamma_hat <- vcov(model)
  list(gamma_hat = gamma_hat, var_gamma_hat = var_gamma_hat, model = model)
}

setup_mlr <- function() {
  cps_copy <- cbind(cps, union = as.numeric(cps$unionstatus == "Union"))
  model <- estimatr::lm_robust(earnwk ~ union + age + educ, data = cps_copy)
  gamma_hat <- coef(model)
  var_gamma_hat <- vcov(model)
  list(gamma_hat = gamma_hat, var_gamma_hat = var_gamma_hat, model = model)
}

setup_joint_normal <- function() {
  U_Sigma <- matrix(10 * runif(4), nrow = 2)
  samples <- matrix(stats::rnorm(2000), ncol = 2) %*% U_Sigma
  gamma_hat <- colMeans(samples)
  var_gamma_hat <- stats::cov(samples) / nrow(samples)
  list(gamma_hat = gamma_hat, var_gamma_hat = var_gamma_hat, samples = samples)
}
