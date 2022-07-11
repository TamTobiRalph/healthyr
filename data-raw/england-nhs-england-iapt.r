# Load libs
library(tidyverse)
library(httr)

# Load data
# Download latest quarterly data by STP/ICS from https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-report-on-the-use-of-iapt-services
#GET(
#  "https://files.digital.nhs.uk/30/82DB0C/iapt-quarterly-activity-data-files.zip",
#  write_disk(tf <- tempfile(fileext = ".zip"))
#)

#unzip(tf, exdir = tempdir())

tf <-
    query_url |>
    filter(id == "IAPT")|>
    pull(query)

#unzip(tf, exdir = tempdir())


iapt_raw <-
  read_csv(
    file.path(tempdir(), "iapt-quarterly-STP-and-CCG-Q4.csv"),
    col_types = cols(.default = col_character())
  )

# Analyse waiting times by STP
iapt_filtered <-
  iapt_raw |>
  filter(
    CCG == "All_CCG",
    VariableType == "Total",
    GroupType == "STP",
    STP != "InvalidCode",
    MEASURE_NAME == "Percentage_FirstTreatment18WeeksFinishedCourseTreatment"
  )

iapt_selected <-
  iapt_filtered |>
  select(
    stp_code_short = STP,
    `Referrals that finished a course of treatment in the month waiting 126 days or less for first treatment` = MEASURE_VALUE_SUPPRESSED
  )

iapt_double <-
  iapt_selected |>
  mutate(`Referrals that finished a course of treatment in the month waiting 126 days or less for first treatment` = as.double(`Referrals that finished a course of treatment in the month waiting 126 days or less for first treatment`))

england_nhs_iapt <-
  iapt_double

# Save
usethis::use_data(england_nhs_iapt, overwrite = TRUE)