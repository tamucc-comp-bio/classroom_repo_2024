
#### INITIALIZE ####
# 1. Set your working directory to be your homework repo, i.e. the dir that contains this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# 2. Load tidyverse
library(tidyverse)

#### Read In Data ####
# 3. We will use the built-in data set `mpg` for this question. See section 3.2.1 of R for Dat Sci
  #Save it into a variable called mpg
mpg <- mpg

# 4. What’s gone wrong with this code? Why are the points not blue?
  # Fix the code so that the points are blue and reformat using the 
  # "unrolled" style that I've been emphasizing in lecture.
  # see assignment_7_4.png to check your plot

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

mpg %>%
  ggplot() +
  aes(x = displ,
      y = hwy) +
  geom_point(color = "blue")

# 5. Update the plot from number 4 to color the points by `year`, 
  # set the size by `cyl` and the shape by `drv`
  # continue to use the unrolled code formatting I've emphasized in lecture
  # see assignment_7_5.png to check your plot
mpg %>%
  ggplot() +
  aes(x = displ,
      y = hwy,
      color = year,
      size = cyl,
      shape = drv) +
  geom_point()


# 6. Update the plot from number 5 to be faceted by `trans` and 
  # set the number of facet rows be 2
  # continue to use the unrolled code formatting I've emphasized in lecture
  # see assignment_7_6.png to check your plot
mpg %>%
  ggplot() +
  aes(x = displ,
      y = hwy,
      color = year,
      size = cyl,
      shape = drv) +
  geom_point() +
  facet_wrap(trans ~ .,
             nrow = 2)

# 7. Update the following code to hide the figure legend and 
  # show the grey ribbons on the LOESS fit lines
  # see assignment_7_7.png to check your plot

mpg %>%
ggplot() +
  aes(x = displ, 
      y = hwy, 
      color = drv) + 
  geom_point() + 
  geom_smooth(se = FALSE)

mpg %>%
  ggplot() +
  aes(x = displ, 
      y = hwy, 
      color = drv) + 
  geom_point() + 
  geom_smooth(se = TRUE) +
  theme(legend.position="none")

# 8. Write the code to recreate the plot in `assignment_7_8.PNG`

mpg %>%
  ggplot() +
  aes(x = displ, 
      y = hwy, 
      color = drv,
      linetype = drv) + 
  geom_point() + 
  geom_smooth(se = FALSE,
              color = "blue")
