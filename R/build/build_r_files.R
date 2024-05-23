library(here)
library(rlang)
library(knitr)
library(purrr)

source(here("R/build/knitr_parsing.R"))

ensure_lines <- function() {
  infile <- Sys.getenv("BOOK_RNW")
  setLines(infile)
}

#### build the line struct

### create a .Renviron file with BOOK_RNW = "path/to/file.Rnw"
build_line_struct <- function(depth = 0) {
  ensure_lines()
  build_struct_recursive(max_depth = depth)
}

#### use the line struct to write r files

r_code_dir <- here("pkgdown/assets/r_files/")

paths <- character()

write_hook <- function(state, r_code) {
  filename <- state %>%
    sprintf("%02d", .) %>%
    str_c(collapse = "_") %>%
    str_c(r_code_dir, "ps4e_", ., ".r")

  paths <<- c(paths, filename)

  writeLines(r_code, filename)
}

write_r_files <- function(line_struct) {
  ensure_lines()
  # remove existing files in r_code_dir, read in lines of file
  file.exists(r_code_dir) || stop("Destination directory doesn't exist.")
  unlink(here(r_code_dir, list.files(r_code_dir)))
  walk_struct_recursive(write_hook, line_struct)
  return(paths)
}

#### use the line struct to compile r code into markdown

code_struct <- NULL

# need lists to avoid simplifying numeric indexes to characters...
intersperse <- \(l, x) {
  reduce(l, \(acc, curr) as.list(acc) %>% append(list(x, curr)))
}

code_hook <- function(state, r_code) {
  pluck(code_struct, !!!intersperse(state, "children")) <<- r_code
}

build_r_code <- function(line_struct, template) {
  ensure_lines()
  code_struct <<- line_struct

  walk_struct_recursive(code_hook, line_struct)

  source(here("R/build/rmd_r_code_template.R"))

  knit(
    input = template,
    output = here("code.md"),
    env = env(code_struct = code_struct),
    quiet = TRUE
  )

  return(here("code.md"))
}
