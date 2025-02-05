# Load required packages
library(ggplot2)
library(ggridges)
library(dplyr)

# Load data from CSV
data <- read.csv("C:/Users/TKOSGEI/OneDrive - CIMMYT/Manuscripts/PD/TEMP/GYF-PD.csv")

# Check the structure of the data
str(data)

# Replace 'value_column' and 'group_column' with the actual column names in your CSV
value_column <- "GYF"  # Change this to your numerical column name
group_column <- "LOC.PD"    # Change this to your categorical column name

# Calculate mean of the numeric column
mean_value <- mean(data[[value_column]], na.rm = TRUE)
print(paste("Mean of", value_column, ":", mean_value))

# Plot ridgeline density curves
ridgeline <- ggplot(data, aes(x = .data[[value_column]], y = .data[[group_column]], fill = .data[[group_column]])) +
  geom_density_ridges(scale = 2, alpha = 0.7) +
  scale_fill_brewer(palette = "Set3") +  # Change color palette as needed
  theme_minimal() +
  labs(title = "GYF Ridgeline Plot",
       x = "Grain yield (t/ha)",
       y = "",
       fill = "Group") +
  theme(legend.position = "right")

jpeg("C:/Users/TKOSGEI/OneDrive - CIMMYT/Manuscripts/PD/TEMP/ridgeline_GY.jpg", width = 2000, height = 2000, res = 300)
ridgeline
dev.off()
