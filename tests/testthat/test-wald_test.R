test_that("Default test", {
  set.seed(12345) # this should always fail to reject
  m <- setup_joint_normal()
  wald <- wald_test(m$gamma_hat, m$var_gamma_hat)
  expect_snapshot(wald)

  expect_gt(wald$p_value, 0.05)
})

test_that("Vector R is handled", {
  m <- setup_slr()
  wald <- wald_test(m$gamma_hat, m$var_gamma_hat, R = c(0, 1))
  expect_snapshot(wald)
})

test_that("T test equivalence", {
  m <- setup_slr()
  wald <- wald_test(m$gamma_hat, m$var_gamma_hat, R = matrix(c(0, 1), nrow = 1))
  expect_snapshot(wald)

  t_stat <- summary(m$model)$coefficients[2, 3]
  expect_equal(t_stat^2, wald$W)
})

test_that("Matrix R is handled", {
  m <- setup_slr()
  wald <- wald_test(
    m$gamma_hat,
    m$var_gamma_hat,
    R = matrix(c(0, 1, 1, 1), nrow = 2),
    r = c(900, 1000)
  )
  expect_snapshot(wald)
})

test_that("No R is handled", {
  m <- setup_slr()
  wald <- wald_test(m$gamma_hat, m$var_gamma_hat, r = c(900, 1000))
  expect_snapshot(wald)
})
