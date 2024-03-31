library(tidyverse)

AAFR_Children <- read_csv("Figure 69 - AAFR Children.csv")

AAFR_Children_Long <- AAFR_Children %>% pivot_longer(cols = !BuildingOccupancy,
                                                     names_to = "Region",
                                                     values_to = "AAFR")
ggplot(data = AAFR_Children_Long)+
  geom_col(mapping = aes(x = AAFR,
                         y = BuildingOccupancy,
                         fill = Region),
           position = "dodge")+
  xlab("Average Annual Fatality Ratio for Children (%)")+
  ylab("")+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = c(0.9,0.15), 
        legend.direction = "vertical",
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(),
  )+
  guides(fill = guide_legend(reverse = TRUE))

ggsave("Figure 69 - AAFR for Children per building occupancy.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
