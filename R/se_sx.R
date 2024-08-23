#' @rdname se_meanx
#' @export
se_sx <- function(x, na.rm = FALSE) {
  if (na.rm) {
    x <- x[!is.na(x)]
  }
  root_n <- sqrt(length(x))
  x_bar <- mean(x)
  sx <- stats::sd(x)
  sqrt(mean((x - x_bar)^4) - sx^4) / (2 * root_n * sx)
}
