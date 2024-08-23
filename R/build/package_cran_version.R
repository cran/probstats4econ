library(magrittr)
library(gh)
library(stringr)
library(purrr)

get_package_cran_version <- function() {
  gh("/repos/jabrevaya/probstats4econ/releases/latest") %$%
    tag_name %>%
    str_match("^v([\\d\\.]+)$") %>%
    pluck(2)
}
