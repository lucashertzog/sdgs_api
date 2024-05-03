do_plot <- function(){
plot <- final_data %>%
  plot_ly(x = ~TimePeriod) %>%
  add_trace(y = ~avg_value, color = ~UNFPA_region, ids = ~UNFPA_region, 
            type = 'scatter', mode = 'lines', name = ~UNFPA_region) %>%
  add_trace(y = ~global_avg, color = I("black"), name = "Global", 
            type = 'scatter', mode = 'lines+markers') %>%
  layout(title = paste0("Average proportion of births attended by skilled health personnel (SDG 3.1.2)"),
         xaxis = list(title = "Year"),
         yaxis = list(title = "Average Percentage"),
         showlegend = TRUE)

return(plot)
}