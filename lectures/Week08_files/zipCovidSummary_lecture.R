#!/usr/bin/env Rscript 

# this script assumes that your data is in ../data
# the data files are:
# zip_count_2020-08-18_2020-10-11.xlsx


#### Housekeeping ####

# set working dir
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# show list of all variables
ls()

# clear all variables
rm(list = ls())


#### Load Libraries ####

# show all libraries that are loaded
search()

# load tidyverse
library(tidyverse)

# load readxl package, you will have to run the following line once if it is not installed
# install.packages("readxl")
library(readxl)
# install.packages("lubridate")
library(lubridate)
# install.packages("janitor")
library(janitor)

search()

#### USER DEFINED VARIABLES ####

# you should set all user-defined variables at the beginning of the script in one section
# this makes your script ready to be executed with command line options and
# makes it easier to edit when you add or change variables

# date and zip code of every covid case
data_zip_count_file_path = "../data/zip_count_2020-08-18_2020-10-11.xlsx"

# population size in every zip code
data_zip_census_file_path = "../data/zip_2010census-pop.xlsx"

# date and age of every covid case
data_age_count_file_path = "../data/age_count_2020-07-13_2020-10-11.xlsx"

#### Read In Data ####
covid_cases_zip <- read_excel(data_zip_count_file_path)

# peak at tibble
covid_cases_zip

# more useful peak at tibble
str(covid_cases_zip)

# standardize the formatting of the column names in the covid_cases_zip tibble
overwrite this with a line of code


#### Pipelines ####
# step by step
covid_cases_zip <- read_excel(data_zip_count_file_path)
covid_cases_zip <- clean_names(covid_cases_zip)

# nested, the most common base R formatting type
covid_cases_zip <- clean_names(read_excel(data_zip_count_file_path))

# nested & formatted for human readability on a single screen
covid_cases_zip <- clean_names(
  read_excel(data_zip_count_file_path)
  )

# pipelined in linux/bash style
read_excel(data_zip_count_file_path) %>% clean_names() -> covid_cases_zip 

# pipelined in R style
covid_cases_zip <- read_excel(data_zip_count_file_path) %>% clean_names()

# pipelined in R style and formatted for human readability on a single screen
covid_cases_zip <- 
  read_excel(data_zip_count_file_path) %>%
  clean_names()


#### Advanced Pipelines ####
# check previous data format
view(covid_cases_zip)

# read in data, count up occurences of each zip code on each day, make each row a unique combination of date and zip code
covid_cases_zip <- 
  read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate) %>%
  group_by(date, 
           zip) %>%
  summarize(new_cases = n())

# check data format again
view(covid_cases_zip)

#### Adding and Modifying Tibble Columns with `mutate`####

# tibble before mutate
read_excel(data_zip_count_file_path) %>%
  clean_names() 

# convert the zip column to a factor using mutate and as_factor
read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip))

# additionally make a date column that is formatted as a tidyverse date using mutate and ymd
read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate))

#### Remove and Reorder Columns with `select` ####

# remove the labdate column
read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate)

#### Group Tibble Rows by Column Values with `group_by` So that Calculations by Group Can be Made####
# group rows by both date and zip code
read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate) %>%
  group_by(date, 
           zip)

#### Performing Row-wise Calculations Based Upon the Groupings with `summarize`####
# count the number of COVID cases by the groupings (case x zip) using summarize() and n()
read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate) %>%
  group_by(date, 
           zip) %>%
  summarize(new_cases = n())


#### Plot covid_cases_zip Data ####

# this should already be done, but just in case, save the tibble into covid_cases_zip
covid_cases_zip <- 
  read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate) %>%
  group_by(date, 
           zip) %>%
  summarize(new_cases = n())

# HEATMAP: new cases per day by zip code
covid_cases_zip %>%
  ggplot() +
  aes(x = date, 
      y = zip, 
      fill = new_cases) +
  geom_tile() +
  geom_smooth(se = FALSE)

# SCATTERPLOT: new cases per day
covid_cases_zip %>%
  summarize(new_cases = sum(new_cases))

covid_cases_zip %>%
  summarize(new_cases = sum(new_cases)) %>%
  ggplot() +
  aes(x = date, 
      y = new_cases) +
  geom_point() +
  geom_smooth() +
  theme_classic()

#### Use `filter` To Remove Rows then Create Scatterplot ####
# SCATTERPLOT: new cases per day by zip code
# here we remove the zip codes with too little data to make this figure
covid_cases_zip %>%
  filter(!zip %in% c("78469", 
                     "78402")) %>%   # note, we would want to add this to the USER DEFINED VARIABLES rather than hardcoding it like this
  ggplot() +
  aes(x = date, 
      y = new_cases, 
      color = zip) +
  geom_point() +
  geom_smooth(se = FALSE)  +
  theme_classic()

#### Plot Two Different Tibbles in 1 Scatterplot ####
# SCATTERPLOT: new cases per day by zip code, compare to mean
covid_cases_zip %>%
  filter(zip == "78412") %>%
  ggplot() +
  aes(x = date, 
      y = new_cases) +
  geom_point(color="red4") +
  geom_smooth(se = FALSE, 
              color="red4") +
  geom_point(data = covid_cases_zip %>%
               summarize(mean_new_cases = mean(new_cases)), 
             aes(x = date, 
                 y = mean_new_cases), 
             color="black") +
  geom_smooth(data = covid_cases_zip %>%
                summarize(mean_new_cases = mean(new_cases)), 
              aes(x = date, 
                  y = mean_new_cases), 
              color="black") +
  theme_classic()

