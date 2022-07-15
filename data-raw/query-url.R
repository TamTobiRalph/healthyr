# LOADNG NECESSARY LIBRARY
library(devtools)
library(tibble)

#Creating tibble Dataframe
query_url <- 
  tribble(
    # Column Names
    ~id, ~indicator, ~nation, ~date, ~license, ~query, ~source,
    
#Entries
    "a_e", "A&E", "England", "May 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/06/May-2022-AE-by-provider-a5cdd.xls", "https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/",
    "ambulance_quality_indicator", "Ambulance Quality Indicators", "England", "June 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/07/AmbSYS-2022-June.xlsx", "https://www.england.nhs.uk/statistics/statistical-work-areas/ambulance-quality-indicators/",
    "bed_occupancy_day", "Bed Occupancy (Day)", "England", "March 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/05/Beds-Open-Day-Only-Web_File-Q4-2021-22-Final-OIUJK.xlsx", "https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/",
    "bed_occupancy_night", "Bed Occupancy (Night)", "England", "March 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/05/Beds-Open-Overnight-Web_File-Q4-2021-22-Final-OIUJK.xlsx", "https://www.england.nhs.uk/statistics/statistical-work-areas/bed-availability-and-occupancy/",
    "cancer_wait_times", "Cancer Wait Times", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/06/Cancer-Waiting-Times-Apr-Apr-2022-Data-Extract-Provider.xlsx", "https://www.england.nhs.uk/statistics/statistical-work-areas/cancer-waiting-times/",
    "diagnostic_wait_times", "Diagnostic Wait Times", "England", "May 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/07/Monthly-Diagnostics-Web-File-Provider-May-2022_JH58S.xls", "https://www.england.nhs.uk/statistics/statistical-work-areas/diagnostics-waiting-times-and-activity/",
    "outpatient_referrals", "Outpatient Referrals", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/06/MRR_Prov-Web-file-April-22-O1L87D.xls", "https://www.england.nhs.uk/statistics/statistical-work-areas/outpatient-referrals/",
    "referral_to_treatment_waiting_times", "Referral to Treatment Waiting Times", "England", "April 2022", "OGLv3", "https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2022/07/Full-CSV-data-file-May22-ZIP-3611K-16155.zip", "https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/",
    "iapt", "IAPT", "England", "Q4 2021-22", "OGLv3", "https://files.digital.nhs.uk/30/82DB0C/iapt-quarterly-activity-data-files.zip", "https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-report-on-the-use-of-iapt-services/june-2021-final-including-reports-on-the-iapt-pilots-and-quarter-1-data-2021-22",
    #"9", "A&E", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/emergency-care-waiting-times", "Department of Health", 
    #"10", "Reattendance", "Northern Ireland", "2022-2021", "OGLv3", "https://www.health-ni.gov.uk/articles/emergency-care-and-ambulance-statistics", "Department of Health",
    #"11", "Cancer Waiting List", "Northern Ireland", "December 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/cancer-waiting-times", "Department of Health",
    #"12", "Outpatient Waiting Times", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/outpatient-waiting-times", "Department of Health",
    #"13", "Ipatient Waiting Times", "Northern Ireland", "March 2022", "OGLv3", "https://www.health-ni.gov.uk/articles/inpatient-waiting-times", "Department of Health",
    #"14", "A&E", "Scotland", "June 2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    #"15", "Bed Availability", "Scotland", "December 2021", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    #"16", "Cancer Waiting Times", "Scotland", "June 2021", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    #"17", "Delayed Transfer of Care", "Scotland", "April 2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    #"18", "Referral to Treatment Waiting Times", "Scotland", "March  2022", "Written permission received", "https://www.nhsperforms.scot/", "NHS Performs",
    #"19", "A&E", "Wales", "April 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Accident-and-Emergency", "StatsWales",
    #"20", "Bed Availabilty", "Wales", "June 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Activity/nhs-activity-and-capacity-during-the-coronavirus-pandemic/nhsbeds-by-date-localhealthboard", "StatsWales",
    #"21", "Ambulance Services", "Wales", "April 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Performance/Ambulance-Services", "StatsWales",
    #"22", "Cancer Waiting Times", "Wales", "March 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Cancer-Waiting-Times/Monthly/suspectedcancerpathwayclosedpathways-by-localhealthboard-tumoursite-agegroup-gender-measure-month", "StatsWales",
    #"23", "Referral to Treatment Waiting Times", "Wales", "March 2022", "OGLv3", "https://statswales.gov.wales/Catalogue/Health-and-Social-Care/NHS-Hospital-Waiting-Times/Referral-to-Treatment/patientpathwayswaitingtostarttreatment-by-month-groupedweeks-treatmentfunction", "StatsWales",
    

    # The links to the various queries can be found here = https://github.com/britishredcrosssociety/nhs-capacity/tree/main/preprocess
  )

#usethis::use_data(query_url, internal = TRUE, overwrite = TRUE)




#' Add together two numbers
#' 
#' @param query_url A data containing links.
#' @return A dataset.
#' @examples A data set that shows all the links

roxygen2::roxygenise()  




