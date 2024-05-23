library(purrr)
library(glue)
library(snakecase)

state_to_heading <- function(state) {
  level <- if (length(state) == 1) {
    "chapter"
  } else if (length(state) == 2) {
    "section"
  } else if (length(state) >= 3) {
    "subsection"
  } else {
    stop("Invalid state")
  }

  state_heading <- state |>
    as.integer() |>
    glue_collapse(sep = ".")

  glue("{level} {state_heading}") |> to_title_case(sep_in = " ")
}

state_to_id <- compose(
  partial(glue_collapse, sep = "_"),
  partial(append, values = c("ps4e"), after = 0),
  partial(sprintf, "%02d")
)

accordion_start <- '<div class="accordion" id="accordion{id}">'

accordion_end <- "</div>\n"

accordion_item_start <- '
<div class="accordion-item">

<h2 class="accordion-header" id="heading{id}">

<button
    class="accordion-button"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target="#collapse{id}"
    aria-expanded="true"
    aria-controls="collapse{id}">

{heading}

</button>

</h2>

<div
    id="collapse{id}"
    class="accordion-collapse collapse"
    aria-labelledby="heading{id}"
    data-bs-parent="#accordion{parent_id}">

<div class="accordion-body">\n
\n\n'

accordion_item_end <- "</div></div></div>\n"

code_listing <- "\n[Download](r_files/{id}.r)\n\n```r\n{code}\n```\n\n"


print_struct_recursive <- function(code_struct, state = c()) {
  cat(glue(accordion_start, id = state_to_id(state)))

  iwalk(code_struct, \(x, i) {
    state <- c(state, i)

    # this points to a line number
    # (aka failed to parse code from this section)
    if (is.numeric(x)) {
      return()
    }

    cat(glue(
      accordion_item_start,
      id = state_to_id(state),
      heading = state_to_heading(state),
      parent_id = state_to_id(head(state, length(state) - 1))
    ))

    if (is.list(x)) {
      print_struct_recursive(x$children, state)
    } else {
      cat(glue(
        code_listing,
        id = state_to_id(state),
        code = x
      ))
    }

    cat(accordion_item_end)
  })

  cat(accordion_end)
}
