library(rlang)
library(purrr)

is_data_topic <- function(nm) {
  env_get_list(nm = nm, inherit = TRUE) %>% map_lgl(is.data.frame)
}
