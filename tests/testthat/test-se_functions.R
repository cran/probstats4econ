test_that("se_meanx works", {
  set.seed(12345)
  x <- rnorm(1000, mean = 1, sd = 2)
  expect_snapshot(se_meanx(x))
})

test_that("se_sx works", {
  set.seed(12345)
  x <- rnorm(1000, mean = 1, sd = 2)
  expect_snapshot(se_sx(x))
})

test_that("se_rxy works", {
  set.seed(12345)
  samples <- setup_joint_normal()$samples
  x <- samples[, 1]
  y <- samples[, 2]
  expect_snapshot(se_rxy(x, y))
})
