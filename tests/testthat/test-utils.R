test_that("assert regresults", {
  good <- list(
    coefficients = c(1, 2, 3),
    vcov = matrix(1:9, nrow = 3)
  )
  missing_args <- list()
  missing_coef <- list(vcov = matrix(1:9, nrow = 3))
  missing_vcov <- list(coefficients = c(1, 2, 3))
  bad_coef <- list(coefficients = "not a numeric", vcov = matrix(1:9, nrow = 3))
  bad_vcov <- list(coefficients = c(1, 2, 3), vcov = "not a matrix")
  wrong_size <- list(coefficients = c(1, 2, 3), vcov = matrix(1:12, nrow = 4))

  expect_no_error(assert_regresults(good))
  expect_error(assert_regresults(missing_args))
  expect_error(assert_regresults(missing_coef))
  expect_error(assert_regresults(missing_vcov))
  expect_error(assert_regresults(bad_coef))
  expect_error(assert_regresults(bad_vcov))
  expect_error(assert_regresults(wrong_size))
})

test_that("assert gamma", {
  good <- list(
    gamma_hat = c(1, 2, 3),
    var_gamma_hat = matrix(1:9, nrow = 3)
  )
  missing_args <- list()
  missing_gamma_hat <- list(var_gamma_hat = matrix(1:9, nrow = 3))
  missing_var_gamma_hat <- list(gamma_hat = c(1, 2, 3))
  bad_gamma_hat <- list(gamma_hat = "not a numeric", var_gamma_hat = matrix(1:9, nrow = 3))
  bad_var_gamma_hat <- list(gamma_hat = c(1, 2, 3), var_gamma_hat = "not a matrix")
  wrong_size <- list(gamma_hat = c(1, 2, 3), var_gamma_hat = matrix(1:12, nrow = 4))

  expect_no_error(assert_gamma(good$gamma_hat, good$var_gamma_hat))
  expect_error(assert_gamma(missing_args))
  expect_error(assert_gamma(missing_gamma_hat$gamma_hat, missing_gamma_hat$var_gamma_hat))
  expect_error(assert_gamma(missing_var_gamma_hat$gamma_hat, missing_var_gamma_hat$var_gamma_hat))
  expect_error(assert_gamma(bad_gamma_hat$gamma_hat, bad_gamma_hat$var_gamma_hat))
  expect_error(assert_gamma(bad_var_gamma_hat$gamma_hat, bad_var_gamma_hat$var_gamma_hat))
  expect_error(assert_gamma(wrong_size$gamma_hat, wrong_size$var_gamma_hat))
})

test_that("assert R matrix regresults", {
  regresults <- list(
    coefficients = c(1, 2, 3),
    vcov = matrix(1:9, nrow = 3)
  )
  good_vector <- c(1, 2, 3)
  good_matrix <- matrix(1:9, nrow = 3)
  bad_vector <- c(1, 2, 3, 4)
  bad_matrix <- matrix(1:12, ncol = 4)

  expect_no_error(assert_R_matrix_regresults(regresults, good_vector))
  expect_no_error(assert_R_matrix_regresults(regresults, good_matrix))
  expect_error(assert_R_matrix_regresults(regresults, bad_vector))
  expect_error(assert_R_matrix_regresults(regresults, bad_matrix))
})

test_that("assert R matrix gamma_hat", {
  gamma_hat <- c(1, 2, 3)
  good_vector <- c(1, 2, 3)
  good_matrix <- matrix(1:9, nrow = 3)
  bad_vector <- c(1, 2, 3, 4)
  bad_matrix <- matrix(1:12, ncol = 4)

  expect_no_error(assert_R_matrix_gamma_hat(gamma_hat, good_vector))
  expect_no_error(assert_R_matrix_gamma_hat(gamma_hat, good_matrix))
  expect_error(assert_R_matrix_gamma_hat(gamma_hat, bad_vector))
  expect_error(assert_R_matrix_gamma_hat(gamma_hat, bad_matrix))
})

test_that("assert c vector", {
  R_matrix <- matrix(1:12, nrow = 4)
  good_matrix <- c(1, 2, 3, 4)
  bad_matrix <- c(1, 2, 3)
  non_numeric <- "not a numeric"

  R_vector <- 1:4
  good_vector <- 1
  bad_vector <- 1:2

  expect_no_error(assert_c_vector(R_matrix, good_matrix))
  expect_error(assert_c_vector(R_matrix, bad_matrix))
  expect_no_error(assert_c_vector(R_vector, good_vector))
  expect_error(assert_c_vector(R_vector, bad_vector))
  expect_error(assert_c_vector(R_vector, non_numeric))
  expect_error(assert_c_vector(R_matrix, non_numeric))
})
