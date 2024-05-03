# packages

if (!require(plotly)) {
  install.packages("plotly")
  library(plotly)
}

if (!require(data.table)) {
  install.packages("data.table")
  library(data.table)
}

## set folder names
folder_names <- c("data_derived", "data_provided")

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

