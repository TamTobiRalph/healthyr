# Load libs
library(tidyverse)
library(httr)
library(readxl)
library(sf)
library(geographr)

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
GET(
  "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/06/May-2022-AE-by-provider-a5cdd.xls",
  write_disk(tf <- tempfile(fileext = ".xls"))
)

raw <-
  read_excel(
    tf,
    sheet = "Provider Level Data",
    skip = 15
  )