#' Filters data on age group and count by primary_fur_color
#'
#' @param x data.frame with columns named age and primary_fur_color
#' @param my_age Character. Age group: Adult or Juvenile
#'
#' @importFrom dplyr filter count
#' @importFrom magrittr %>%
#'
#' @export
#' @examples
#' library(dplyr)
#' my_squirrels <- tibble(age = c("Adult", "Juvenile"),
#'                        primary_fur_color = c("Gray", "Black"))
#' filter_count(x = my_squirrels, my_age = "Adult")
filter_count <- function(x, my_age) {
  # Test
  if (!all(c("age", "primary_fur_color") %in% names(x))) {
    stop("x should contain 'age' and 'primary_fur_color' columns")
  }
  x %>%
    filter(age %in% my_age) %>%
    count(primary_fur_color)
}

