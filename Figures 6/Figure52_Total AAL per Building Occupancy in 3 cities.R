library(tidyverse)

data <- read_csv("Total AAL2.csv")

data_long <- 
  data %>%
  pivot_longer(cols = !BuildingOccupancy,
               names_to = "Region",
               values_to = "AAL")

ggplot(data = data_long) +
  geom_col(mapping = aes(x = AAL, 
                         y = BuildingOccupancy, 
                         fill = Region),
           position = "dodge")+
  theme_bw()+
  theme_minimal()+
  xlab("Average Annual Loss per BUilding Occupancy (USD)")+
  ylab("")+
  theme(legend.position = c(0.9,0.15), legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank())+
  guides(fill = guide_legend(reverse=TRUE))

ggsave("Figure52_Total AAL per Building Occupancy in 3 cities_R2.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
