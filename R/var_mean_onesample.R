#' @rdname var_mean_indep
#' @export
var_mean_onesample <- function(df, vars = names(df)) {
  stopifnot("`df` must be a data.frame." = is.data.frame(df))
  match.arg(vars, several.ok = TRUE)
  local({
    cov_matrix <- stats::cov(df[, vars], use = "complete.obs")
    n_incomplete_cases <- sum(apply(df[, vars], 2, function(x) any(is.na(x))))
    n_complete_cases <- nrow(df) - n_incomplete_cases

    cov_matrix / n_complete_cases
  })
}
