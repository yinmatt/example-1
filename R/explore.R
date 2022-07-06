#loading the libraries
library(lubridate)
library(dplyr)
library(tidyr)
library(ggplot2)

#reading the data
raw_data <- read.csv("data/raw/ramp-data-1095-2022-06-06 00_00_00-07_00-2022-07-07 00_00_00-07_00.csv")
detectors <- read.csv("data/raw/portaldetectors.csv")
stations <- read.csv("data/raw/portalstations.csv")

#reshaped dataframe to one observation per row
data <- pivot_longer(raw_data,cols = 2:8,names_to = "metric")

#we want to change the start time of the data to the ymd_hms format
data$start_time <- ymd_hms(data$start_time, tz = "America/Los_Angeles")


#GENERAL NOTES:
#To remove a data frame/variable, do rm(dataframe) in the console
#To get the first 5 rows of metric data, do head(dataframe$metric)
