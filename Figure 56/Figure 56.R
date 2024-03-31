library(tidyverse)

AALR_All <- read_csv("Figure 56_AALR.csv")

AALR_Long <- AALR_All %>% pivot_longer(cols = !BuildingOccupancy,
                        names_to = "Region",
                        values_to = "AALR")

ggplot(data = AALR_Long)+
  geom_col(mapping = aes(x = AALR,
                         y = BuildingOccupancy,
                         fill = Region),
           position = "dodge")+
  xlab("Average Annual Loss Ratio (%)")+
  ylab("")+
  theme_bw()+
  theme_minimal()+
  theme(legend.position = c(0.9,0.15), 
        legend.direction = "vertical",
        legend.title = element_blank(),
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(),
        )+
  guides(fill = guide_legend(reverse = TRUE))

ggsave("Figure 56 - AALR per building occupancy.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
