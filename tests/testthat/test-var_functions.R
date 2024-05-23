# These variance helper are so simple that we
# should just make sure they work and are stable

test_that("var_mean_indep works", {
  set.seed(12345)
  x_vectors <- list(
    rnorm(1000, mean = 1, sd = 2),
    rnorm(10, mean = 4, sd = 0.5),
    rnorm(1000000, mean = 0, sd = 1)
  )
  expect_snapshot(var_mean_indep(x_vectors))
})

test_that("var_prop_indep works", {
  pi_hat <- c(0.1, 0.6, 0.3)
  nobs <- 1000
  expect_snapshot(var_prop_indep(pi_hat, nobs))
})

test_that("var_mean_onesample works", {
  expect_snapshot(var_mean_onesample(cps, c("educ", "age")))
})
