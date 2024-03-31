library(tidyverse)

URC_All <- read_csv("Figure 36-02.csv")

URC_Long <- URC %>% pivot_longer(cols = !BuildingOccupancy,
                                 names_to = "Region",
                                 values_to = "URC")

ggplot(data = URC_Long)+
  geom_col(mapping = aes(x = BuildingOccupancy,
                         y = URC,
                         fill = Region),
           position = "dodge")+
  xlab("")+
  labs(y = expression ("Unit Replacement Cost in "~USD/m^2))+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = "top", 
        legend.direction = "horizontal",
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  )

ggsave("Figure 36 - Unit Replacement Cost for Each Occupancy Class.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")

  