#### `lubridate` - The Extended Tidyverse Package for Date Data Types ####

# add columns for the day of the week and month, then 
# change unit of observation (rows) to the number of covid cases by day of week and month
covid_cases_zip %>%
  mutate(day = wday(date, 
                    label=TRUE, 
                    abbr=TRUE),
         month = month(date, 
                       label=TRUE, 
                       abbr=TRUE)) %>%
  group_by(day, 
           month) %>%
  summarize(new_cases = sum(new_cases)) 

# COLUMNPLOT: total new cases per day of week for each month
covid_cases_zip %>%
  mutate(day = wday(date, 
                    label=TRUE, 
                    abbr=TRUE),
         month = month(date, 
                       label=TRUE, 
                       abbr=TRUE)) %>%
  group_by(day, 
           month) %>%
  summarize(new_cases = sum(new_cases)) %>%
  ggplot() +
  aes(x = day, 
      y = new_cases) +
  geom_col() +
  geom_smooth() +
  theme_classic() +
  facet_grid(month ~ .)

covid_cases_zip %>%
  mutate(day = wday(date, 
                    label=TRUE, 
                    abbr=TRUE),
         month = month(date, 
                       label=TRUE, 
                       abbr=TRUE)) %>%
  group_by(day, 
           month) %>%
  summarize(new_cases = sum(new_cases)) %>%
  ggplot() +
  aes(x = day, 
      y = new_cases) +
  geom_col() +
  geom_smooth() +
  theme_classic() +
  facet_grid(. ~ month)


#### read in census data by zip code####
pop_zip <- read_excel(data_zip_census_file_path) 
str(pop_zip) 

# isolate numeric zip code
read_excel(data_zip_census_file_path) %>%
  clean_names() %>%
  separate(col=zip_code, 
           into=c('x1', 
                  'x2', 
                  'zip'))

# isolate numeric zip code & polish tibble
pop_zip <- 
  read_excel(data_zip_census_file_path) %>%
  clean_names() %>%
  separate(col=zip_code, 
           into=c('x1', 
                  'x2', 
                  'zip')) %>%
  select(zip, 
         city, 
         population)

#### Join Two Data Files With Different Columns using `join` ####
# left join covid_cases_zip and pop_zip, creating new tibble
covid_cases_zip_pop <- 
  covid_cases_zip %>%
  left_join(pop_zip, 
            by = "zip")

covid_cases_zip_pop

# create column with number of new_cases per 100 individuals to standarize across zip codes
covid_cases_zip_pop <- 
  covid_cases_zip %>%
  left_join(pop_zip, 
            by = "zip") %>%
  mutate(new_cases_per100 = 100 * new_cases / population)

#### How Much Variation is There in Cases by Zipcode? ####
covid_cases_zip_pop %>%
  filter(!zip %in% c("78469", 
                     "78402"),
         population > 0) %>%
  group_by(zip, 
           population) %>%
  summarize(total_cases = sum(new_cases)) %>%
  mutate(cases_per100 = 100 * total_cases / population) %>%
  ggplot() +
  aes(x=zip, 
      y=cases_per100) +
  geom_col() +
  theme_classic()

# COLUMNPLOT: Total Cases Per Capita by Zip Code
covid_cases_zip_pop %>%
  filter(!zip %in% c("78469", "78402"),
         population > 0) %>%
  group_by(zip, population) %>%
  summarize(total_cases = sum(new_cases)) %>%
  mutate(cases_per100 = 100 * total_cases / population) %>%
  ggplot(aes(x=population, y=cases_per100)) +
  geom_point() + 
  geom_smooth() +
  theme_classic()


#### Read In Zip Data ####
covid_cases_zip_pop <- read_excel(data_zip_count_file_path) %>%
  clean_names() %>%
  mutate(zip = as_factor(zip),
         date = ymd(labdate)) %>%
  select(-labdate) %>%
  group_by(date, zip) %>%
  summarize(new_cases = n()) %>%
  left_join(read_excel(data_zip_census_file_path) %>%
              clean_names() %>%
              separate(col=zip_code, into=c('x1', 'x2', 'zip')) %>%
              select(zip, city, population), 
            by = "zip")


#### Read In Demographic Data ####
bind_rows(read_excel(data_age_count_file_path, 
                     sheet = "Jul"),
          read_excel(data_age_count_file_path, 
                     sheet = "Aug"),
          read_excel(data_age_count_file_path, 
                     sheet = "Sep"),
          read_excel(data_age_count_file_path, 
                     sheet = "Oct"))

#### Read In Demographic Data ####
covid_cases_age <- bind_rows(read_excel(data_age_count_file_path, sheet = "Jul"),
          read_excel(data_age_count_file_path, sheet = "Aug"),
          read_excel(data_age_count_file_path, sheet = "Sep"),
          read_excel(data_age_count_file_path, sheet = "Oct")) %>%
  clean_names() %>%
  mutate(date = ymd(labdate)) %>%
  select(-labdate) %>%
  mutate(age_class = case_when(
    age_years < 20 ~ "0-19",
    age_years >= 20 & age_years < 40 ~ "20-39",
    age_years >= 40 & age_years < 60 ~ "40-59",
    age_years >= 60 & age_years < 80 ~ "60-79",
    age_years >= 80 ~ "80+")) %>%
  group_by(date, age_class) %>%
  summarize(new_cases = n())
  

# unstack data by age class
covid_cases_age %>%
  pivot_wider(names_from = "age_class", values_from = "new_cases")
