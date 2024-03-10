library(tidyverse)

AAFR_All <- read_csv("AAFR per Building.csv")

AAFR_Long <- 
  AAFR_All %>%
  pivot_longer(cols = !BuildingOccupancy,
               names_to = "Region",
               values_to = "AAFR")

ggplot(data = AAFR_Long) +
  geom_col(mapping = aes(x = AAFR,
                         y = BuildingOccupancy,
                         fill = Region),
           position = "dodge") +
  xlab("Average Annual Fatality Ratio (%)") +
  ylab("")+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = c(0.9,0.15), legend.direction = "vertical",
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank())+
  guides(fill = guide_legend(reverse=TRUE))
  
ggsave("Figure64_AAFR per Building Occupancies_R2.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
