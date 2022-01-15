# Loading libraries
library(dplyr)

# Analysis for Deliverable 1
## Loading the mpg data
cars_df <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

## Checking the linear model (lm) with all variables
lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = cars_df)

## Using summary function to determine significance
summary(lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = cars_df))

# Analysis for Deliverable 2
## Loading suspension data
coil_df <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

## Creating a dataframe with a  total summary using summarize function for PSI column
total_summary <- coil_df%>% summarize(Mean=mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

## Creating lot summary dataframe using groupby and summarize function for PSI column
lot_summary <- coil_df%>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups =  'keep')

# Analysis for Deliverable 3
## Using a t-test to determine PSI differences across manufacturing lots
t.test(coil_df$PSI, mu=1500)

## Testing differences in individual lots
### Lot 1
t.test(subset(coil_df, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)

### Lot 2
t.test(subset(coil_df, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)

### Lot 3
t.test(subset(coil_df, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

