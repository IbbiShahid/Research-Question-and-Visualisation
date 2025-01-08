# Read the dataset
ncaa_forecasts <- read.csv("fivethirtyeight_ncaa_forecasts.csv")

# Filter data for East and South regions
filtered_data <- ncaa_forecasts[ncaa_forecasts$team_region %in% c("East", "South"), ]

# Calculate summary statistics (mean and standard error for each region)
summary_data <- aggregate(team_rating ~ team_region, data = filtered_data, function(x) {
  c(mean = mean(x), se = sd(x) / sqrt(length(x)))  # Mean and standard error
})

# Extract mean and standard error
means <- summary_data$team_rating[, "mean"]
se <- summary_data$team_rating[, "se"]
regions <- summary_data$team_region

# Save the plot as a PNG
png("mean_team_ratings_with_error_bars.png", width = 800, height = 600)

# Create the bar plot
barplot(
  means,
  beside = TRUE,
  names.arg = regions,
  col = c("lightblue", "lightgreen"),
  ylim = c(0, max(means + se) + 5),
  main = "Mean Team Ratings with Standard Error",
  xlab = "Region",
  ylab = "Mean Team Rating"
)

# Add error bars
arrows(
  x0 = 1:length(means),
  y0 = means - se,
  x1 = 1:length(means),
  y1 = means + se,
  angle = 90,
  code = 3,
  length = 0.1,
  col = "black"
)

# Close the PNG device
dev.off()
