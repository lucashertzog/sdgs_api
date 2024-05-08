do_tab_Australia <- function(
    indat
){
  
aus <- indat[GeoAreaName == "Australia"]


aus14 <- aus[, .(Indicator,
                 SeriesDescription,
                 TimePeriod,
                 Source)]

aus14[, NumericTimePeriod := as.numeric(TimePeriod)]

# Calculate min and max year for each SeriesDescription using TimePeriod
time_ranges <- aus14[, .(
  StartYear = min(NumericTimePeriod, na.rm = TRUE),
  EndYear = max(NumericTimePeriod, na.rm = TRUE)
), by = SeriesDescription]

# Create a time range string
time_ranges[, TimeRange := ifelse(StartYear == EndYear, as.character(StartYear), paste(StartYear, EndYear, sep = "-"))]

# Merge the new time range back to the main data.table
aus14 <- merge(aus14, time_ranges, by = "SeriesDescription", all.x = TRUE)

# Drop the temporary column
aus14[, NumericTimePeriod := NULL]
aus14[, StartYear := NULL]
aus14[, EndYear := NULL]
aus14[, TimePeriod := NULL]

unq <- unique(aus14, by = "SeriesDescription")

unq <- unq[, .(Indicator, SeriesDescription, TimeRange, Source)]

fwrite(unq, "data_derived/Australia_SDG_14.csv")
aus <- indat[GeoAreaName == "Australia"]


aus14 <- aus[, .(Indicator,
                 SeriesDescription,
                 TimePeriod,
                 Source)]

aus14[, NumericTimePeriod := as.numeric(TimePeriod)]

# Calculate min and max year for each SeriesDescription using TimePeriod
time_ranges <- aus14[, .(
  StartYear = min(NumericTimePeriod, na.rm = TRUE),
  EndYear = max(NumericTimePeriod, na.rm = TRUE)
), by = SeriesDescription]

# Create a time range string
time_ranges[, TimeRange := ifelse(StartYear == EndYear, as.character(StartYear), paste(StartYear, EndYear, sep = "-"))]

# Merge the new time range back to the main data.table
aus14 <- merge(aus14, time_ranges, by = "SeriesDescription", all.x = TRUE)

# Drop the temporary column
aus14[, NumericTimePeriod := NULL]
aus14[, StartYear := NULL]
aus14[, EndYear := NULL]
aus14[, TimePeriod := NULL]

unq <- unique(aus14, by = "SeriesDescription")

unq <- unq[, .(Indicator, SeriesDescription, TimeRange, Source)]

# fwrite(unq, "data_derived/Australia_SDG_14.csv")

return(unq)
}