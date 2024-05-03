
if (!require(plotly)) {
  install.packages("plotly")
  library(plotly)
}

if (!require(data.table)) {
  install.packages("data.table")
  library(data.table)
}

folder_names <- c("data_derived", "data_provided")

for (folder_name in folder_names) {
  if (!dir.exists(folder_name)) {
    dir.create(folder_name)
    cat("Folder", folder_name, "created.\n")
  } else {
    cat("Folder", folder_name, "already exists.\n")
  }
}
