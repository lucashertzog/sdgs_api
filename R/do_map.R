do_map <- function()
{


foo <- indat[SeriesCode == "ER_UNCLOS_RATACC" | SeriesCode == "ER_UNCLOS_IMPLE"]

foo1 <- foo[SeriesCode == "ER_UNCLOS_RATACC", .SD[which.max(as.numeric(TimePeriod))], by = GeoAreaName]

foo2<- foo[SeriesCode == "ER_UNCLOS_IMPLE", .SD[which.max(as.numeric(TimePeriod))], by = GeoAreaName] 

world <- ne_countries(scale = "medium", returnclass = "sf")

setnames(foo1, "GeoAreaName", "name")
setnames(foo2, "GeoAreaName", "name")

# foo2_names <- unique(foo2$name)
# foo1_names <- unique(foo1$name)
# world_names <- unique(world$name)
# names_diff_foo2_world <- setdiff(foo2_names, world_names)
# names_diff_foo1_world <- setdiff(foo1_names, world_names)
# 
# print("Names in foo2 not in world:")
# print(names_diff_foo2_world)
# print(names_diff_foo1_world)

foo2[name == "Republic of Korea", name := "South Korea"]
foo2[name == "United Kingdom of Great Britain and Northern Ireland", name := "United Kingdom"]
foo2[name == "Russian Federation", name := "Russia"]
foo2[name == "Venezuela (Bolivarian Republic of)", name := "Venezuela"]

foo1[name == "Republic of Korea", name := "South Korea"]
foo1[name == "United Kingdom of Great Britain and Northern Ireland", name := "United Kingdom"]
foo1[name == "Russian Federation", name := "Russia"]
foo1[name == "Venezuela (Bolivarian Republic of)", name := "Venezuela"]

foo2_imple <- foo2[SeriesCode == "ER_UNCLOS_IMPLE"]
foo1_rat <- foo1[SeriesCode == "ER_UNCLOS_RATACC"]

foo3 <- rbind(foo2_imple, foo1_rat)

foo3_map <- merge(world, foo3, by = "name", all.x = TRUE, fill = TRUE)

setDT(foo3_map)

# Replace NaN and NA in 'Value' with NA for uniform handling
foo3_map[, Value := fifelse(is.nan(Value) | is.na(Value), as.numeric(NA), Value)]

foo3_map[, ValueFactor := cut(Value, breaks = c(0, 50, 69, 79, 89, 100),
                              include.lowest = TRUE, right = TRUE,
                              labels = c("0-50%", "51-69%", "70-79%", "80-89%", "90-100%"))]

foo3_map <- st_as_sf(foo3_map)

equal_earth_projection <- st_crs("+proj=eqearth +datum=WGS84")

p <- ggplot(data = foo3_map) +
  geom_sf(aes(geometry = geometry, fill = ValueFactor), color = "white", size = 0.2) +
  scale_fill_brewer(palette = "YlGnBu", name = "", na.value = "grey") +
  coord_sf(crs = equal_earth_projection, datum = NA) +  # Apply Equal Earth projection
  theme(
    panel.background = element_rect(fill = "white"),
    legend.position = "top"
  )

ggsave("figures_and_tables/fig2.png", plot = p, width = 10, height = 6, dpi = 300, units = "in")

}