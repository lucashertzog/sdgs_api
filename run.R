source("config.R")

### 1. Download ####
# Use the function to download SDGs data
do_get_sdg_api()

### 2. Data cleaning ####
# Function to clean the data downloaded
do_clean()

### 3. Visualise ####
# Generate and interactive plot with the data cleaned
do_plot()


### Resources ####
# https://unstats.un.org/sdgapi/swagger/
# https://unstats.un.org/sdgapi/swagger/#!/Series/V1SdgSeriesDataCSVPost

# https://unstats.un.org/sdgs/UNSDGAPIV5/swagger/index.html

# https://unstats.un.org/sdgs/indicators/SDG_Updateinfo.xlsx

# https://registry.sdmx.org/data/datastructure.html 
# IAG-SDGs

# [Observation status]
# A	Normal value
# B	Time series break
# D	Definition differs
# E	Estimated value
# F	Forecast value
# G	Experimental value
# H	Missing value; holiday or weekend
# I	Imputed value (CCSA definition)
# J	Derogation
# K	Data included in another category
# L	Missing value; data exist but were not collected
# M	Missing value; data cannot exist
# N	Not significant
# O	Missing value
# P	Provisional value
# Q	Missing value; suppressed
# S	Strike and other special events
# U	Low reliability
# V	Unvalidated value
# W	Includes data from another category