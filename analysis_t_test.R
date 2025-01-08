# Read the dataset
ncaa_forecasts <- read.csv("fivethirtyeight_ncaa_forecasts.csv")

# Filter data for East and South regions
filtered_data <- ncaa_forecasts[ncaa_forecasts$team_region %in% c("East", "South"), ]

# Conduct an independent samples t-test
t_test_result <- t.test(team_rating ~ team_region, data = filtered_data, var.equal = TRUE)

# Print the t-test results
print(t_test_result)
