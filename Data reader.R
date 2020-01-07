## Read excel files

library(readxl)
library(ggplot2)
library(shinydashboard)

HY_EN_11808_G10_00_NONE_IT10000390895_REPORT <- read_excel("HY-EN-11808_G10_00_NONE_IT10000390895_REPORT.xlsx", 
                                                           col_names = c("Sample","Torque","Time","Comment"), col_types = "numeric", skip = 23, n_max = 10)

Group <- c("G10","G10","G10","G10","G10","G10","G10","G10","G10","G10")
cbind(HY_EN_11808_G10_00_NONE_IT10000390895_REPORT, Group)

boxplot(Torque ~ Group, data=HY_EN_11808_G10_00_NONE_IT10000390895_REPORT, ylab = "Torque")

ggplot(HY_EN_11808_G10_00_NONE_IT10000390895_REPORT, aes(x=Sample, y=Torque)) + geom_point(col="blue", size=2)

## shinyApp(ui, server)