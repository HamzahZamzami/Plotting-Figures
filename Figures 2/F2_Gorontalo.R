library(tidyverse)
library(ggrepel)
library(scales)
library(egg)

#Read Building Composition Cilegon
BC_Gorontalo <- read_csv("Building Composition - Gorontalo.csv")
#bar chart
bp_Gorontalo <- ggplot(BC_Gorontalo, aes(x = "", y = Gorontalo, fill = BuildingCategory))+
  geom_col(position = 'stack', width = 1)+
  geom_text(aes(label = percent(Percentage), x = 1.3),
            position = position_stack(vjust = 0.5))
bp_Gorontalo
#pie chart
pie_Gorontalo <- bp_Gorontalo + coord_polar(theta = "y") +
  labs(
       fill = "Building Category") +
  xlab("") +
  ylab("")+
  theme_bw()+
  theme_minimal()
pie_Gorontalo
#create blank theme
blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )
#palette
pie2_Gorontalo <- pie_Gorontalo + scale_fill_brewer(palette = "Blues") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  ggtitle("Gorontalo")+
  theme(axis.text.x = element_blank(),
        legend.position = "right", legend.direction = "vertical",
        plot.title = element_text(hjust = 0.5))
pie2_Gorontalo
#saving plot
ggsave("Figure2_Gorontalo.pdf",
       plot = pie2_Cilegon,
       width = 15,
       height = 10,
       units = "in")
