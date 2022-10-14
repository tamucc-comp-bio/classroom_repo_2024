#Mind expanders 9.6, i.e. 2
#2
pl <- ggplot(data = snow) + 
  aes(x = Year, y = Herd, fill = Week_snowmelt) + 
  geom_tile()
pl