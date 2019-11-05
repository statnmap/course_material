
<!-- README.md is generated from README.Rmd. Please edit that file -->

# userpackage

<!-- badges: start -->

<!-- badges: end -->

<!-- description: start -->

This is package {userpackage}: Analyse NYC Squirrel Dataset.  
The aim of {userpackage} is to propose an example package built with
“Rmd first” method during conferences and tutorials. Current version
is 0.0.0.9000. <!-- description: end -->

## Installation

<!-- install: start -->

The list of dependencies required to install this package is: dplyr,
ggplot2, knitr, lubridate, magrittr, readr, rmarkdown, testthat.

To install the package, you can run the following script

``` r
# install.packages("remotes")
remotes::install_local(path = "userpackage.0.0.0.9000.tar.gz")
```

In case something went wrong, you may want to install dependencies
before using:

``` r
# No Remotes ----
# Attachments ----
to_install <- c("dplyr", "ggplot2", "magrittr")
  for (i in to_install) {
    message(paste("looking for ", i))
    if (!requireNamespace(i)) {
      message(paste("     installing", i))
      install.packages(i)
    }
  }
```

<!-- install: end -->

## Reminder of the workflow

1.  **Directly create a new “R package using devtools”**
      - `usethis::create_package("my.project")` if forgotten
2.  Create “dev\_history.R” at the root
      - Use it to store all your `usethis::` and co…
3.  Fill in DESCRIPTION file
4.  Create a small dataset (reprex)
      - Store in “inst/example-data” (or in “data”)
5.  “Rmd first”: Create a vignette
      - `usethis::use_vignette("aa-exploration")`
6.  **Build your functions along with vignette**
      - Document parameters
      - Add example of use
      - Store in “R/” (`usethis_use_r()`)
      - Run `attachment::att_amend_desc()`
      - Add unit tests
7.  Check your package regularly (`devtools::check()`)
8.  Use git and continuous integration
9.  Show your work to your colleagues and customers
    (`pkgdown::build_site()`)
