#' Plot count data
#'
#' @param x data.frame with columns age and n
#' @param my_age Character. Age group.
#'
#' @importFrom ggplot2 ggplot aes geom_col scale_fill_manual labs guides theme_classic
#'
#' @export
#' @examples
#' library(dplyr)
#' my_squirrels <- tibble(age = c("Adult", "Juvenile"),
#'                        primary_fur_color = c("Gray", "Black"))
#' filter_count(x = my_squirrels, my_age = "Adult") %>%
#'   plot_count(my_age = "Adult")
plot_count <- function(x, my_age = "all") {
  # Test
  if (!all(c("n", "primary_fur_color") %in% names(x))) {
    stop("x should contain 'n' and 'primary_fur_color' columns")
  }
  ggplot(x) +
    aes(x = primary_fur_color, y = n, fill = primary_fur_color) +
    geom_col() +
    scale_fill_manual(
      values = c("Cinnamon" = "#D2691E",
                 "Black" = "black",
                 "Gray" = "gray40"),
      na.value = "cyan4") +
    labs(
      title = paste("Count of", tolower(my_age), "squirrels by fur color"),
      x = "Primary fur color",
      y = "Count"
    ) +
    guides(fill = FALSE) +
    theme_classic()
}
