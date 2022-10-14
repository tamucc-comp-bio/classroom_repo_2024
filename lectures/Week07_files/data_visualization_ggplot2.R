# Intro to ggplot2
# Computing Skills for Biologists Ch 9.6 - end

# It is assumed that this script has been saved to `CSB/data_wrangling/sandbox`

# You can collapse the code sections with alt-o
# You can expand the sections by clicking on triangles next to section headings

#### INITIALIZE ####
rm(list=ls())
getwd()
#set working directory to location of this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# if this does not return a dir that ends with `CSB/data_wrangling/sandbox` then save this script to your data_wrangling text box and re run the previous lines of code
getwd()

# This file contains all commands of the Chapter 9, "Data Wrangling and Visualization"

# load the library
library(tidyverse)


#### USER DEFINED VARIABLES / READ IN DATA ####

# read the data
popsize <- read_tsv("../data/FauchaldEtAl2017/pop_size.csv")
ndvi <- read_tsv("../data/FauchaldEtAl2017/ndvi.csv")
seaice <- read_tsv("../data/FauchaldEtAl2017/sea_ice.csv")
snow <- read_tsv("../data/FauchaldEtAl2017/snow.csv")

#### READ IN DATA ####

# bring data into long format
#look at seaice before and after running the next line
seaice

seaice <- 
  seaice %>% 
  pivot_longer(cols = Jan:Dec,
               names_to = "Month",
               values_to = "Cover")
seaice

#### Making a Plot ####
# build the first plot
ggplot(data = popsize)

# I like piping the data better, same result as last line
popsize %>%
  ggplot()

# add an aestethic mapping
popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size, 
      color = Herd)

# add geometries
popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size, 
      color = Herd) + 
  geom_point() + 
  geom_line()

#### plot frequency distribution (histogram) ####
ndvi %>%
  ggplot() + 
  aes(x = NDVI_May) + 
  geom_histogram()

#### "unrolled" vs nested code ####
# These three commands also produce the same plot:
ndvi %>%
  ggplot(aes(x = NDVI_May)) + 
  geom_histogram()

ggplot(data = ndvi, aes(x = NDVI_May)) + 
  geom_histogram()

ggplot(data = ndvi) + 
  geom_histogram(aes(x = NDVI_May))

#### density plot - unrolled looks best! ####
ndvi %>%
  ggplot() + 
  aes(x = NDVI_May) + 
  geom_density()

#### box and violin plots ####
# assign plot to a variable
pl <- 
  ndvi %>%
  ggplot() + 
  aes(x = Herd, 
      y = NDVI_May)

pl

#### add components to existing plot ####
pl + geom_boxplot()
pl + geom_violin()

#### add colors ####
ndvi %>%
  ggplot() + 
  aes(x = Herd, 
      y = NDVI_May,
      fill = Herd) + 
  geom_boxplot() 

#### barplot (count data), how many observations per year? ####
seaice %>% 
  filter(Herd == "WAH") %>%
  ggplot() + 
  aes(x = Year) + 
  geom_bar()

#### column plot ####
# map data to columns (note order of x-axis)
seaice %>% 
  filter(Herd == "WAH", 
         Year == 1990) %>%
  ggplot() + 
  aes(x = Month, 
      y = Cover) + 
  geom_col()

# display bars in chronolocigal order
# convert data into factor and set to 
#three-letter abbreviation of months
seaice %>% 
  filter(Herd == "WAH", 
         Year == 1990) %>%
  mutate(Month = factor(Month, 
                        month.abb)) %>%
  ggplot() + 
  aes(x = Month, 
      y = Cover) + 
  geom_col()

#### scatter plots ####
pl <- 
  popsize %>% 
  filter(Herd == "WAH") %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size) + 
  geom_point()
# show plot assigned to variable
pl

# add smoothing funtion
pl + geom_smooth()

# fit a linear model
pl + geom_smooth(method = "lm")

# fit a polynomial regression
pl + geom_smooth(method = "lm", 
                 formula = y ~ poly(x, 
                                    3),
                 se = FALSE)

#### calculate summary stats and errors, then plot with errorbars ####
popsize_stats <- 
  popsize %>% 
  filter(Herd %in% c("GRH", 
                     "PCH")) %>%
  group_by(Herd) %>%
  summarize(meanPopSize = mean(Pop_Size),
            SD = sd(Pop_Size),	#std deviation
            N = n(),            #sample size
            SEM = SD/sqrt(N),   #std error
            CI = SEM * qt(0.975, N-1)) #conf interval
popsize_stats

# col plot without error bars
popsize_stats %>%
  ggplot() + 
  aes(x = Herd, 
      y = meanPopSize) + 
  geom_col()

# add errorbars
popsize_stats %>%
  ggplot() + 
  aes(x = Herd, 
      y = meanPopSize) + 
  geom_col() +
  geom_errorbar(aes(ymax = popsize_stats$meanPopSize + 
                      popsize_stats$CI,
                    ymin = popsize_stats$meanPopSize - 
                      popsize_stats$CI),
                width = .3) 

