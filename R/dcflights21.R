#' Flights data
#'
#' Data for all flights that departed from airports serving the
#' Washington, DC area in 2021.
#'
#' @name dcflights21
#' @aliases flights
#' @docType data
#' @format A data frame with columns:
#' \describe{ 
#'   \item{airline}{Airline name.} 
#'   \item{flight}{Flight number.} 
#'   \item{origin, destination}{Origin and destination airports.}
#'   \item{date}{Date of departure.} 
#'   \item{hour}{Time of scheduled departure by hour}
#'   \item{plane}{Plane tail number, giving a unique ID for each plane.} 
#'   \item{distance}{Distance between airports, in miles.} 
#'   \item{duration}{Scheduled amount of time spent in the air, in minutes.} 
#'   \item{wind_speed}{Wind speed, in miles per hour.}
#'   \item{visibility}{Visibility, in miles.}
#'   \item{plane_year}{Year the flown plane was manufactured.}
#'   \item{dep_delay}{Departure delay, in
#'     minutes. Negative values represent early departures/arrivals.}
#' }
#' @source RITA, Bureau of transportation statistics,
#' \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source ASOS download from Iowa Environmental Mesonet,
#' \url{https://mesonet.agron.iastate.edu/request/download.phtml}.
#' @source \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source FAA Aircraft registry,
#' \url{http://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download/}
#' @keywords datasets
NULL


#' Flights data
#'
#' Data for flights that departed from the Washington DC airport (Reagan 
#' Internation) during July 2021 and arrived at one of the top 10 connecting
#' airports.
#'
#' @name dcflights
#' @docType data
#' @format A data frame with columns:
#' \describe{ 
#'   \item{airline}{Airline name.} 
#'   \item{flight}{Flight number.} 
#'   \item{destination}{Destination airports (only the top 10 destination
#'   airports are included in this dataset).}
#'   \item{date}{Date of departure.} 
#'   \item{hour}{Time of scheduled departure by hour}
#'   \item{visibility}{Visibility, in miles.}
#'   \item{duration}{Scheduled amount of time spent in the air, in minutes.} 
#'   \item{dep_delay}{Departure delay, in
#'     minutes. Negative values represent early departures/arrivals.}
#' }
#' @source RITA, Bureau of transportation statistics,
#' \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source ASOS download from Iowa Environmental Mesonet,
#' \url{https://mesonet.agron.iastate.edu/request/download.phtml}.
#' @source \url{https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
#' @source FAA Aircraft registry,
#' \url{http://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download/}
#' @keywords datasets
NULL
