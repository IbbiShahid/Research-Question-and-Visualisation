# Read the dataset
ncaa_forecasts <- read.csv("fivethirtyeight_ncaa_forecasts.csv")

# Filter data for East and South regions
filtered_data <- ncaa_forecasts[ncaa_forecasts$team_region %in% c("East", "South"), ]

# Create a boxplot
boxplot(
  team_rating ~ team_region,
  data = filtered_data,
  main = "Comparison of Team Ratings: East vs South Regions",
  xlab = "Region",
  ylab = "Team Rating",
  col = c("lightblue", "lightgreen"),
  border = "black"
)

