do_get_sdg_api <- function(
    output = "data_derived/sdg_3_1_2.csv"
){
  # (Client URL) command line tool that enables data exchange between a device 
  # and a server through a terminal
  curl <- paste0(
    'curl -X POST --header "Content-Type: application/x-www-form-urlencoded" ',
    '--header "Accept: application/octet-stream" ',
    '-d "seriesCodes=SH_STA_BRTC" ',
    '"https://unstats.un.org/SDGAPI/v1/sdg/Series/DataCSV" -o ', 
    output)
  
  # Execute cURL
  system(curl)
}