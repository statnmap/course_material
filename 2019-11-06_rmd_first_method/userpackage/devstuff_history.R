# Hide this file from build
usethis::use_build_ignore("devstuff_history.R")
usethis::use_build_ignore("inst/dev")
usethis::use_build_ignore("rsconnect")
usethis::use_git_ignore("docs/")
usethis::use_git_ignore("rsconnect/")
# usethis::create_package(".")

# description ----
library(desc)
unlink("DESCRIPTION")
my_desc <- description$new("!new")
my_desc$set_version("0.0.0.9000")
my_desc$set(Package = "deeptools")
my_desc$set(Title = "Tools to analyze video images")
my_desc$set(Description = "Images were analyzed in a game. This package explores the results of the game.")
my_desc$set("Authors@R",
            'c(
  person("Sebastien", "Rochette", email = "sebastien@thinkr.fr", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-1565-9313")),
  person("Colin", "Fay", email = "colin@thinkr.fr", role = c("aut"), comment = c(ORCID = "0000-0001-7343-1846")),
  person("Vincent", "Guyader", email = "vincent@thinkr.fr", role = c("aut"), comment = c(ORCID = "0000-0003-0671-9270")),
  person(given = "ThinkR", role = "cph")
)')
my_desc$set("VignetteBuilder", "knitr")
my_desc$del("Maintainer")
my_desc$del("URL")
my_desc$del("BugReports")
my_desc$write(file = "DESCRIPTION")

# Licence ----
usethis::use_mit_license("ThinkR")
# usethis::use_gpl3_license("ThinkR")

# Pipe ----
usethis::use_pipe()

# Package quality ----

# _Tests
usethis::use_testthat()
usethis::use_test("app")

# _CI
thinkridentity::use_gitlab_ci(image = "thinkr/runnerci", upgrade = "never")
# tic::use_tic()
# travis::travis_set_pat()
# usethis::use_travis()
# usethis::use_appveyor()
# usethis::use_coverage()

# _rhub
# rhub::check_for_cran()


# Documentation ----
# _Readme
# usethis::use_readme_rmd()
chameleon::generate_readme_rmd()
chameleon::generate_readme_rmd(parts = "description")
# _News
usethis::use_news_md()
# _Vignette
thinkridentity::create_vignette_thinkr("aa-data-exploration")
usethis::use_vignette("ab-model")
devtools::build_vignettes()


# _Book
# remotes::install_github(repo = "ThinkR-open/chameleon")
chameleon::create_book("inst/report", clean = TRUE)
chameleon::open_guide_function()
devtools::document()
chameleon::build_book(clean_rmd = TRUE, clean = TRUE)
# pkg::open_guide()

# _Pkgdown
chameleon::build_pkgdown(
  # lazy = TRUE,
  yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
  favicon = system.file("pkgdown/favicon.ico", package = "thinkridentity"),
  move = TRUE, clean_before = TRUE, clean_after = TRUE
)

chameleon::open_pkgdown_function(path = "docs")
# pkg::open_pkgdown()

## __ deploy on rsconnect
usethis::use_git_ignore("docs/rsconnect")
usethis::use_git_ignore("inst/docs/rsconnect")
usethis::use_git_ignore("rsconnect")

rsconnect::accounts()
account_name <- rstudioapi::showPrompt("Rsconnect account", "Please enter your username:", "name")
account_server <- rstudioapi::showPrompt("Rsconnect server", "Please enter your server name:", "1.1.1.1")
origwd <- setwd("inst/docs")
rsconnect::deployApp(
  ".",                       # the directory containing the content
  appFiles = list.files(".", recursive = TRUE), # the list of files to include as dependencies (all of them)
  appPrimaryDoc = "index.html",                 # the primary file
  appName = "appname",                   # name of the endpoint (unique to your account on Connect)
  appTitle = "appname",                  # display name for the content
  account = account_name,                # your Connect username
  server = account_server                    # the Connect server, see rsconnect::accounts()
)
setwd(origwd)

# Dependencies ----
# devtools::install_github("ThinkR-open/attachment")
attachment::att_to_description(extra.suggests = c("bookdown", "pkgdown"))
# attachment::create_dependencies_file()

# Description and Bibliography
chameleon::create_pkg_desc_file(out.dir = "inst", source = c("archive"), to = "html")
thinkridentity::create_pkg_biblio_file_thinkr()

# Utils for dev ----
# Get global variables
checkhelper::print_globals()
# Install
devtools::install(upgrade = "never")
# devtools::load_all()
devtools::check(vignettes = TRUE)
# ascii
stringi::stri_trans_general("é", "hex")
