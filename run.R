source("config.R")

# 1 Use the function to download SDGs data
do_get_sdg_api()

# 2 Function to clean the data downloaded
do_clean()

# 3 Generate and interactive plot with the data cleaned
do_plot()


### Resources ####
# https://unstats.un.org/sdgapi/swagger/
# https://unstats.un.org/sdgs/indicators/SDG_Updateinfo.xlsx