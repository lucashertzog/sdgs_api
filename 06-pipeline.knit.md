---
editor_options: 
  markdown: 
    wrap: 72
---

# The pipeline

-   RStudio Environment. Let's rearrange the panel layout:

![Tools\>Global Options...](images/img_panel00.png)

![Pane Layout](images/img_panel01.png)

## Essential data management and folder structure

``` sh
├── config.R
├── data_derived
│   ├── Australia_SDG_14.csv
│   ├── sdg_14.csv
│   ├── sdg_14_unclos_map.csv
│   └── sdg_3_1_2.csv
├── data_provided
│   ├── country-to-region-mapping.csv
│   ├── Ocean Accounts Diagnostic Tool_formatted.pdf
│   ├── SDG-DSD-Guidelines.pdf
│   ├── SDG.xlsx
│   └── SDG_Updateinfo.xlsx
├── DatSciTrain_SDGs_API_R.Rproj
├── figures_and_tables
│   ├── fig2.png
│   └── sdg14_Australia.docx
├── LICENSE
├── R
│   ├── do_clean.R
│   ├── do_get_sdg_api.R
│   ├── do_map.R
│   ├── do_plot.R
│   └── do_tab_Australia.R
├── README.md
└── run.R
```

## config.R


```r
# packages

if (!require(data.table)) {
  install.packages("data.table")
  library(data.table)
}
```

```
## Loading required package: data.table
```

```r
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}
```

```
## Loading required package: ggplot2
```

```
## Warning: package 'ggplot2' was built under R version 4.2.3
```

```r
if (!require(sf)) {
  install.packages("sf")
  library(sf)
}
```

```
## Loading required package: sf
```

```
## Linking to GEOS 3.9.3, GDAL 3.5.2, PROJ 8.2.1; sf_use_s2() is TRUE
```

```r
if (!require(RColorBrewer)) {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}
```

```
## Loading required package: RColorBrewer
```

```r
if (!require(rnaturalearth)) {
  install.packages("rnaturalearth")
  library(rnaturalearth)
}
```

```
## Loading required package: rnaturalearth
```

```
## Warning: package 'rnaturalearth' was built under R version 4.2.3
```

```r
if (!require(rnaturalearthdata)) {
  install.packages("rnaturalearthdata")
  library(rnaturalearthdata)
}
```

```
## Loading required package: rnaturalearthdata
```

```
## Warning: package 'rnaturalearthdata' was built under R version 4.2.3
```

```
## 
## Attaching package: 'rnaturalearthdata'
```

```
## The following object is masked from 'package:rnaturalearth':
## 
##     countries110
```

```r
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
```

```
## Folder data_derived already exists.
## Folder data_provided already exists.
## Folder figures_and_tables already exists.
```

```r
## source functions
file_list <- list.files(path = "R", pattern = "\\.R$", full.names = TRUE)

# Source each .R file
for (file in file_list) {
  source(file)
}
```

## run.R












