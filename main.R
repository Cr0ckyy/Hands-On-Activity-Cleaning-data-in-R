# Install the necessary packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

# Load the packages into the current R session
library(tidyverse)
library(skimr)
library(janitor)

# Read in the hotel bookings data
bookings_df <- read_csv("hotel_bookings.csv")

# View the first few rows of the data frame
head(bookings_df)

# View the structure of the data frame
str(bookings_df)

# Get a summary of the data frame
glimpse(bookings_df)

# View the column names of the data frame
colnames(bookings_df)

# Get a summary of the data frame without charts
skim_without_charts(bookings_df)

# Create a new data frame with only the columns of interest
trimmed_df <- bookings_df %>%
  select(hotel, is_canceled, lead_time)

# Rename a column in the new data frame
trimmed_df %>%
  select(hotel, is_canceled, lead_time) %>%
  rename(hotel_type = hotel)

# Combine two columns into a single column
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>%
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

# Create new variable in data frame by summing existing variables
example_df <- bookings_df %>%
  mutate(guests = adults + children + babies)
head(example_df)

# Summarize data by summing a variable and finding the mean of another
example_df <- bookings_df %>%
  summarize(number_canceled = sum(is_canceled),
            average_lead_time = mean(lead_time))
head(example_df)