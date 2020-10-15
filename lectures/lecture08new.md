# Week08 R Data Wrangling w/ Tidyverse R Package Ch 9

###  Assignment 7 is due by beginning of class (complete Mind Expanders 9.5-9.6)

___

## Computer Preparation

You are expected to start this lecture with R Studio open with a fresh and empty text document in the upper left panel and a clean environment.

### *_GENERAL COMPUTER SETUP (SHOULD ALREADY BE DONE)_* 

<details><summary>Tidyverse Install</summary>
<p>
```R
# clear all variables from environment
rm(list = ls())
```

```
# RUN THE FOLLOWING LINE IN THE CONSOLE (LOWER LEFT PANEL)
install.packages("tidyverse")

# ADD THE FOLLOWING LINE TO YOUR TEXT DOCUMENT (UPPER LEFT PANEL), THEN EXECUTE IT (CTRL-ENTER)
library(tidyverse)
```

</p>
</details>

<details><summary>Win10</summary>
<p>

  * If the Ubuntu app is not installed, then follow [these instructions](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/InstallLinuxOnWindows_Automated.pdf)
  
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can not get Ubuntu running._ After logging in, You are in your home directory. 
  
  * If you are using an Ubuntu terminal that has not been setup (you will know because it will ask you to create a new user name and password) or you notice odd cursor behavior when editing text in the terminal, then run the following code:
  
    ```bash
    git clone https://github.com/cbirdlab/wlsUBUNTU_settings.git
    . ./wlsUBUNTU_settings/updateSettings.bash
    rm -rf wlsUBUNTU_settings
    ```
    
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
  
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```

  * It is always a good idea to keep your apps in `Ubuntu` up to date. _The first time you do this, it could take a long time to finish. After that, if you do this when you log in, it should go quickly._
    ```bash
    sudo apt update
    sudo apt upgrade
    ```

#### Install `R` and `R Studio`

If you have a windows computer, you will need to separately install `R` in the windows environment even if you already installed it in Ubuntu.  Go to the following link below, download R for Windows and run the installer as you would for any other windows app.  

*If you installed R a while ago (more than a month ago), you should do it again or else problems will start to crop up*

1. [R Install](https://cran.revolutionanalytics.com/)

Regardless of your operating system, if you have not already installed R studio, you need to do that now.  On windows computers, install R studio in Windows.  

*If you installed R Studio a while ago, you should do it again to upate to the latest version.*

2. [RStudio Install](https://rstudio.com/products/rstudio/download/?utm_source=downloadrstudio&utm_medium=Site&utm_campaign=home-hero-cta#download)


#### Clone CSB Repo to Your Windows Home Dir

Just to make things a little more tricky, if you have windows, you cannot access the `CSB` repo that you cloned to your home directory in ubuntu with R Studio. So, we have to clone the repo again, but this time to your windows home dir (at least what R Studio recognizes as your windows home dir, `Documents`).

Open your ubuntu terminal and navigate to your windows `Documents` directory, then clone the CSB repo to there.

```bash
# make sure you are in ubuntu
cd /mnt/c/Users/YourWinUserName/Documents 
git clone https://github.com/CSB-book/CSB.git
```

</p>
</details>

<details><summary>MacOS</summary>
<p>
 
  * Open a terminal window
  
  * Consider installing [homebrew](https://brew.sh/).  You will be able to use homebrew to install linux software, such as `tree`, which is used in the slide show.
  
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
  
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```

#### Install `R` and `R Studio`

If you have a Mac and you already installed `R` for use in your terminal, you do not need to reinstall it.

*If you installed R a while ago (more than a month ago), you should do it again or else problems will start to crop up*

