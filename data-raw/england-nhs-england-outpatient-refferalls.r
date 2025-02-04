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
#GET(
#  "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/06/MRR_Prov-Web-file-April-22-O1L87D.xls",
#  write_disk(tf <- tempfile(fileext = ".xls"))
#)

qu <-
    query_url |>
    filter(id == "outpatient_referrals")|>
    pull(query)

GET(
    qu,
    write_disk(tf <- tempfile(fileext = ".xls"))
  )


raw <-
  read_excel(
    tf,
    sheet = "Provider",
    skip = 13
  )

# Make colnames snake_case and drop cols
outpatient_snake_case <-
  raw |>
  clean_names()

# Remove first two entries (one is totals, other is blank)
outpatient_sliced <-
  outpatient_snake_case |>
  slice(-(1:2))

# Sort cols
outpatient_vars <-
  outpatient_sliced |>
  select(
    `Trust Code` = org_code,
    `GP Referrals Made (All)` = gp_referrals_made_all,
    `Other Referrals Made (All)` = other_referrals_made_all,
    `GP Referrals Made (Specific Acute)` = gp_referrals_made_specific_acute,
    `Other Referrals Made (Specific Acute)` = other_referrals_made_specific_acute
  )

# Filter to only open trusts
england_nhs_outpatient_referrals <-
  open_trusts |>
  left_join(
    outpatient_vars,
    by = "Trust Code"
  )

# # Pivot longer
# england_outpatient_referrals_longer <-
#   england_nhs_england_outpatient_referrals  |>
#   pivot_longer(
#     cols = !starts_with("Trust")
#   )

# Save
usethis::use_data(england_nhs_outpatient_referrals, overwrite = TRUE)
