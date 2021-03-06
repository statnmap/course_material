% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_filtered.R
\name{plot_count}
\alias{plot_count}
\title{Plot count data}
\usage{
plot_count(x, my_age = "all")
}
\arguments{
\item{x}{data.frame with columns age and n}

\item{my_age}{Character. Age group.}
}
\description{
Plot count data
}
\examples{
library(dplyr)
my_squirrels <- tibble(age = c("Adult", "Juvenile"),
                       primary_fur_color = c("Gray", "Black"))
filter_count(x = my_squirrels, my_age = "Adult") \%>\%
  plot_count(my_age = "Adult")
}
