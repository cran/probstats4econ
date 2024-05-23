library(magrittr)
library(glue)
library(purrr)
library(stringr)

card_template <- '
<div class="col-sm-6 col-lg-4">
<div class="card">
<div class="card-body">
<h5 class="card-title"><a href="reference/{title}.html">{title}</a></h5>
<h6 class="card-subtitle mb-2 text-muted">{subtitle}</h6>
<p class="card-text">{description}</p>
<a href="datasets/{title}.xlsx" class="card-link">Excel</a>
<a href="datasets/{title}.csv" class="card-link">CSV</a>
<a href="datasets/{title}.dta" class="card-link">Stata</a>
</div>
</div>
</div>
'

pull_description <- . %>%
  keep(. %>% inherits("tag_description")) %>%
  `[[`(1) %>%
  reduce(str_c)
