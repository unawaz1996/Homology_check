#!/usr/bin/env Rscript
# making plots for STAR alignments 

library(ggplot2)
library(RColorBrewer)
require(scales)


#plotting figures
my_samples <- c('Embryo 1B', 'Embryo 1B', 'Embryo 1B', 'Embryo 1B', 'Embryo 4B', 'Embryo 4B', 'Embryo 4B', 'Embryo 4B', 
                'Kidney 240', 'Kidney 240', 'Kidney 240', 'Kidney 240', 'Kidney 242', 'Kidney 242', 'Kidney 242', 'Kidney 242')
my_samples <- factor(my_samples)
my_samples <- factor(my_samples,levels(my_samples)[c(length(levels(my_samples)):1)]) 


#default parameters 
my_percentage_STAR_default <- c(0.95, 0.14, 0.0, 98.91, 40.9, 58.7, 0.0, 0.4, 33.0, 66.7, 0.3, -0.0, 49.8, 49.5, 0.3, 0.4)
my_values_STAR_default <- c(449762, 67360, 16, 46808243,
                    315870, 36912, 19, 50317315,
                    88390, 12365, 18,  51830643, 
                    101917, 13774, 10,  50607774) 

labsize = 1
if (length(levels(my_samples)) > 10){
  labsize = 0.66
}
Category <- c(rep(c("Uniquely mapped","Mapped to mutliple loci","Mapped to too many loci","Unmapped: too short"),c(1)))
Category <-factor(Category)
Category = factor(Category,levels(Category)[c(4,1,2,3)])

options(scipen=999)
point <- format_format(big.mark = ",", decimal.mark = ",", scientific = FALSE)
df_default = data.frame(my_samples, my_values_STAR_default, Category)
default_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_default, x = my_samples, fill = Category), data = df_default, stat = "identity", width = 0.65, alpha=0.95) +
  scale_x_discrete(limits = rev(levels(my_samples))) +  theme_gray(base_size = 2) + theme_bw() + ylab("Number of Reads") + xlab(NULL) +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + theme_classic() +
  theme(text = element_text(size=25)) + theme(legend.title =element_blank()) +  theme(legend.title =element_blank()) + scale_y_continuous(labels = point)

png(filename=("~/Documents/Final_thesis/Analysis/Homology_with_Octopus/STAR_alignments/plots/default_parameters.png"))
default_bargraph
dev.off()













# Score and Match is 0.10


#my_percentage_STAR_alignment1 <- c()
my_percentage_STAR_alignment1 <- c(63.27, 32.66, 0.20, 3.87)
my_values_STAR_alignment1 <- c(29942230, 15455754, 96760, 1830637, 
                              32185017, 16669579, 101871, 1713649,
                              30641429, 18533543, 95531, 2660321, 
                              30244729, 17930929, 92905, 245912)
  
df_alignment1 <- data.frame(my_samples, my_values_STAR_alignment1, Category)

alignment1_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment1, x = my_samples, fill = Category), data = df_alignment1, stat = "identity", width = 0.65, alpha=0.95) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +  theme(legend.title =element_blank()) + 
  scale_fill_manual(values = brewer.pal(4, "Paired")) + theme(text = element_text(size=25))
alignment1_bargraph


#score and match is 0.25
my_percentage_STAR_alignment3
my_values_STAR_alignment3 <- c()

df_alignment3 <- data.frame(my_samples, my_values_STAR_alignment3, mycategory)


#score and match is 0.5
my_percentage_STAR_alignment2 <- c(2.4, 0.4, 0.0, 97.2, 
                                   1.8, 0.3, 0.0, 97.9, 
                                   0.5, 0.1, 0.0, 99.4, 
                                   0.6, 0.1, 0.0, 99.3)
my_values_STAR_alignment2 <- c(1129146, 193270, 80, 46002885, 
                               914466, 146950, 142, 49608558,
                              273591, 46093, 53, 51611085,
                              294797, 46089, 120, 50382469)

df_alignment2 <- data.frame(my_samples, my_values_STAR_alignment2, Category)
alignment2_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment2, x = my_samples, fill = Category), data = df_alignment2, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + 
  theme(text = element_text(size=25))
alignment2_bargraph


# match is 0.25 and score is .10
#changed parameters4 

my_percentage_STAR_alignment4 <- c(18.2, 2.4, 0.0, 79.4,
                                   17.3, 2.4, 0.0, 80.3, 
                                   8.1, 1.2, 0.0, 90.6,
                                   8.4, 1.7, 0.0, 90.4)
