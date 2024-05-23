# this one delegates to wald_test, so
# just need to make sure it works with lm_robust
test_that("Basic coverage", {
  m <- setup_mlr()
  R <- matrix(c(0, 1, 0, 0, 0, 0, 0, 1), nrow = 2, byrow = TRUE)
  r <- c(0, 0)
  out <- test_linear_restrictions(m$model, R, r)
  expect_snapshot(out)
})

test_that("No r handled", {
  m <- setup_mlr()
  R <- matrix(c(0, 1, 0, 0, 0, 0, 0, 1), nrow = 2, byrow = TRUE)
  out <- test_linear_restrictions(m$model, R)
  expect_snapshot(out)
})
