# Week07 R Data Wrangling w/ Tidyverse R Package Ch 9

###  Assignment 6 is due by beginning of class (complete Mind Expanders 8.2-8.5)

___

## Computer Preparation

You are expected to start this lecture with R Studio open with a fresh and empty text document in the upper left panel and a clean environment.

```R
# clear all variables from environment
rm(list = ls())
```

### *_PLEASE INSTALL TIDYVERSE IN R STUDIO AS SOON AS YOU READ THIS_*

```
# RUN THE FOLLOWING LINE IN THE CONSOLE (LOWER LEFT PANEL)
install.packages("tidyverse")

# ADD THE FOLLOWING LINE TO YOUR TEXT DOCUMENT (UPPER LEFT PANEL), THEN EXECUTE IT (CTRL-ENTER)
library(tidyverse)
```

### *_GENERAL COMPUTER SETUP (SHOULD ALREADY BE DONE)_* 

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

The first key to completing the exercise is using the information provided to you in the `CSB/r/solutions` repository

---

### `WilmesUnpub_pseudo.md`

#### Hints and pseudo code for Exercise 8.23.3 (Wilmes, unpublished)

1. Write a `for` loop that processes all images using the function `getArea` that is provided in `CSB/r/solutions/getArea.R`. The function accepts a single file name as argument, and returns the projected leaf area, measured in pixels. Your loop should record the leaf area for each image, and store it in the data frame `results`. To loop over all files, you can use the function `list.files` along with its pattern matching option, to produce a list of all the files with extension `.JPG` in the directory `CSB/r/data/leafarea/`. Work in your `sandbox` or change paths in the `getArea.R` function accordingly.

2. Plot the area of each plant as measured on time point 1 versus time point 2.

3. Determine if the plants significantly differ at time point 1 and 2 using a paired t-test.


**Hints**: 

- you will need to install the EBImage package and load it. You can use the code:

```r
# install the EBImage package: run the following two commands
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
# note that to install EBImage, you might need to install other libraries


# now load the library
library(EBImage)
```

- create an empty `data.frame` to record results

```r
results <- data.frame(JPG = character(), area = numeric(), stringsAsFactors = FALSE)
```

- the function `list.files` can be used to list all the files in a directory

- write a `for` loop and call the `getArea` function for each file; store the area in the data frame.

- to extract the information on time point and plant name, parse the file name

- to run a t-test in `R`, simply call `t.test`

---

```R
> source("http://bioconductor.org/biocLite.R")
Error: With R version 3.5 or greater, install Bioconductor packages using BiocManager; 
see https://bioconductor.org/install
```

If you follow the instructions given in the error message, you will find that bioconductor can now be installed with the package manager

```R
> install.packages("BiocManager")
Installing package into ‘C:/Users/cbird/Documents/R/win-library/4.0’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.0/BiocManager_1.30.10.zip'
Content type 'application/zip' length 100063 bytes (97 KB)
downloaded 97 KB

package ‘BiocManager’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\cbird\AppData\Local\Temp\RtmpOGXlUN\downloaded_packages
```


```R

```


```R

```


```R

```


```R

```
