library(tidyverse)

YearCon <- read.csv("Year of Construction.csv")

YearCon_Long <- YearCon %>%
  pivot_longer(cols = !Row_Labels, 
               names_to = "Region", values_to = "Count")

ggplot(data = YearCon_Long)+
  geom_col(mapping = aes(x = Row_Labels,
                         y = Count, 
                         fill = Region),
           position = "dodge")+
  geom_text(aes(label = Count, x = Row_Labels, y = Count+5, group = Region),
            position = position_dodge(width = .9),
            size = 3)+
  theme_minimal()+
  theme(legend.position = "bottom", legend.title = element_blank(),
        legend.direction = "horizontal",
        panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+
  xlab(element_blank())+
  ylab("Number of Surveyed Public Building")

ggsave("Figure32_Estimated Construction Year of Surveyed Public Buildings.pdf",
       plot = last_plot(),
       width = 7.5,
       height = 5,
       units = "in")
