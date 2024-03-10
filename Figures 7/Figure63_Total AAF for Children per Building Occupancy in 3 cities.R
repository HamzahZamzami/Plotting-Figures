library(tidyverse)

data <- read_csv("Total AAF Children.csv")

data_long <- 
  data %>% 
  pivot_longer(cols = !BuildingOccupancy,
               names_to = "Region", 
               values_to = "AAF")

ggplot(data = data_long) +
  geom_col(mapping = aes(x = AAF, 
                         y = BuildingOccupancy, 
                         fill = Region),
           position = "dodge") +
  ylab(element_blank()) +
  xlab("Average Annual Fatality (AAF) for Children per Building Occupancies")+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = c(0.9, 0.15), plot.title = element_text(hjust = 0.5),
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank())+
  guides(fill = guide_legend(reverse=TRUE))

ggsave("Figure63_Total AAF for Children per Building Occupancy in 3 cities_R2.pdf",
       plot = last_plot(),
       width = 10,
       height = 5,
       units = "in")