my_values_STAR_alignment4 <- c(8623038, 1140561, 3646, 37558136, 
                               8778598, 1215151, 5143, 40671224, 
                               4231397, 622342, 3025, 47074058, 
                               4261212, 579564, 3373, 45879326)
df_alignment4 <- data.frame(my_samples, my_values_STAR_alignment4, Category)

alignment_4_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment4, x = my_samples, fill = Category), data = df_alignment4, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) +
  theme(text = element_text(size=25))

alignment_4_bargraph

# match is .50 and score is .10
#changedparameters5
my_percentage_STAR_alignment5 <- c(3.2, 0.6, 0.0, 96.2, 
                                   2.6, 0.5, 0.0, 97.0, 
                                   0.7, 0.1, 0, 99.1, 
                                   0.8, 0.1, 0.0, 99.0)
my_values_STAR_alignment5 <- c(1531339, 265319, 128, 45528595, 
                               1305261, 231640, 178, 49133037, 
                               380219, 67197, 78, 51483330, 
                               414034, 68097, 135, 50241209)

df_alignment5 <- data.frame(my_samples, my_values_STAR_alignment5, Category)
alignment_5_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment5, x = my_samples, fill = Category), data = df_alignment5, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + 
  theme(text = element_text(size=25))

alignment_5_bargraph
#match is .10 and score is 0.25
#changedparameters6
my_percentage_STAR_alignment6 <- c(12.0, 1.7, 0.0, 86.2, 
                                   11.0, 1.7, 0.0, 87.4, 
                                   3.6, 0.7, 0.0, 95.7, 
                                   3.8, 0.7, 0.0, 95.7)
my_values_STAR_alignment6 <- c(5695606, 821291, 2608, 40805876, 
                               5560953, 839017, 3759, 44266387, 
                               1887254, 343676, 1719, 49698275, 
                               1905174, 322026, 1762, 48494510)

df_alignment6 <- data.frame(my_samples, my_values_STAR_alignment6, Category)
alignment_6_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment6, x = my_samples, fill = Category), data = df_alignment6, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + 
  theme(text = element_text(size=25))
alignment_6_bargraph

#match is .50 and score is .25
#changedparameters7

my_percentage_STAR_alignment7 <- c(3.2, 0.6, 0.0, 96.2, 
                                   2.6, 0.5, 0.0, 97.0, 
                                   0.7, 0.1, 0.0, 99.1, 
                                   0.7, 0.1, 0.0, 99.1, 
                                   0.8, 0.1, 0.0, 99.0)
my_values_STAR_alignment7 <- c(1531339, 265319, 128, 45528595, 
                               1305261, 231640, 178, 49133037, 
                               380219, 67197, 78, 51483330, 
                               414034, 68097, 135, 50241209)

df_alignment7 <- data.frame(my_samples, my_values_STAR_alignment7, Category)
alignment_7_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment7, x = my_samples, fill = Category), data = df_alignment7, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + 
  theme(text = element_text(size=25))
alignment_7_bargraph

#match is .10 and score is 0.50
#changed parameters are 8

my_percentage_STAR_alignment8 <- c(2.4, 0.4, 0.0, 97.2, 
                                   1.8, 0.3, 0.0, 97.9, 
                                   0.5, 0.1, 0.0, 99.4, 
                                   0.6, 0.1, 0.0, 99.3)
my_values_STAR_alignment8 <-c(129146, 193270, 80, 46002885, 
                              914466, 149950, 142, 49608588, 
                              273591, 46093, 55, 51611085, 
                              294797, 46089, 120, 50381469)

df_alignment8 <- data.frame(my_samples, my_values_STAR_alignment8, Category)
alignment_8_bargraph <- ggplot() + geom_bar(aes( y= my_values_STAR_alignment8, x = my_samples, fill = Category), data = df_alignment8, stat = "identity", width = 0.65) +
  scale_x_discrete(limits = rev(levels(my_samples)))  + ylab("Number of Reads") + xlab(NULL) + theme_bw() +
  theme(legend.title =element_blank()) + scale_fill_manual(values = brewer.pal(4, "Paired")) + 
  theme(text = element_text(size=25))

alignment_8_bargraph

#match is 0.25 and score is .50
#changedparameters9

my_percentage_STAR_alignment8 <- c()
my_values_STAR_alignment8 <-c(1129146, )
