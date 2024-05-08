# Australia + world (mean)    
# plot time series
# [5] "Sustainable fisheries as a proportion of GDP"  


do_plot <- function(){

 
  ggplot(sdg1471, aes(x = TimePeriod, y = Value, group = GeoAreaName, color = GeoAreaName)) +
    geom_line(size=1) +  
    labs(title = "Sustainable fisheries as a proportion of GDP",
         x = "Year",
         y = "(%)",
         color = "Country") +
    theme(
      panel.background = element_rect(fill = "white"),
      panel.grid.major.y = element_line(color = "#A8BAC4", size = 0.3),
      axis.ticks.length = unit(0, "mm"),
      axis.title = element_blank(),
      axis.line.x = element_line(color = "#202020"),
      axis.text.x = element_text(family = "Econ Sans Cnd", size = 14),
      axis.text.y = element_text(family = "Econ Sans Cnd", size = 14, vjust = -0.5),
      legend.position = "right",
      legend.direction = "vertical",
      legend.title = element_blank(),
      legend.text = element_text(family = "Econ Sans Cnd"),
      plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "cm")
    )
return(plot)
}