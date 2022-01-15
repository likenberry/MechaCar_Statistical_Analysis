# MechaCar Statistical Analysis

## Overview of Project

The purpose of this project was an introduction to using R Studio and learning basic statistical analysis. AutosRUs is looking for more analysis into their production team to imporve their manufacturing using a new prototype called MachaCar. The data for this project was in the form of two CSV files and analyzed using R Studio. The challenge with any statistical analysis is determining the appropiate type of analysis based off of the data types and the questions that need to be answered. All of the following analyses will be using a significance value of 0.05. Some of the questions that need to be answered in this analysis include: looking at the variables that impact MPG, getting summary statistics on suspension coils, and determining the difference between manufacturing lots.

## Results

### Linear Regression to Predict MPG

When looking at factors that contribute to MPG (fuel efficency), the MechaCar_mpg.csv file was used and since all of the variables were continuous, a linear model could be used to predict MPG. The other five variables in the csv file were used to predict MPG and gave the following output:
![MPG Linear Model](/Users/leahikenberry/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/MPG_Linear_Model.png)
In order to determine if a linear model is a good fit for this data (R-Squared Value)and the statistical significance(P-Values), the summary() function was used to get the following output:
![MPG Linear Model Output](/Users/leahikenberry/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/MPG_LM_Output.png)
From this output, it is clear to see that some of the variable do have p-values below the significance value of 0.05. The variables of vehicle_length and ground_clearance both significantly contribute to MPG while the other three variables of vehicle_weight, spoiler_angle and AWD (all-wheel drive) have p-values greater than 0.05 and therefore do not significantly contribute to MPG. The R-Squard value for this model is a little over 71% and this indicates that this model is able to explain approximately 70% of the variability in this data which means this is a fairly good model. The closer the R-Squared value is to 1 the better the model and so this is a fairly good model. This model also has a p-value of 5.35e-11 which is a very very small number far below the significance level meaning that there is definitely evidence against the null hypothesis for this analysis.

### Summary Statistics on Suspension Coils

In order to understand more about the manufacturing process of suspension coils and if there were any differences in the manufacturing process that was causing differences in output, some basic summary statistics were gathered on the suspension_coil.csv file. The statistics returned included the mean, median, variance, and standard deviation from the PSI (pounds per square inch) column. Below shows the summary statistics output.
![PSI Summary Statistics](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/PSI_Summary.png)
This is the summary information for all of the suspension coils but this can be further broken down by individual manufacturing lots. Below shows the same summary statistics but broken down by lot number using the group_by() function on the PSI column.
![PSI Summary Statistics by Lot](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/Lot_Summary.png)
In accordance with the manufacturing standards for MechaCar, the variance for the coils should not exceed 100 pounds and overall the variance is 62.29 which is within range however looking at the individual lots there seems to be some differences. Lot1 and Lot2 have the same mean and median and have respectively low differences between the variance and standard deviation (SD). Lot3, however has a differen mean and median than Lot1 or Lot2 but a vastly different variance and SD indicating that something might have gone wrong or changed with the manufacturing process on Lot3. The change in the numbers with Lot3 can also indicate that there might be some outlier values in this lot that is skewing the data and contributing to a lot of the variance in this dataset. Further analysis will be needed to know if Lot3 is statistically different than the other lots.

### T-Tests on Suspension Coils

A t-test can be used to look at all variables in a population compared to the mean of the population and from the summary statistics on the entire suspension_coil.csv, it is clear that the mean and median are both 1500. A one-sample t-test was run on the entire suspension_coil dataset and gave the following output:
![T-Test Entire Dataset](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/Coil_DF.t.test.png)
The results of this t-test show that the p-value is slightly greater than the significance level and therefore this means that the data is not significanlty different than the population and this can be seen since the mean of the sample is only slightly off the mean of the population.
![Lot1 T-Test](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/Lot1_t.test.png)
This is the output for a t-test on Lot1 and the p-value is exactly 1 meaning that Lot1 is not significantly different than the population and there is a good representation of the population. This also supports the null hypothesis of no difference between the two groups.
![Lot2 T-Test](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/Lot2_t.test.png)
The results from the t-test on Lot2 has very similar results to the results of the t-test on Lot1. The p-value (0.6072) for Lot2 is a lot higher than the significance level and indicates that Lot2 is not statistically significantly different than the population and has almost the exact same mean. This again supports the null hypothesis.
![Lot3 T-Test](/Users/leahikenberry/Desktop/DU_DATA_Analytics/MechaCar_Statistical_Analysis/Resources/Lot3_t.test.png)
The results of the final t-test on Lot3 show a mean that is less than the mean of the population and a p-value (0.04168) which is belown the significance level indicating that this lot is statistically significantly different than the population. This is evidence against the null hypothesis and evidence supporting the alternate hypothesis that the mean of the sample is different than the mean of the population. This gives supports to the above observation that something different happened during the manufacturing process of Lot3 resulting in significantly different coils. However, this could be due to several coils improperly manufactured or every coil having the same defect. There is no way to be sure of this without more information.

### Study Design: MechaCar vs. Competition

AutoRUs wants to remain competitive with their new project MechaCar and against their competition. A good way to test if MechaCar will be competive against the competition is to design a test comparing common metrics. Some of the metrics that buyers care about when looking for a new car is the cost, safety rating, size of the car, the fuel effciency and maybe the fuel type.
One way to test if MechaCar is different than their competition is to look at the fuel efficiency based on fuel type. This could be analyzed using a 2-Way ANOVA comparing diesel, gas and electric cars between MechaCar and their competition. The null hypothesis for this analysis would be that there is no difference between fuel effciency and fuel type between MechaCar and their competition and the alternate hypothesis would be that at least one fuel type would statistically increase fuel effciency or there would be a difference between the fuel effciency of a fuel type between MechaCar and competition. The goal would be to prove that the fuel effciency of one fuel type for MechaCar is better than the competition. This could be a complicated analysis and involve more testing if there is a significant interaction value in the 2-Way ANOVA.

## Resources

- Data Source: MechaCar_mpg.csv, Suspension_Coil.csv
- Software: Visual Studio Code (1.63.2), R Studio (2021.09.1 Build 372)

## Citations

R Core Team (2021). R: A language and environment for
  statistical computing. R Foundation for Statistical
  Computing, Vienna, Austria. URL <https://www.R-project.org/>.

Hadley Wickham, Romain François, Lionel Henry and Kirill
  Müller (2021). dplyr: A Grammar of Data Manipulation. R
  package version 1.0.7.
  <https://CRAN.R-project.org/package=dplyr>
