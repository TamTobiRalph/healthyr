#' A&E Attendances and Emergency Admissions 2022-23 (June 2021)
#'
#' A data set that contains Monthly A&E Attendances and Emergency Admissions collection collects the total 
#' number of attendances in the calendar month for all A&E types, including Minor Injury Units and Walk-in
#' Centres, and of these, the number discharged, admitted or transferred within four hours of arrival.
#'
#' @format A tibble data frame with 212 rows and 12 variables:
#' \describe{
#'   \item{trust_code}{Abbreviation for trust name}
#'   \item{trust_name}{Trust Name}
#'   \item{No_Type_1_Attendance}{Attendance at different units, eg minor injury center, walk-in centres etc}
#'   \item{No_Type_2_Attendance}{Attendance at different units, eg minor injury center, walk-in centres etc}
#'   \item{No_Type_3_Attendance}{Attendance at different units, eg minor injury center, walk-in centres etc}
#'   \item{No_Attendance_Total}{Total no of Attendance for all units}
#'   \item{%_Type_1_4_hours}{These are the number of patients discharged, admitted or transferred within 4 hours of arrival}
#'   \item{%_Type_2_4_hours}{These are the number of patients discharged, admitted or transferred within 4 hours of arrival}
#'   \item{%_Type_3_4_hours}{These are the number of patients discharged, admitted or transferred within 4 hours of arrival}        
#'   \item{%_Total_4 hours}{Total no of Attendance Within 4 Hours for all units}
#'   \item{No_patients_4h}{Patients admitted in admission within 4 hour limit}
#'   \item{No_patients_12h}{Patients admitted in admission within 4 hour limit}
#'   ...
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/ae-attendances-and-emergency-admissions-2022-23/}

"england_nhs_ae"

#' Ambulance Quality Indicators Data 2022-23
#'
#' This data set contains Ambulance System Indicators (AmbSYS)  the incident counts,
#' and their response time.
#'
#' @format A tibble data frame with 256 rows and 8 variables:
#' \describe{
#'   \item{trust_code}{Abbreviation for trust name}
#'   \item{trust_name}{Trust Name}
#'   \item{Ambulance Service}{Name of Amblunce service}
#'   \item{Incident Count}{The counts of incidence in each NHS Trust}
#'   \item{Total_Response_Time_h}{Total response time in hours}
#'   \item{Mean_Response_Time_min_sec}{Total response time in minutes and seconds}
#'   \item{90th_Centile_Response_Time_min_sec}{The 90% Total response time in minutes and seconds}
#'   \item{Category}{Category}
#'   
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/ambulance-quality-indicators/ambulance-quality-indicators-data-2022-23/}

"england_nhs_ambulance_quality_indicators"










