library(tidyverse)

AAFR_Female <- read_csv("Figure 68 - AAFR Female.csv")

AAFR_Female_Long <- AAFR_Female %>% pivot_longer(cols = !BuildingOccupancy,
                                                 names_to = "Region",
                                                 values_to = "AAFR")

ggplot(data = AAFR_Female_Long)+
  geom_col(mapping = aes(x = AAFR,
                         y = BuildingOccupancy,
                         fill = Region),
           position = "dodge")+
  xlab("Average Annual Fatality Ratio for Women (%)")+
  ylab("")+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = c(0.9,0.15), 
        legend.direction = "vertical",
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(),
  )+
  guides(fill = guide_legend(reverse = TRUE))

ggsave("Figure 68 - AAFR for Women per building occupancy.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
