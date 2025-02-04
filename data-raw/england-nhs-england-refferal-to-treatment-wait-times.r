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
    filter(id == "referral_to_treatment_waiting_times")|>
    pull(query)

GET(
    qu,
    write_disk(tf <- tempfile(fileext = ".zip"))
  )

unzip(tf, exdir = tempdir())

raw <-
  read_csv(
    list.files(
     tempdir(),
      pattern = ".*RTT.*.csv",
      full.names = TRUE
   )
  )

# Clean names
rtt_clean_names <-
  raw |>
  clean_names()

# Calculate 18 week count
rtt_count <-
  rtt_clean_names |>
  filter(treatment_function_name == "Total") |>
  rowwise() |>
  mutate(
    gt_18_weeks_sum_1 = sum(
      c_across(gt_18_to_19_weeks_sum_1:gt_104_weeks_sum_1),
      na.rm = TRUE
    ),
    gt_52_weeks_sum_1 = sum(
      c_across(gt_52_to_53_weeks_sum_1:gt_104_weeks_sum_1),
      na.rm = TRUE
    )
  ) |>
  ungroup()

# Select cols
rtt_vars <-
  rtt_count |>
  select(
    `Trust Code` = provider_org_code,
    `Referral Treatment Type` = rtt_part_description,
    treatment = treatment_function_name,
    `Waiting 52+ Weeks` = gt_52_weeks_sum_1,
    `Waiting 18+ Weeks` = gt_18_weeks_sum_1,
    `Total Waiting List` = total_all
  )

# Keep only treatment totals (not breakdowns)
rtt_totals <-
  rtt_vars |>
  filter(treatment == "Total") |>
  select(-treatment)

# Calculate summaries across trusts
rtt_summaries <-
  rtt_totals |>
  group_by(
    `Trust Code`,
    `Referral Treatment Type`
  ) |>
  summarise(
    `Waiting 52+ Weeks` = sum(`Waiting 52+ Weeks`, na.rm = TRUE),
    `Waiting 18+ Weeks` = sum(`Waiting 18+ Weeks`, na.rm = TRUE),
    `Total Waiting List` = sum(`Total Waiting List`, na.rm = TRUE)
  ) |>
  ungroup()

# Calculate relative wait times
rtt_relative <-
  rtt_summaries |>
  mutate(
    `% Waiting 18+ Weeks` = `Waiting 18+ Weeks` / `Total Waiting List`,
    `% Waiting 52+ Weeks` = `Waiting 52+ Weeks` / `Total Waiting List`
  )

# Filter to only open trusts
england_nhs_referral_treatment_waiting_times <-
  open_trusts |>
  left_join(
    rtt_relative,
    by = "Trust Code"
  )

# # Pivot longer
# england_nhs_england_referral_treatment_waiting_times <-
#   england_referral_treatment_waiting_times |>
#   pivot_longer(
#     cols = where(is.double)
#   )

# Save
usethis::use_data(england_nhs_referral_treatment_waiting_times, overwrite = TRUE)