1. [R Install](https://cran.revolutionanalytics.com/)

Regardless of your operating system, if you have not already installed R studio, you need to do that now. 

*If you installed R Studio a while ago, you should do it again to upate to the latest version.*

2. [RStudio Install](https://rstudio.com/products/rstudio/download/?utm_source=downloadrstudio&utm_medium=Site&utm_campaign=home-hero-cta#download)


</p>
</details>

---

## I. Review Material Covered for Homework

[Mind Expander 9.5](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOE9LM0ZWOUZWVlZTUzBKQkZaUkcwRVg4Qy4u)

[Mind Expander 9.6](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURDFBNlc2UFFEOVJVMEpaWVZJWkJJNEc1US4u)


## II. [`Tidyverse`](https://www.tidyverse.org/) Data Wrangling 

The tidyverse is an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

Today, we are going to process COVID-19 data from the Coastal Bend of Texas (here). You will need to grab some data and save it to your `CSB/data_wrangling/data` dir.

###############################
* download the [`data_visualization_ggplot2.R`](Week07_files/data_visualization_ggplot2.R) script which has the code from the ppt slides

  * move `data_visualization_ggplot2.R` into your `CSB/data_wrangling/sandbox` dir
  
  * open `data_visualization_ggplot2.R` in R Studio, and execute the lines as we go in the ppt.

################################


---

### Prepping Script

Open a new script file and save it as `CSB/data_wrangling/sandbox/zipCovidSummary.R`

Always add a shebang! to the first line of your script. This will make it executable on a linux computer.  Below is one common location for the `Rscript` command to be located, but it may vary depending upon machine.

```r
#!/usr/bin/env Rscript
```

Make sure that you also set your working directory, clear out your environment (upper right), and clear the plots from your R Studio plot panel (lower right).

```r
# set working dir, this only works if you saved your script to the correct dir: CSB/data_wrangling/sandbox
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# show list of all variables
ls()

# clear all variables
rm(list = ls())

# because the plot panel is a R Studio convention, and not part of R, you have to click the broom icon to clear it. 
```

### Making Code Collapsable in R Studio

It is very convenient to be able to collapse and expand sections of code in your R Studio text editor.  Add the "Housekeeping" line and you will see a small grey arrow beside the line number. Click it and see what happens.

```
#!/usr/bin/env Rscript 

#### Housekeeping ####

# set working dir
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# show list of all variables
ls()

# clear all variables
rm(list = ls())
```

___


### Installing Required Packages and Loading Libraries

The next step is to install and load the packages you will use. In the interest of organization and usability, you should load all packages/libraries in one place near the beginning of the script.  If you realize later on that you need more packages, add them here.

_Note that the `search()` command shows you the libraries that are presently loaded

```r
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

```

___


### Reading In Data

We have already covered reading in data, but `tidyverse` has its own commands for reading in data.  

* `read_delim` - read in delimited text file
  * `read_csv` - specialized version of `read_delim`
  * `read_tsv` - specialized version of `read_delim`

You do not have to use the `tidyverse` commands for reading in files, but if you are committing to using the `tidyverse` philosophy, then you might as well use them.

Here, we are going to use `read_excel` which is from the `readxl` package that we installed and loaded above.  `readxl` is just one of several extended libraries in the tidyverse and is not included when you load `tidyverse`.  This is why we had to install and load it separately above.

```r
covid_cases_zip <- read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx")
```

As with all commands, there are many options available in `read_excel`, but the defaults worked well here.

_Note that `tidyverse` commands use `_` rather than the `.` used in base `R` commands._


___


### Tibbles, A Dataframe by Any Other Name...

The `tidyverse` version of a dataframe (the most common data structure for working with data sets) is called a Tibble.  Again, when using `tidyverse` commands, a dataframe will work, but you should use a tibble to ensure full compatibility and functionality.

When we read in `zip_count_2020-08-18_2020-10-11.xlsx` it was saved into a tibble called `covid_cases_zip`.  Let us take a look at it:

```r
> covid_cases_zip
# A tibble: 6,202 x 2
   LABDATE               zip
   <dttm>              <dbl>
 1 2020-08-18 00:00:00 78413
 2 2020-08-18 00:00:00 78417
 3 2020-08-18 00:00:00 78405
 4 2020-08-18 00:00:00 78405
 5 2020-08-19 00:00:00 78413
 6 2020-08-19 00:00:00 78412
 7 2020-08-19 00:00:00 78408
 8 2020-08-22 00:00:00 78380
 9 2020-08-22 00:00:00 78411
10 2020-08-22 00:00:00 78380
# ... with 6,192 more rows

> str(covid_cases_zip)
tibble [6,202 x 2] (S3: tbl_df/tbl/data.frame)
 $ LABDATE: POSIXct[1:6202], format: "2020-08-18" "2020-08-18" "2020-08-18" "2020-08-18" ...
 $ zip    : num [1:6202] 78413 78417 78405 78405 78413 ...


```

___


### [Tidyverse Cheat Sheet](../resources/CheatSheetTidyverse.pdf)

I had two students from the 2019 Computational Biology Course make a cheat sheet for tidyverse.  It translates english to tidyverse for the most commonly used commands.  You should be able to print this out on two sides of a single sheet of paper and keep as a desk reference.  Once you know the command you want to use, you can look it up in the R Studio help panel (lower right) for specific instructions on its application.

Use the Tidyverse Cheat Sheet](../resources/CheatSheetTidyverse.pdf) to find the command to clean up the column names in a tibble, then apply it to the `covid_cases_zip` tibble

```r
# clean up the column names in the covid_cases_zip tibble
>

```

___


### Pipelines

Tidyverse commands are designed to be used in pipelines that generally follow the Unix Philosophy. This is not the case for all base R commands, so I generally use the pipelines to wrangle and manipulate data that is saved into a tibble (or appropriate data structure) for downstream statistical analysis.

The following code blocks show different ways of reading in data and cleaning up the column names in our `covid_cases_zip` tibble.

```r
# step by step
covid_cases_zip <- read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx")
covid_cases_zip <- clean_names(covid_cases_zip)
```

```r
# nested, the most common base R formatting type
covid_cases_zip <- clean_names(read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx"))
```

```r
# nested & formatted for human readability on a single screen
covid_cases_zip <- clean_names(
  read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx")
  )
```

```r
# pipelined in linux/bash style
read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx") %>% clean_names() -> covid_cases_zip 
```

```r
# pipelined in R style
covid_cases_zip <- read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx") %>% clean_names()
```

```r
# pipelined in R style and formatted for human readability on a single screen
covid_cases_zip <- read_excel("../data/zip_count_2020-08-18_2020-10-11.xlsx") %>%
  clean_names()
```

All these work and accomplish the same task, but I will be teaching you the last option, pipelined and formatted in the `R` style.  So the variable where the output of the pipeline is saved is listed on the first line, regardless of how long the pipeline is.  


___


###



```r

```

___


###



```r

```

___


###



```r

```

___


###



```r

```

___


###



```r

```

___


###



```r

```

___


###



```r

```

___


###



```r

```

___



## HOMEWORK

TBA