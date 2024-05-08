do_clean <- function() {
  # options(scipen = 1000)
  # Load data
  indat <- fread(file.path("data_derived", "sdg_14.csv"))
  # mapping  <- fread(file.path("data_provided", "country-to-region-mapping.csv"))
  
  # Keep only the values that are either blank or 'A' under 'Observation Status', drop the rest
  indat <- indat[`[Observation Status]` == "" | `[Observation Status]` == "A"]
  
  # Replace '-' with '_' across all disaggregation values
  cols_to_replace <- grep("\\[.*\\]",
                          names(indat), 
                          value = TRUE)
  indat[, (cols_to_replace) := lapply(.SD, function(x) gsub("-", "_", x)), 
        .SDcols = cols_to_replace]
  return(indat)
}