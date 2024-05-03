do_clean <- function() {
  # Load data
  indat <- fread(file.path("data_derived", "sdg_14.csv"))
  mapping  <- fread(file.path("data_provided", "country-to-region-mapping.csv"))
  
  # Keep only the values that are either blank or 'A' under 'Observation Status', drop the rest
  indat <- indat[`[Observation Status]` == "" | `[Observation Status]` == "A"]
  
  # Replace '-' with '_' across all disaggregation values
  cols_to_replace <- grep("\\[.*\\]",
                          names(indat), 
                          value = TRUE)
  indat[, (cols_to_replace) := lapply(.SD, function(x) gsub("-", "_", x)), 
        .SDcols = cols_to_replace]
  
  # select SIDS
  setkey(indat, GeoAreaName)
  setkey(mapping, country_or_area)
  
  sids <- mapping[sids_region_code == 722]

  van <- indat[GeoAreaName == "Vanuatu"]
  # indat <- indat[mapping, UNFPA_region := i.unfpa_region_name]
  
  # Drop rows for non-UNFPA countries except for World and SDG regions
  indat <- indat[!(is.na(UNFPA_region) & !GeoAreaCode %in% mapping$`M49_Code`), ]
  
  # Create geoareanote column
  indat[, geoareanote := ifelse(
    GeoAreaCode %in% mapping$`M49_Code`, 
    "country",
    ifelse(GeoAreaCode %in% mapping$sdg_region_name, "sdg_region", "global"))]
  
  # Lowercase all the disaggregation columns and values within each of them
  indat[, (cols_to_replace) := lapply(.SD, tolower), .SDcols = cols_to_replace]
  
  # Round all values to two decimal places
  indat[, c("Value", "UpperBound", "LowerBound") := .(round(Value, 2), 
                                                      round(UpperBound, 2), 
                                                      round(LowerBound, 2))]
  # Check for duplicates
  duplicates <- indat[duplicated(indat)]
  if (nrow(duplicates) > 0) {
    indat <- indat[!duplicated(indat), ]
  }
  
  indicator_code = "SH_STA_BRTC"
  # Filter for the desired indicator
  data_filtered <- indat[SeriesCode == indicator_code]
  
  # Remove missing values for UNFPA_region
  data_filtered <- data_filtered[
    !is.na(UNFPA_region) & UNFPA_region != "non-UNFPA"]
  
  # Calculate average value per year for each region
  regional_avg <- data_filtered[, .(
    avg_value = round(mean(Value, na.rm = TRUE), 2)), 
    by = .(TimePeriod, UNFPA_region)]
  
  # Calculate global average per year
  global_avg <- data_filtered[, .(global_avg = round(mean(Value, na.rm = TRUE),2)), by = TimePeriod]
  
  # Merge the regional and global averages
  final_data <- merge(regional_avg, global_avg, by = "TimePeriod", all = TRUE)
  
  return(final_data)
}