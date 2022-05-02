# load data and helpful libraries ----------------------------------------
library(tidyverse)
library(lubridate)

files <- paste0("data-raw/", c("flights", "airlines", "weather", "planes"), ".rda")
map(files, load, .GlobalEnv)

# join and tidy data -----------------------------------------------------
dcflights21 <-
  # start with weather data, selecting off relevant columns
  weather %>%
  select(origin, year, month, day, hour, wind_speed, visibility = visib) %>%
  # join to flight data
  right_join(flights, by = c("origin", "year", "month", "day", "hour")) %>%
  # join to airline data to get full carrier name
  left_join(airlines, by = c("carrier")) %>%
  select(-carrier, airline = name) %>%
  # select, rename, and restructure columns
  mutate(date = make_date(year, month, day),
         duration = air_time,
         flight = as.factor(flight),
         plane = tailnum,
         destination = dest
         ) %>%
  select(airline, flight, origin, destination, date, hour, dep_delay, 
         plane, duration, wind_speed, visibility) %>%
  left_join(
    .,
    select(planes, plane = tailnum, plane_year = year),
    by = "plane"
  ) %>%
  mutate(across(where(is.character), ~ as.factor(.x)),
         airline = as.character(airline))

dcflights21

# save results ----------------------------------------------------------
usethis::use_data(dcflights21, overwrite = TRUE)
