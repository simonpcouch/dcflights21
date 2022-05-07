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
  select(airline, flight, origin, destination, date, hour, 
         plane, distance, duration, wind_speed, visibility, dep_delay) %>%
  left_join(
    .,
    select(planes, plane = tailnum, plane_year = year),
    by = "plane"
  ) %>%
  mutate(across(where(is.character), ~ as.factor(.x)),
         airline = as.character(airline)) %>%
  relocate(dep_delay, .after = last_col())

dcflights21

# save results ----------------------------------------------------------
usethis::use_data(dcflights21, overwrite = TRUE)

# smaller dataset -------------------------------------------------------

dcflights <-
  dcflights21 %>%
  mutate(destination = as.character(destination)) %>%
  filter(origin == "DCA",
         date >= "2021-07-01", date < "2021-08-01") 

top_destinations <- 
  dcflights %>%
  group_by(destination) %>%
  summarise(dest_total = n()) %>%
  ungroup() %>%
  slice_max(dest_total, n = 10) %>%
  pull(destination)

dcflights <-
  dcflights %>%
  filter(destination %in% top_destinations) %>%
  select(airline, flight, destination, date, hour, visibility, duration, dep_delay) %>%
  na.omit() %>%
  mutate(destination = as.factor(destination))

usethis::use_data(dcflights, overwrite = TRUE)