# the code is getting a bit difficult to read, so we can use
# variables to help

#### Saving Aesthetics into Variable ####
# set up aesthetic mapping for confidence intervals in variable
limits <- aes(ymax = popsize_stats$meanPopSize + 
                popsize_stats$CI,
              ymin = popsize_stats$meanPopSize - 
                popsize_stats$CI)

# plot including confidence intervals
popsize_stats %>%
  ggplot() + 
  aes(x = Herd, 
      y = meanPopSize) + 
  geom_col() +
  geom_errorbar(limits, 
                width = .3) 



#### Mind Expander 9.5#####

# https://forms.office.com/r/J5F0UCxWGB


#### set fill color of boxes by using scales ####
pl1 <- 
  popsize %>%
  ggplot() +
  aes(x = Herd, 
      y = Pop_Size, 
      fill = Herd) + 
  geom_boxplot()
pl1

# choose a palette from Color Brewer
pl1 + scale_fill_brewer(palette = "Set3")

# manually set values and rename the legend
pl1 + 
  scale_fill_manual(values = rainbow(11), 
                    name = "HERDS")

#### apply scales to manipulate color and size ####
#of aestethic mappings
pl2 <- 
  seaice %>%
  filter(Herd == "BEV") %>%
  ggplot() + 
  aes(x = Year, 
      y = Month, 
      color = Cover, 
      size = Cover) + 
  geom_point()
pl2

# change color of continuous gradient
pl2 + 
  scale_color_gradient(high = "white", 
                       low = "red")

#### RColorBrewer Color Pallets ####
#install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

#### faceting plots ####
#including missing data
seaice %>%
  filter(Herd %in% c("WAH", 
                     "BAT"), 
         Year %in% c(1980, 
                     1990, 
                     2000, 
                     2010)) %>%
  ggplot() + 
  aes(x = Month, 
      y = Cover) + 
  geom_col() + 
  facet_grid(Year ~ Herd)

#### faceting, allow axis values to vary among facets ####
pl3 <- 
  seaice %>% 
  filter(Year == 2010) %>%
  ggplot() + 
  aes(x = Month, 
      y = Cover) + 
  geom_col() 

pl3 + facet_wrap(. ~ Herd)

# faceting, ommit missing data, adjusted 
#scale of axes
pl3 + facet_wrap(. ~ Herd, 
                 scales = "free")

pl3 + facet_wrap(. ~ Herd, 
                 scales = "free_x")

pl3 + facet_wrap(. ~ Herd, 
                 scales = "free_y")

#### changing labels and title ####
pl <- 
  popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size) + 
  geom_point() 
pl
pl + labs(title = "Population Dynamics",
          x = "Years",
          y = "Population Size")

#### legends ####
pl <- 
  popsize %>%
  ggplot() + 
  aes(x = Herd, 
      y = Pop_Size, 
      fill = Herd) + 
  geom_boxplot()

# default
show(pl)

# move legend        
pl + theme(legend.position = "bottom")
pl + theme(legend.position = "top")

# remove legend
pl + theme(legend.position = "none")

#legend guides
pl <- 
  popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size, 
      color = Herd, 
      alpha = sqrt(Pop_Size)) + 
  geom_point()
show(pl)

pl + 
  guides(color = guide_legend(nrow = 4, 
                              title = "HERD"), 
         alpha = guide_legend(direction = "horizontal", 
                              title =  "ALPHA"))
# suppress only one legend
pl + guides(color = "none")

#### themes ####
pl <- 
  snow %>% 
  filter(Herd == "CAH") %>%
  ggplot() +
  aes(y = Week_snowmelt, 
      x = Perc_snowcover) + 
  geom_point()

# default theme with grey background and white gridlines
show(pl)
# black and white (light background)
pl + theme_bw()
# line draw
pl + theme_linedraw()
# minimalistic theme
pl + theme_minimal()
# my favorite theme
pl + theme_classic()

# load additional themes, use install.packages if need be
#install.packages(ggthemes)
library(ggthemes)
# Wall Street Journal
show(pl + theme_wsj())
# Five thirty-eight
show(pl + theme_fivethirtyeight())

#### setting features ####
# use color as an aesthetic mapping, associated with Herd
popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size, 
      color = Herd) + 
  geom_point()

# set color to be red for all points
popsize %>%
  ggplot() + 
  aes(x = Year, 
      y = Pop_Size) + 
  geom_point(colour = "red")

#### saving particular plot as .pdf in the sandbox ####
ggsave(filename = "week-snowmelt_vs_pct-snowcover.pdf", 
       plot = pl, 
       width = 3, 
       height = 4)

# saving last plot as .pdf in the sandbox
ggsave(filename = "popsize_vs_year.pdf", 
       plot = last_plot(), 
       width = 3, 
       height = 4)

# I prefer using pdf() to save my plots because
# you can save many plots in one document
pdf(file="all_plots.pdf", 
    width = 3, 
    height = 4)
  pl
  pl1
  pl2
  pl3
dev.off()


#### Mind Expander 9.6 ####

# https://forms.office.com/r/tJDT2BnH7F

