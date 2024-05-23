test_that("SLR T test equivalence", {
  m <- setup_slr()
  out <- linear_combination(m$model, c(0, 1))
  expect_snapshot(out)

  coef_test <- unname(summary(m$model)$coefficients[2, ])
  expect_equal(out$estimate, coef_test[1])
  expect_equal(out$se, coef_test[2])
  expect_equal(out$p_value, coef_test[4], tolerance = 1e-5)
})

test_that("MLR Works", {
  m <- setup_mlr()
  out <- linear_combination(m$model, c(0, 0, 1, -1))
  expect_snapshot(out)
})
