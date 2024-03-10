library(tidyverse)
library(ggrepel)
library(scales)
library(egg)

#BENGKULU
#piechart Bengkulu
Tax_Bengkulu <- read_csv("Taxonomy of Surveyed Public - Bengkulu R2.csv")
Tax_Bengkulu <- Tax_Bengkulu %>%
  mutate(csum = cumsum(coalesce(Bengkulu, 0)) + Bengkulu*0)
#bar plot to visualize data
bp_Bengkulu <- ggplot(Tax_Bengkulu, aes(x = "", y = Bengkulu, fill = Building_Taxonomy))+
  geom_col(position = 'stack', width = 1)+
  geom_text(data = subset(Tax_Bengkulu, Persentase>3),
            aes(label = percent(Persentase/100), x = 1.3),
            position = position_stack(vjust = 0.5),
            size = 2)
bp_Bengkulu
#create pie chart
pie_Bengkulu <- bp_Bengkulu + coord_polar(theta = "y")+
  xlab("")+
  ylab("")+
  labs(fill = "Building Taxonomy")+
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
#use brewer palette
pie2_Bengkulu <- pie_Bengkulu + scale_fill_brewer(palette = "Set2") + 
  theme(axis.text = element_blank()) +
  blank_theme +
  ggtitle("Bengkulu")+
  theme(axis.text.x = element_blank(),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5))
pie2_Bengkulu



