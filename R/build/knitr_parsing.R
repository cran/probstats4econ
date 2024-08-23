library(purrr)
library(dplyr)
library(rlang)
library(knitr)
library(glue)
library(stringr)

.lines <- NULL

setLines <- function(infile) {
  .lines <<- readLines(infile)
}

build_struct_recursive <-
  function(cur_depth = 0,
           max_depth,
           range = 1:length(.lines)) {
    # \chapter, \section, etc.
    pattern <- paste0("\\\\", level(cur_depth), "((\\{.*\\})|(\\*\\{Appendix.*\\}))")
    matches <- range[grep(pattern, .lines[range])]

    # stop or recurse
    if (cur_depth == max_depth) {
      map(matches, \(m) {
        attr(m, "appendix") <- str_detect(.lines[m], "\\*")
        return(m)
      })
    } else {
      map2(matches, lead(matches), \(start, end) {
        range <- start:coalesce(end, length(.lines))
        out <- list(
          start = start,
          children = build_struct_recursive(cur_depth + 1, max_depth, range)
        )
        attr(out, "appendix") <- str_detect(.lines[start], "\\*")
        return(out)
      })
    }
  }

walk_struct_recursive <-
  function(hook,
           line_struct,
           state = c(),
           last_index = length(.lines)) {
    for (i in seq_along(line_struct)) {
      new_state <- c(state, i)
      if (length(new_state) > 0) {
        attr(new_state, "appendix") <- attr(line_struct[[i]], "appendix")
      }
      if (is.list(line_struct[[i]])) {
        # note: ignoring code between $start and first line of $children for now
        walk_struct_recursive(
          hook,
          line_struct[[i]]$children,
          new_state,
          ifelse(i == length(line_struct), last_index, line_struct[[i + 1]]$start)
        )
      } else {
        line_range <- seq(
          line_struct[[i]],
          ifelse(i == length(line_struct), last_index, line_struct[[i + 1]])
        )

        r_code <- purl(text = .lines[line_range]) %>%
          str_remove_all("## -+.*([a-z\\.]+=[^-,]+,?\\s?)+-+\\n")

        if (str_length(r_code) > 0) {
          hook(new_state, r_code)
        }
      }
    }
  }

level <- function(depth) {
  if (depth == 0) {
    "chapter"
  } else if (depth == 1) {
    "section"
  } else {
    glue("{rep('sub', depth - 1) %>% glue_collapse}section")
  }
}
