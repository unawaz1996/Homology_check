library(tidyverse)

setwd("~/Documents/Final_thesis/Analysis/Homology_with_Octopus/STAR_alignments/blast_alignments")

embryo_1b <- read_tsv("1B_frequent_hits.tsv", col_names = c("Frequency", "Name"))
embryo_4b <- read_tsv("4B_frequent_hits.tsv", col_names = c("Frequency", "Name"))
kidney_240 <- read_tsv("240_frequent_hits.tsv", col_names = c("Frequency", "Name"))
kidney_242 <- read_tsv("242_frequent_hits.tsv", col_names = c("Frequency", "Name"))


embryo_1b <- head(embryo_1b,20)
embryo_4b <- head(embryo_4b, 20)
kidney_240 <-head(kidney_240, 20)
kidney_242 <- head(kidney_242, 20)

embryo_1b$Name <- factor(embryo_1b$Name, levels = embryo_1b$Name[order(embryo_1b$Frequency)])
embryo_4b$Name <- factor(embryo_4b$Name, levels = embryo_4b$Name[order(embryo_4b$Frequency)])
kidney_240$Name <- factor(kidney_240$Name, levels = kidney_240$Name[order(kidney_240$Frequency)])
kidney_242$Name <- factor(kidney_242$Name, levels = kidney_242$Name[order(kidney_242$Frequency)])

library(ggplot2)

embryo_1b_plot <- ggplot() + geom_bar(aes( y= Frequency, x = Name),
                                      data = embryo_1b, stat = "identity", 
                                      width = 0.75, alpha=0.95) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab(NULL) +
  ylab("Number of Reads") +  ggtitle("Embryo 1B") + theme(plot.title = element_text(hjust = 0.5))
embryo_1b_plot


embryo_4B_plot <- ggplot() + geom_bar(aes( y= Frequency, x = Name), data = embryo_4b, stat = "identity", 
                                      width = 0.75, alpha=0.95) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab(NULL) +
  ylab("Number of Reads") +  ggtitle("Embryo 4B") + theme(plot.title = element_text(hjust = 0.5)) 
embryo_4B_plot

kidney_240_plot <- ggplot() + geom_bar(aes( y= Frequency,
                                            x = Name), 
                                       data = kidney_240, stat = "identity", 
                                       width = 0.75, alpha=0.95) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab(NULL) +
  ylab("Number of Reads") +  ggtitle("Kidney 240") + theme(plot.title = element_text(hjust = 0.5)) 
kidney_240_plot


kidney_242_plot <- ggplot() + geom_bar(aes( y= Frequency,
                                            x = Name), 
                                       data = kidney_242, stat = "identity", 
                                       width = 0.75, alpha=0.95) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab(NULL) +
  ylab("Number of Reads") +  ggtitle("Kidney 242") + theme(plot.title = element_text(hjust = 0.5))
kidney_242_plot

library(grid)
library(gridExtra)

grid.arrange(embryo_1b_plot, embryo_4B_plot, kidney_240_plot,kidney_242_plot,  ncol=2)
