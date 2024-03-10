library(tidyverse)
library(ggrepel)
library(scales)
library(egg)

#GORONTALO
#piechart Gorontalo
Tax_Gorontalo <- read_csv("Taxonomy of Surveyed Public - Gorontalo R2.csv")
Tax_Gorontalo <- Tax_Gorontalo %>%
  mutate(csum = cumsum(coalesce(Gorontalo, 0)) + Gorontalo*0)
#bar plot to visualize data
bp_Gorontalo <- ggplot(Tax_Gorontalo, aes(x = "", y = Gorontalo, fill = Building_Taxonomy))+
  geom_col(position = 'stack', width = 1)+
  geom_text(aes(label = percent(Persentase/100), x = 1.3),
            position = position_stack(vjust = 0.5),
            size = 2)
bp_Gorontalo
#create pie chart
pie_Gorontalo <- bp_Gorontalo + coord_polar(theta = "y")+
  xlab("")+
  ylab("")+
  labs(fill = "Building Taxonomy")+
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
#use brewer palette
pie2_Gorontalo <- pie_Gorontalo + scale_fill_brewer(palette = "Set2") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  ggtitle("Gorontalo")+
  theme(axis.text.x = element_blank(),
        legend.position = "right", legend.direction = "vertical",
        plot.title = element_text(hjust = 0.5))
pie2_Gorontalo
pie2_Bengkulu
pie2_Cilegon

#ggarrange
pie2_arranged <- ggarrange(plots = list(pie2_Bengkulu, pie2_Cilegon, pie2_Gorontalo),
          nrow = 1, ncol = 3)
pie2_arranged

#saving chart
ggsave("Figure1_PieChart_Gorontalo.pdf", 
       plot = last_plot(),
       width = 7.5, 
       height = 5,
       units = "in")

#saving chart ggarrange
ggsave("Figure 26 - Taxonomy of Surveyed Building.pdf", 
       plot = pie2_arranged,
       width = 7.5, 
       height = 5,
       units = "in")
