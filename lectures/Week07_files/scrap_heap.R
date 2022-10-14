##################################################



#### Using Select to Remove Columns & pivot_wider ####
popsize %>% 
  filter(Year > 1979, 
         Year < 1985) %>% 
  pivot_wider(names_from = Year,
              values_from = Pop_Size)
# spread(Year, Pop_Size) %>%  
select(Herd, 
       `1980`)

# ungroup elements
popsize %>% 
  group_by(Herd, 
           Year) %>% 
  tally() %>% 
  ungroup()












#Mind Expander 2
snow_stats <- snow %>% 
  group_by(Year) %>%
  summarise(
    meanPerc_snowcover = mean(Perc_snowcover),
    meanWeek_snowmelt = mean(Week_snowmelt))
snow_stats

#Mind Expander 3

ggplot(data=snow_stats, aes(x=meanWeek_snowmelt, 
                            y=meanPerc_snowcover))+
  geom_point()

#Mind Expander 4
pl <- ggplot(data = popsize) + 
  aes(x = Herd, y = Pop_Size)
# add components to existing plot
pl + geom_boxplot()

#Mind Expander 5
# calculate summary stats and errors
stats <- popsize %>% 
  filter(Year %in% c(2008:2014)) %>%
  group_by(Year) %>%
  summarise(
    meanPopSize = mean(Pop_Size),
    SD = sd(Pop_Size))	#std deviation
# N = n(),            #sample size
# SEM = SD/sqrt(N),   #std error
# CI = SEM * qt(0.975, N-1)) #conf interval
stats

limits <- aes(ymax = stats$meanPopSize + stats$SD,
              ymin = stats$meanPopSize - stats$SD)

# plot including confidence intervals
ggplot(data = stats) + 
  aes(x = Year, y = meanPopSize) + 
  geom_col() +
  geom_errorbar(limits, width = .3) 





