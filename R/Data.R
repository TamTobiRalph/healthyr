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

#' Bed Availability and Occupancy
#'
#' This data set contains the  number of available bed days & night. 
#' It gives the  number of occupied bed days by consultant main specialty.
#'
#' @format A tibble data frame with 212 rows and 22 variables:
#' \describe{
#'   \item{% trust_code}{Abbreviation for trust name}
#'   \item{% trust_name}{Trust Name}
#'   \item{% Total_Day_Beds_Occupied}{Beds occupied durring the day}
#'   \item{General_Acute_Day_Beds_Occupied}{Beds Occupied durring the day in General_Acute unit}
#'   \item{Learning Disabilities Day Beds Occupied}{Beds Occupied durring the day in Learning Disabilities unit}
#'   \item{Maternity Night day Occupied}{Beds Occupied durring the day in the Maternity unit}
#'   \item{Mental Illness Day Beds Occupied}{Beds Occupied durring the day in Mental Illness unit}
#'   \item{% Total Day Beds Occupied }{Total Beds Occupied durring the day }
#'   \item{% General_Acute_Day_Beds_Occupied}{Beds Occupied durring the day in General_Acute unit}
#'   \item{% Learning Disabilities Day Beds Occupied}{Beds Occupied durring the day in Learning Disabilities unit}
#'   \item{% Maternity day Occupied}{Beds Occupied durring the day in the Maternity unit}
#'   \item{% Mental Illness Day Beds Occupied}{Beds Occupied durring the day in Mental Illness unit}
#'   \item{% Total Night Beds Occupied}{Total Night Beds Occupied}
#'   \item{General Acute Night Beds Occupied}{Beds Occupied durring the night in General_Acute_unit}
#'   \item{Learning Disabilities Night Beds Occupied}{Beds Occupied durring the night in Learning Disabilities unit}
#'   \item{Maternity Night Beds Occupied}{Beds Occupied durring the night in the Maternity unit}
#'   \item{Mental Illness Night Beds Occupied}{Mental Illness Night Beds Occupied}
#'   \item{% Total Night Beds Occupied}{Total Night Beds Occupied}
#'   \item{% General Acute Night Beds Occupied}{Beds Occupied durring the night in General_Acute_unit}
#'   \item{% Learning Disabilities Night Beds Occupied}{Beds Occupied durring the night in Learning Disabilities unit}
#'   \item{% Maternity Night Beds Occupied}{Beds Occupied durring the night in the Maternity unit}
#'   \item{% Mental Illness Night Beds Occupied}{Beds Occupied durring the night in Mental Illness unit}
#'   
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/ambulance-quality-indicators/ambulance-quality-indicators-data-2022-23/}

"england_nhs_bed_occupancy"

#' Cancer Waiting Times
#'
#' This data set contains the waiting times of people referred by GP with suspected cancer or 
#' breast symptoms and those subsequently diagnosed with and treated for cancer by the NHS in England.
#'
#' @format A tibble data frame with 1400 rows and 6 variables:
#' \describe{
#'   \item{% trust_code}{Abbreviation for trust name}
#'   \item{% trust_name}{Trust Name}
#'   \item{Standard}{ST}
#'   \item{Total Treated}{Total number of patients treated}
#'   \item{Within Standard}{WS}
#'   \item{Breaches}{Breaches}
#'   ...
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/cancer-waiting-times/}

"england_nhs_cancer_wait_times"


#' Cancer Waiting Times
#'
#' This data set contains the waiting times of people referred by GP with suspected cancer or 
#' breast symptoms and those subsequently diagnosed with and treated for cancer by the NHS in England.
#'
#' @format A tibble data frame with 212 rows and 7 variables:
#' \describe{
#'   \item{% trust_code}{Abbreviation for trust name}
#'   \item{% trust_name}{Trust Name}
#'   \item{Waiting List Total}{Waiting list of patients}
#'   \item{Waiting 6+ weeks}{Waiting list of patients for 6 Weeks plus}
#'   \item{Waiting 13+ weeks}{Waiting list of patients for 6 Weeks plus}
#'   \item{% Waiting 6+ weeks}{Total number Waiting list of patients for 6 Weeks plus}
#'   \item{% Waiting 13+ weeks}{Total number Waiting list of patients for 13 Weeks plus}
#'   ...
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/diagnostics-waiting-times-and-activity/monthly-diagnostics-waiting-times-and-activity/monthly-diagnostics-data-2022-23/}

"england_nhs_diagnostic_wait_times"

 
#' Improving Access to Psychological Therapies (IAPT)
#'
#' This data set contains the referrals patients that have finished a course of treatment in the
#' month waiting 126 days or less for first treatment.
#' 
#' 
#' @format A tibble data frame with 42 rows and 2 variables:
#' \describe{
#'   \item{stp_code_short}{stp_code_short   }
#'   \item{Referrals that finished a course of treatment in the month waiting 126 days or less for first treatment}{Referrals that finished a course of treatment in the month waiting 126 days or less for first treatment}
#'   
#'   ....
#' 
#' }
#' @source \url{https://digital.nhs.uk/data-and-information/publications/statistical/psychological-therapies-report-on-the-use-of-iapt-services/june-2021-final-including-reports-on-the-iapt-pilots-and-quarter-1-data-2021-22}

"england_nhs_iapt"

#' Outpatient Referrals Data
#'
#' This data set contains data relating to GP and other referrals for first consultant-led 
#' outpatient appointments focusing on all treatment functions and specific acute treatment functions.
#'
#' @format A tibble data frame with 212 rows and 6 variables:
#' \describe{
#'   \item{Trust_code}{Abbreviation for trust name}
#'   \item{Trust_name}{Trust Name}
#'   \item{GP Referrals Made (All)}{The total number of refferals made in all units by the GP}
#'   \item{Other Referrals Made (All)}{The total number of refferals made in all units}
#'   \item{GP Referrals Made (Specific Acute)}{The number of refferals made in Specific Acute unit by the GP}
#'   \item{Other Referrals Made (Specific Acute)}{The number of refferals made in Specific Acute unit}
#'   ...
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/outpatient-referrals/mrr-data/}

"england_nhs_outpatient_referrals"

#' Consultant-led Referral to Treatment Waiting Times
#'
#' This data set contains contains information on Consultant-led Referral To Treatment (RTT) waiting times,
#' which monitor the length of time from referral through to elective treatment.
#' 
#' @format A tibble data frame with 824 rows and 8 variables:
#' \describe{
#'   \item{Trust_code}{Abbreviation for trust name}
#'   \item{Trust_name}{Trust Name}
#'   \item{Referral Treatment Type}{Waiting list of patients}
#'   \item{Waiting 52+ Weeks}{Waiting list of patients for 52+ Weeks plus}
#'   \item{Waiting 18+ weeks}{Waiting list of patients for 18+ Weeks plus}
#'   \item{Total waiting list}{Total number of patients on the Waiting list}
#'   \item{% Waiting 18+ weeks}{Percentage of the Waiting list of patients for 18+ Weeks plus}
#'   \item{% Waiting 52+ weeks}{Percentage of theWaiting list of patients for 52+ Weeks plus}
#'   ...
#' 
#' }
#' @source \url{https://www.england.nhs.uk/statistics/statistical-work-areas/rtt-waiting-times/rtt-data-2022-23/}

"england_nhs_referral_treatment_waiting_times"









