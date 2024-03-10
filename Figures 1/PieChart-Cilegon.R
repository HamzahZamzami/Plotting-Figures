library(tidyverse)
library(ggrepel)
library(scales)
library(egg)

#CILEGON
#piechart Cilegon
Tax_Cilegon <- read_csv("Taxonomy of Surveyed Public - Cilegon R2.csv")
Tax_Cilegon <- Tax_Cilegon %>%
  mutate(csum = cumsum(coalesce(Cilegon, 0)) + Cilegon*0)
#bar plot to visualize data
bp_Cilegon <- ggplot(Tax_Cilegon, aes(x = "", y = Cilegon, fill = Building_Taxonomy))+
  geom_col(position = 'stack', width = 1)+
  geom_text(data = subset(Tax_Cilegon, Persentase>3),
            aes(label = percent(Persentase/100), x = 1.3),
            position = position_stack(vjust = 0.5),
            size = 2)
bp_Cilegon
#create pie chart
pie_Cilegon <- bp_Cilegon + coord_polar(theta = "y")+
  xlab("")+
  ylab("")+
  labs(fill = "Building Taxonomy")+
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
#use brewer palette
pie2_Cilegon <- pie_Cilegon + scale_fill_brewer(palette = "Set2") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  ggtitle("Cilegon")+
  theme(axis.text.x = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5))
pie2_Cilegon
pie2_Bengkulu

#saving chart
ggsave("Figure1_PieChart_Cilegon.pdf", 
       plot = last_plot(),
       width = 7.5, 
       height = 5,
       units = "in")
