
#### INITIALIZE ####
# 1. Set your working directory to be your homework repo, i.e. the dir that contains this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# 2. Load tidyverse
library(tidyverse)

#### Read In Data ####
# 3. We will use the built-in data sets `mpg` and `diamonds` 
  #See sections 3.2.1 and 3.7 of R for Dat Sci https://r4ds.had.co.nz/data-visualisation.html
  #Save mpg into a variable called mpg
  #Save diamonds into a variable called diamonds
  #If completed successfully, your environment should look like assignment_7_3.png
mpg <- mpg
diamonds <- diamonds

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
  # continue to use the unrolled code formatting I've emphasized in lecture
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
  # continue to use the unrolled code formatting I've emphasized in lecture
mpg %>%
  ggplot() +
  aes(x = displ, 
      y = hwy, 
      color = drv,
      linetype = drv) + 
  geom_point() + 
  geom_smooth(se = FALSE,
              color = "blue")

# 9. Do Exercise 3.7.1 in R for Data Science https://r4ds.had.co.nz/data-visualisation.html
  # you may want to consult R for Data Science: Exercise Solutions
  # continue to use the unrolled code formatting I've emphasized in lecture

diamonds %>%
  ggplot() +
  aes(x=cut,
      y=depth) +
  geom_pointrange(stat = "summary",
                  fun = median,
                  fun.min = min,
                  fun.max = max)

# 10. Do Exercise 3.8.1 in R for Data Science https://r4ds.had.co.nz/data-visualisation.html
  # you may want to consult R for Data Science: Exercise Solutions
  # continue to use the unrolled code formatting I've emphasized in lecture

mpg %>%
  ggplot() +
  aes(x=cty,
      y=hwy) +
  geom_point(position = "jitter")

# 11. A variation on Exercise 3.8.3, make three plots by updating the 
  # plot from Ex 3.8.1. Plot 1 should use geom_jitter, Plot 2 geom_count, 
  # Plot 3 geom_count with jittered points. 
  # you may want to consult R for Data Science: Exercise Solutions
  # continue to use the unrolled code formatting I've emphasized in lecture

mpg %>%
  ggplot() +
  aes(x=cty,
      y=hwy) +
  geom_jitter()

mpg %>%
  ggplot() +
  aes(x=cty,
      y=hwy) +
  geom_count()

mpg %>%
  ggplot() +
  aes(x=cty,
      y=hwy) +
  geom_count(position = "jitter")


# 12.  Referring to section 3.9 of R for Data Science and the help page
  # for map_data(), plot a map of Texas with the aspect ratio correctly set, 
  # and the fill set to county. Hide the figure legend (just like in Q7).
  # continue to use the unrolled code formatting I've emphasized in lecture
  # you will want to experiment with map_data to create a tibble before plotting
map_data(map="county",
         region="texas") %>%
  ggplot() +
  aes(x=long,
      y=lat,
      group=group,
      fill = subregion) +
  geom_polygon(color = "black") +
  coord_quickmap() +
  theme(legend.position = "none")

  