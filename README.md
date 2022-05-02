
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

# Preview

The package exports one tibble, `dcflights21`, with data on flight
departures, weather, airline, airport, and the flown plane. The dataset
consists of several different data types with varying degrees of
missingness.

``` r
library(dcflights21)

data(dcflights21)

str(dcflights21)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    208141 obs. of  14 variables:
    ##  $ airline      : chr  "Delta Air Lines Inc." "SkyWest Airlines Inc." "American Airlines Inc." "Endeavor Air Inc." ...
    ##  $ flight       : Factor w/ 2186 levels "1","2","3","4",..: 558 725 687 932 649 69 327 490 273 339 ...
    ##  $ origin       : chr  "BWI" "BWI" "BWI" "BWI" ...
    ##  $ destination  : chr  "ATL" "ORD" "CLT" "DTW" ...
    ##  $ date         : Date, format: "2021-01-01" "2021-01-01" ...
    ##  $ hour         : num  6 6 6 6 6 6 7 7 7 7 ...
    ##  $ dep_delay    : num  -11 -10 -8 2 -1 0 -12 -4 -3 -6 ...
    ##  $ plane        : chr  "N3744F" "N718SK" "N909NN" "N305PQ" ...
    ##  $ duration     :
    ## Formal class 'Duration' [package "lubridate"] with 1 slot
    ##   .. ..@ .Data: num  6000 5940 3900 4020 12840 ...
    ##  $ temperature  : num  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ wind_speed   : num  2.3 2.3 2.3 2.3 2.3 ...
    ##  $ precipitation: num  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ visibility   : num  10 10 10 10 10 10 10 10 10 10 ...
    ##  $ plane_year   : int  2001 2004 2012 2014 2008 2017 2014 2019 2013 2018 ...

# Data Sources

For the most part, the data in this package can be downloaded,
processed, packaged, and documented with the following lines:

``` r
# install.packages("anyflights")

library(anyflights)

dcflights21 <- anyflights(station = c("BWI", "DCA", "IAD"), year = 2021)

as_flights_package("dcflights21")
```

The {anyflights} documentation outlines data sources in detail. Changes
to the output of the above lines are reproduced in `data-raw/tidy.R`.
