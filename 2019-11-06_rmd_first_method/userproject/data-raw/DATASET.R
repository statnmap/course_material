## code to prepare `DATASET` dataset goes here

# NYC Squirrel Data ----
# source: https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-10-29
# Download dataset
download.file(
  "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-29/nyc_squirrels.csv",
  destfile = "data-raw/nyc_squirrels.csv"
)
# nyc_squirrels <- readr::read_csv()
# usethis::use_data("DATASET")
