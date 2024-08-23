#' @rdname se_meanx
#' @export
se_rxy <- function(x, y, na.rm = FALSE) {
  if (na.rm) {
    i <- stats::complete.cases(x, y)
    x <- x[i]
    y <- y[i]
  }
  root_n <- sqrt(length(x))
  r <- stats::cor(x, y)
  (1 - r^2) / root_n
}
