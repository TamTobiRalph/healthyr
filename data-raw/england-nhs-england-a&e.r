# Load libs
library(tidyverse)
library(httr)
library(readxl)
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
    filter(id == "a_e")|>
    pull(query)
  
  GET(
    qu,
    write_disk(tf <- tempfile(fileext = ".xls"))
  )

raw <-
  read_excel(
    tf,
    sheet = "Provider Level Data",
    skip = 15
  )

  
# remove first two entries (one is totals, other is blank)
ae_sliced <-
  raw |>
  slice(-(1:2))

# Remove empty rows at the end of the spreadsheet
ae_remove_empty <-
  ae_sliced |>
  drop_na()

# Keep vars of interest
ae_vars <-
  ae_remove_empty |>
  select(
    `Trust Code` = Code,
    `No. Type 1 Attendance` = `Type 1 Departments - Major A&E...4`,
    `No. Type 2 Attendance` = `Type 2 Departments - Single Specialty...5`,
    `No. Type 3 Attendance` = `Type 3 Departments - Other A&E/Minor Injury Unit...6`,
    `No. Attendance Total` = `Total attendances`,
    `% Type 1 <= 4 hours` = `Percentage in 4 hours or less (type 1)`,
    `% Type 2 <= 4 hours` = `Percentage in 4 hours or less (type 2)`,
    `% Type 3 <= 4 hours` = `Percentage in 4 hours or less (type 3)`,
    `% Total <= 4 hours` = `Percentage in 4 hours or less (all)`,
    `No. patients >= 4h from decisiion to admit to admission` = `Number of patients spending >4 hours from decision to admit to admission`,
    `No. patients >= 12h from decisiion to admit to admission` = `Number of patients spending >12 hours from decision to admit to admission`
  )

# Replace '-' character with NA
ae_replace <-
  ae_vars |>
  mutate(
    across(
      .cols = !c(`Trust Code`),
      ~ str_replace_all(.x, "-", NA_character_)
    )
  )

# Change cols to double
ae_double <-
  ae_replace |>
  mutate(
    across(
      .cols = !c(`Trust Code`),
      as.double
    )
  )

# Filter to only open trusts
england_nhs_ae <-
  open_trusts |>
  left_join(
    ae_double,
    by = "Trust Code"
  )

# # Pivot longer
# england_nhs_england_ae <-
#   england_ae |>
#   pivot_longer(
#     cols = !starts_with("Trust")
#   )

# Save
usethis::use_data(england_nhs_ae, overwrite = TRUE)
