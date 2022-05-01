
# dcflights21

<!-- badges: start -->

[![R-CMD-check](https://github.com/simonpcouch/dcflights21/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/simonpcouch/dcflights21/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

{dcflights21} is an R data-only package supplying data on out-bound
flights from airports serving Washington, DC in 2021.

You can install the package with the following lines

``` r
# install.packages("pak")

pak::pak("simonpcouch/dcflights21")
```

# Data Sources

For the most part, the data in this package can be downloaded,
processed, packaged, and documented with the following lines:

``` r
# install.packages("anyflights")

library(anyflights)

dcflights21 <- anyflights(station = c("BWI", "DCA", "IAD"), year = 2021)

as_flights_package("dcflights21")
```

The {anyflights} documentation outlines data sources in detail.
