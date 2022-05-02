# load data and helpful libraries ----------------------------------------
library(tidyverse)
library(lubridate)

files <- paste0("data-raw/", c("flights", "airlines", "weather", "planes"), ".rda")
map(files, load, .GlobalEnv)

# join and tidy data -----------------------------------------------------
dcflights21 <-
  # start with weather data, selecting off relevant columns
  weather %>%
  select(origin, year, month, day, hour, temperature = temp, wind_speed,
         precipitation = precip, visibility = visib) %>%
  # join to flight data
  right_join(flights, by = c("origin", "year", "month", "day", "hour")) %>%
  # join to airline data to get full carrier name
  left_join(airlines, by = c("carrier")) %>%
  select(-carrier, airline = name) %>%
  # select, rename, and restructure columns
  mutate(date = make_date(year, month, day),
         duration = duration(air_time, units = "minutes"),
         flight = as.factor(flight),
         plane = tailnum,
         destination = dest
         ) %>%
  select(airline, flight, origin, destination, date, hour, dep_delay, 
         plane, duration, temperature, wind_speed, precipitation, visibility) %>%
  left_join(
    .,
    select(planes, plane = tailnum, plane_year = year),
    by = "plane"
  )

dcflights21

# save results ----------------------------------------------------------
usethis::use_data(dcflights21, overwrite = TRUE)
