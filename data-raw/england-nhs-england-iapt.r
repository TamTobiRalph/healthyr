# Load libs
library(tidyverse)
library(httr)
library(geographr)
library(devtools)

# Load our sysdata(query_url data) from R folder
load_all(".")

qu <-
    query_url |>
    filter(id == "iapt")|>
    pull(query)


GET(
    qu,
    write_disk(tf <- tempfile(fileext = ".zip"))
  )


unzip(tf, exdir = tempdir())


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