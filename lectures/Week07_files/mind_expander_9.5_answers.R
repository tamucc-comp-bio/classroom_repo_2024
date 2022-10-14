

#Mind expander 9.5, ie 1
#1
snow

snow %>%
  ggplot() +
  aes(x=Week_snowmelt, y=Perc_snowcover, color=factor(Year)) +
  geom_point()

#2
snow_stats <- 
  snow %>% 
  group_by(Year) %>%
  summarize(meanPerc_snowcover = mean(Perc_snowcover), meanWeek_snowmelt = mean(Week_snowmelt))
snow_stats

#3
ggplot(data=snow_stats, aes(x=meanWeek_snowmelt, y=meanPerc_snowcover)) + geom_point()

#4
ggplot(data = popsize, aes(x = Herd, y = Pop_Size)) + geom_boxplot()

#4
pop_stats <- popsize %>% 
  filter(Year %in% c(2008:2014)) %>%
  group_by(Year) %>%
  summarise(
    meanPopSize= mean(Pop_Size),
    SD = sd(Pop_Size))	#std deviation
pop_stats
pop_limits <- aes(ymax = pop_stats$meanPopSize + pop_stats$SD, ymin = pop_stats$meanPopSize - pop_stats$SD)

# plot including confidence intervals
ggplot(data = pop_stats) + 
  aes(x = Year, y = meanPopSize) + 
  geom_col() +
  geom_errorbar(pop_limits, width = .3) 
