library(tidyverse)
library(ggrepel)
library(scales)
library(egg)
library(patchwork)

#Read Building Composition Cilegon
BC_Bengkulu <- read_csv("Building Composition - Bengkulu.csv")
#bar chart
bp_Bengkulu <- ggplot(BC_Bengkulu, aes(x = "", y = Bengkulu, fill = BuildingCategory))+
  geom_col(position = 'stack', width = 1)+
  geom_text(aes(label = percent(Percentage), x = 1.3),
            position = position_stack(vjust = 0.5))
bp_Bengkulu
#pie chart
pie_Bengkulu <- bp_Bengkulu + coord_polar(theta = "y") +
  labs(
       fill = "Building Category") +
  xlab("") +
  ylab("")+
  theme_bw()+
  theme_minimal()
pie_Bengkulu
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
pie2_Bengkulu <- pie_Bengkulu + scale_fill_brewer(palette = "Blues") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  theme(axis.text.x = element_blank(), legend.position = "none")+
  ggtitle("Bengkulu")+
  theme(plot.title = element_text(hjust = 0.5))

pie2_Bengkulu
pie2_Cilegon
pie2_Gorontalo

#ggarrange
pie2_arranged <- ggarrange(plots = list(pie2_Bengkulu, pie2_Cilegon, pie2_Gorontalo),
          nrow = 1)
pie2_arranged

#saving plot
ggsave("Figure2_Bengkulu.pdf",
       plot = pie2_Bengkulu,
       width = 7.5,
       height = 5,
       units = "in")

#saving plot ggarrange
ggsave("Figure 30 - Number of Stories of Surveyed Public Buildings.pdf",
       plot = pie2_arranged,
       width = 7.5,
       height = 5,
       units = "in")
