library(tidyverse)
library(ggrepel)
library(scales)
library(egg)

#Read Building Composition Cilegon
BC_Cilegon <- read_csv("Building Composition - Cilegon.csv")
#bar chart
bp_Cilegon <- ggplot(BC_Cilegon, aes(x = "", y = Cilegon, fill = BuildingCategory))+
  geom_col(position = 'stack', width = 1)+
  geom_text(aes(label = percent(Percentage), x = 1.3),
            position = position_stack(vjust = 0.5))
bp_Cilegon
#pie chart
pie_Cilegon <- bp_Cilegon + coord_polar(theta = "y") +
  labs(
       fill = "Building Category") +
  xlab("") +
  ylab("")+
  theme_bw()+
  theme_minimal()
pie_Cilegon
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
pie2_Cilegon <- pie_Cilegon + scale_fill_brewer(palette = "Blues") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  ggtitle("Cilegon")+
  theme(axis.text.x = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5))
pie2_Cilegon
#saving plot
ggsave("Figure2_CIlegon.pdf",
       plot = pie2_Cilegon,
       width = 7.5,
       height = 5,
       units = "in")
