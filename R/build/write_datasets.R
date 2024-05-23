library(writexl)
library(haven)
library(readr)
library(renv)
library(purrr)
library(glue)
library(here)
library(dplyr)

formats <- list(
  xlsx = list(
    f = write_xlsx,
    ext = "xlsx",
    name = "Excel"
  ),
  csv = list(
    f = write_csv,
    ext = "csv",
    name = "CSV"
  ),
  dta = list(
    f = write_dta,
    ext = "dta",
    name = "Stata"
  )
)

write_dataset <- function(name) {
  data <- env_get(nm = name, inherit = TRUE)
  map_chr(formats, \(fmt) {
    file <- here("pkgdown", "assets", "datasets", glue("{name}.{fmt$ext}"))
    fmt$f(data, file)
    file
  })
}

write_datasets <- function(data_spec) {
  data_spec %>%
    pull(name) %>%
    map(write_dataset) %>%
    reduce(c)
}
