# Load libs
library(tidyverse)
library(httr)
library(readxl)
library(janitor)
library(sf)
library(geographr)
library(devtools)

# Load our sysdata(query_url data) from R folder
load_all(".")

# Create trust lookup of open trusts
open_trusts <-
  points_nhs_trusts22 |>
  as_tibble() |>
  filter(status == "open") |>
  select(
    `Trust Code` = nhs_trust22_code,
    `Trust Name` = nhs_trust22_name
  ) |>
  mutate(
    `Trust Name` = str_to_title(`Trust Name`),
    `Trust Name` = str_replace(`Trust Name`, "Nhs", "NHS")
  )

# Load raw data
  qu <-
    query_url |>
    filter(id == "cancer_wait_times")|>
    pull(query)

  GET(
    qu,
    write_disk(tf <- tempfile(fileext = ".xlsx"))
  )

raw <-
  read_excel(tf)

# Make colnames snake_case and drop cols
cancer_wait_times_snake_case <-
  raw |>
  clean_names()

# Filter latest month
latest_period <-
  cancer_wait_times_snake_case |>
  count(period) |>
  slice_tail(n = 1) |>
  pull(period)

cancer_wait_times_latest <-
  cancer_wait_times_snake_case |>
  filter(period == latest_period)

# Drop cols
cancer_wait_times_vars <-
  cancer_wait_times_latest |>
  select(
    `Trust Code` = org_code,
    Standard = standard,
    `Total Treated` = total_treated,
    `Within Standard` = within_standard,
    Breaches = breaches
  )

# Summarise
cancer_wait_times_summaries <-
  cancer_wait_times_vars |>
  group_by(
    `Trust Code`,
    Standard
  ) |>
  summarise(
    `Total Treated` = sum(`Total Treated`),
    `Within Standard` = sum(`Within Standard`),
    Breaches = sum(Breaches)
  ) |>
  ungroup()

# Rename 'standard' 2WW name
cancer_wait_times_standard_rename <-
  cancer_wait_times_summaries |>
  mutate(
    Standard = case_when(
      Standard == "2WW" ~ "2 Week Wait",
      Standard == "2WW Breast" ~ "2 Week Wait Breast",
      TRUE ~ Standard
    )
  )

# Round vars
cancer_wait_times_rounded <-
  cancer_wait_times_standard_rename |>
  mutate(
    across(where(is.double), ~ round(.x, 1))
  )

# Filter to only open trusts
england_nhs_cancer_wait_times <-
  open_trusts |>
  left_join(
    cancer_wait_times_rounded,
    by = "Trust Code"
  )

# Save
usethis::use_data(england_nhs_cancer_wait_times, overwrite = TRUE)