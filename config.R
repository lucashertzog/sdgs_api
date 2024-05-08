# packages

if (!require(data.table)) {
  install.packages("data.table")
  library(data.table)
}

if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

if (!require(sf)) {
  install.packages("sf")
  library(sf)
}

if (!require(RColorBrewer)) {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}

if (!require(rnaturalearth)) {
  install.packages("rnaturalearth")
  library(rnaturalearth)
}

if (!require(rnaturalearthdata)) {
  install.packages("rnaturalearthdata")
  library(rnaturalearthdata)
}

## set folder names
folder_names <- c("data_derived", "data_provided", "figures_and_tables")

for (folder_name in folder_names) {
  if (!dir.exists(folder_name)) {
    dir.create(folder_name)
    cat("Folder", folder_name, "created.\n")
  } else {
    cat("Folder", folder_name, "already exists.\n")
  }
}

## source functions
file_list <- list.files(path = "R", pattern = "\\.R$", full.names = TRUE)

# Source each .R file
for (file in file_list) {
  source(file)
}

