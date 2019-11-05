# Hide this file from package built
usethis::use_build_ignore("dev_history.R")

# Choose license
usethis::use_mit_license("ThinkR")

# Create a vignette
usethis::use_vignette("aa-my-analysis")

# Move to scripts
usethis::use_r("filter_count")
usethis::use_r("plot_filtered")

# Use tests
usethis::use_test("filter_count")

# Manage dependencies
# remotes::install_github("ThinkR-open/attachment")
attachment::att_amend_desc()

# Check package
devtools::check()

# Manage globalVariables
# remotes::install_github("ThinkR-open/checkhelper")
checkhelper::print_globals()
usethis::use_r("globals")

# Use {pkgdown} to publish ----
pkgdown::build_site()
# Customize your Rmd template
# chameleon::build_pkgdown()
chameleon::build_pkgdown(
  yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
  favicon = system.file("pkgdown/favicon.ico", package = "thinkridentity"),
  move = TRUE, clean_before = TRUE, clean_after = TRUE, preview = TRUE
)

# Next ====
#_ Add README
usethis::use_readme_rmd()
# _Help populate README
chameleon::create_pkg_desc_file(out.dir = tempdir(),
                                source = "archive", to = "raw",
                                edit = TRUE)
# version control
usethis::use_git()
# Summary of version modifications
usethis::use_news_md()

