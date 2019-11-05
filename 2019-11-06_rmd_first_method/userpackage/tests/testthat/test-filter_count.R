my_squirrels <- dplyr::tibble(age = c("Adult", "Juvenile"),
                       primary_fur_color = c("Grey", "Black"))
out_count <- filter_count(x = my_squirrels, my_age = "Adult")


test_that("filter_count works", {
  # tests
  expect_equal(nrow(out_count), 1)
  expect_equal(ncol(out_count), 2)

  my_squirrels_error <- dplyr::tibble(not_age = c("Adult", "Juvenile"),
                               primary_fur_color = c("Grey", "Black"))
  expect_error(filter_count(x = my_squirrels_error, my_age = "Adult"))
})
