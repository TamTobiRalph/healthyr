# LOADING NECESSARY LIBRARY
library(devtools)
library(tibble)

#Creating tibble Dataframe
query_urlt <- 
  tribble(
    # Column Names
    ~id, ~indicator, ~nation, ~date, ~license, ~query, ~source,
    
    #Entries
    "1", "A&E", "England", "May 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/", "NHS England",
    "2", "Ambulance Quality Indicators", "England", "May 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/ambulance-quality-indicators/", "NHS England",
    "3", "Bed Occupancy (Day & Night)", "England", "March 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/", "NHS England",
    "4", "Cancer Wait Times", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/cancer-waiting-times/", "NHS England",
    "5", "Diagnostic Wait Times", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/diagnostics-waiting-times-and-activity/", "NHS England",
    "6", "Outpatient Referrals", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/outpatient-referrals/", "NHS England",
    "7", "Referral to Treatment Waiting Times", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/", "NHS England",
    "8", "IAPT", "England", "Q4 2021-22", "OGLv3", "https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-report-on-the-use-of-iapt-services/june-2021-final-including-reports-on-the-iapt-pilots-and-quarter-1-data-2021-22", "NHS England",
    "9", "A&E", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/emergency-care-waiting-times", "Department of Health",
    "10", "Reattendance", "Northern Ireland", "2022-2021", "OGLv3", "https://www.health-ni.gov.uk/articles/emergency-care-and-ambulance-statistics", "Department of Health",
    "11", "Cancer Waiting List", "Northern Ireland", "December 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/cancer-waiting-times", "Department of Health",
    "12", "Outpatient Waiting Times", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/outpatient-waiting-times", "Department of Health",
    "13", "Ipatient Waiting Times", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/inpatient-waiting-times", "Department of Health",
    "14", "A&E", "Scotland", "June 2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    "15", "Bed Availability", "Scotland", "December 2021", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    "16", "Cancer Waiting Times", "Scotland", "June 2021", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    "17", "Delayed Transfer of Care", "Scotland", "April 2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    "18", "Referral to Treatment Waiting Times", "Scotland", "March  2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    "19", "A&E", "Wales", "April 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Accident-and-Emergency", "StatsWales",
    "20", "Bed Availabilty", "Wales", "June 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Activity/nhs-activity-and-capacity-during-the-coronavirus-pandemic/nhsbeds-by-date-localhealthboard", "StatsWales",
    "21", "Ambulance Services", "Wales", "April 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Performance/Ambulance-Services", "StatsWales",
    "22", "Cancer Waiting Times", "Wales", "March 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Cancer-Waiting-Times/Monthly/suspectedcancerpathwayclosedpathways-by-localhealthboard-tumoursite-agegroup-gender-measure-month", "StatsWales",
    "23", "Referral to Treatment Waiting Times", "Wales", "March 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Referral-to-Treatment/patientpathwayswaitingtostarttreatment-by-month-groupedweeks-treatmentfunction", "StatsWales",
    
  )
