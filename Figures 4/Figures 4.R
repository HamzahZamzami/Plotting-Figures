library(tidyverse)

Prop_Gender <- read_csv("Proportion of the Building Occupants by Gender.csv")

Prop_Gender_Long <- 
  Prop_Gender %>%
  pivot_longer(cols = !BuildingCategory, 
               names_to = "Gender",
               values_to = "Percentage")

Prop_Gender_Long <-  Prop_Gender_Long %>%
  mutate(Persen = Percentage * 100)

ggplot(data = Prop_Gender_Long)+
  geom_col(mapping = aes(x = BuildingCategory,
                         y = Persen, 
                         fill = Gender), 
           position = "dodge")+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        legend.position = c(0.9,0.9), legend.direction = "horizontal",
        legend.title = element_blank(),
        panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank())+
  xlab("") +
  ylab("Percentage (%)")+
  coord_cartesian(ylim = c(0,100))
  

ggsave("Figure41_Gender Ratio for Building Occupancy Classes.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
