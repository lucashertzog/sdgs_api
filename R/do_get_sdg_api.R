do_get_sdg_api <- function(
    output = "data_derived/sdg_14.csv"
){
  # (Client URL) command line tool that enables data exchange between a device 
  # and a server through a terminal
  curl <- paste0(
    'curl -X POST --header "Content-Type: application/x-www-form-urlencoded" ',
    '--header "Accept: application/octet-stream" ',
    '-d "goal=14" ',
    '"https://unstats.un.org/sdgapi/v1/sdg/Goal/DataCSV" -o', 
    output)
  
  # Execute cURL
  system(curl)
}



