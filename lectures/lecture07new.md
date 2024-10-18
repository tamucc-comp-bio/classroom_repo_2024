# Week07 R Data Visualization w/ Tidyverse R Package

![](https://d33wubrfki0l68.cloudfront.net/795c039ba2520455d833b4034befc8cf360a70ba/558a5/diagrams/data-science-explore.png)

###  Assignment 6 is due by beginning of class 

> [!IMPORTANT]
> Assignment 6 is due by beginning of class 

> [!NOTE]
> [Lecture Stream]()
> Passcode: TBA

> [!NOTE]
> I converted the [Lecture_07 Slides](Week07_files/ggplot2_1.pptx) to a more screen-splitting friendly format here in GitHub.

___

## Computer Preparation

> [!IMPORTANT]
> Make sure your computer is ready for the lecture

### *_PLEASE INSTALL TIDYVERSE IN R STUDIO AS SOON AS YOU READ THIS_*

```
# RUN THE FOLLOWING LINE IN THE CONSOLE (LOWER LEFT PANEL)
install.packages("tidyverse")

# ADD THE FOLLOWING LINE TO YOUR TEXT DOCUMENT (UPPER LEFT PANEL), THEN EXECUTE IT (CTRL-ENTER)
library(tidyverse)
```

<details><summary>Windows, Mac, Linux</summary>
<p>

- [ ] Step 0. Open Terminal

  > Search for the terminal app and open it.  For Windows, make sure you are using Ubuntu.

  > You should have already prepared your computer during Lecture 0.  If you did not then:  

  > * Complete the tasks listed in the [How to Set Up Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md), up to, but not including R and RStudio.
  >    * If you are having difficulty installing ubuntu, use Launch if your account is activated.

- [ ] Step 1. Update Your apps

  > It's always a good idea to keep your apps in your terminal up to date. 
  
  > For Ubuntu (Linux), enter the following commands to load the newest versions of your apps

  ```bash
  sudo apt update
  sudo apt upgrade
  ```

  > For Mac (Homebrew), enter the following commands to load the newest versions of your apps

  ```bash
  brew update
  brew upgrade
  ```

- [ ] Step 2. Confirm you have cloned the CSB (Computing Skills For Biologists) Repo into your home dir

    > In your terminal, enter the following commands:

    ```bash
    # make sure you're in your home dir
    cd ~
    
    # list the directories and files in the CSB dir to confirm it's in your home dir
    ls CSB
    ```

    > You should see the following output because we cloned the CSB Repo to your home dir in [Lecture 0](https://github.com/tamucc-comp-bio/classroom_repo_2024/blob/master/lectures/lecture00.md).  

    ```bash
    LICENSE  README.md  data_wrangling  git  good_code  latex  python  r  regex  scientific  sql  unix
    ```

    > If you see the output above, you're done! Goto the next section.

- [ ] Step 3. If you didn't have the CSB Repo, clone it now

  > If you **do not** see the output above, then clone the CSB repo by entering the following commands:

    ```bash
        git clone https://github.com/CSB-book/CSB.git
    ``` 

  > You should see the following output:

    ```bash
    Cloning into 'CSB'...
    remote: Enumerating objects: 1005, done.
    remote: Total 1005 (delta 0), reused 0 (delta 0), pack-reused 1005 (from 1)
    Receiving objects: 100% (1005/1005), 26.68 MiB | 7.74 MiB/s, done.
    Resolving deltas: 100% (389/389), done.
    ```

  > Goto Step 2 above.

<hr style="height: 0.1px; border: none; background-color: black;">

</p>
</details>

<details><summary>ChromeOS, iOS, Android</summary>
<p>

 - [ ] Step 0. [Log Into Launch HPC](https://portal-launch.hprc.tamu.edu/)

    > Use the following [link](https://portal-launch.hprc.tamu.edu/) to log in 

    > You should have already created your account during Lecture 0.  If you did not then:  
    > * Complete the tasks listed in the [Accessing Launch Instructions](https://hprc.tamu.edu/kb/User-Guides/Launch/Access/#no-ssh-login)

 - [ ] Step 1. Open Terminal

    > Select `launch Shell Access`

 - [ ] Step 2. Confirm you have cloned the CSB (Computing Skills For Biologists) Repo into your home dir

  > In your terminal, enter the following commands:

    ```bash
    # make sure you're in your home dir
    cd ~

    # list the directories and files in the CSB dir to confirm it's in your home dir
    ls CSB
    ```

  > You should see the following output because we cloned the CSB Repo to your home dir in [Lecture 0](https://github.com/tamucc-comp-bio/classroom_repo_2024/blob/master/lectures/lecture00.md).  

    ```bash
    LICENSE  README.md  data_wrangling  git  good_code  latex  python  r  regex  scientific  sql  unix
    ```

  > If you see the output above, you're done! Goto the next section.

- [ ] Step 3. If you didn't have the CSB Repo, clone it now

  > If you **do not** see the output above, then clone the CSB repo by entering the following commands:

    ```bash
        git clone https://github.com/CSB-book/CSB.git
    ``` 

  > You should see the following output:

    ```bash
    Cloning into 'CSB'...
    remote: Enumerating objects: 1005, done.
    remote: Total 1005 (delta 0), reused 0 (delta 0), pack-reused 1005 (from 1)
    Receiving objects: 100% (1005/1005), 26.68 MiB | 7.74 MiB/s, done.
    Resolving deltas: 100% (389/389), done.
    ```

  > Goto Step 2 above.

 </p>
</details>

[If you have not already, install R](https://github.com/tamucc-comp-bio/how_to/blob/main/install_r.md)

[If you have not already, install RStudio](https://github.com/tamucc-comp-bio/how_to/blob/main/install_rstudio.md)

You are expected to start this lecture with R Studio open with a fresh and empty text document in the upper left panel and an empty environment.  If R Studio was open on your computer, close it and open it again.

```R
# clear all variables from environment
rm(list = ls())
```


---

___



---

## [I. Lecture Slides](Week07_files/ggplot2_1.pptx)

---

## II. Review Material Covered for Homework



<details><summary>Copy the `r` dir to your repo</summary>
<p>

Start the assignment by copying the `r` dir from the `CSB` repo to your homework repo.


---

</p>
</details>


<details><summary>Use the Pseudocode and Solutions</summary>
<p>
The first key to completing the exercise is using the information provided to you in the `CSB/r/solutions` repository


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
results <- data.frame(JPG = character(), 
                      area = numeric(), 
                      stringsAsFactors = FALSE)
```

- the function `list.files` can be used to list all the files in a directory

- write a `for` loop and call the `getArea` function for each file; store the area in the data frame.

- to extract the information on time point and plant name, parse the file name

- to run a t-test in `R`, simply call `t.test`

---

Following the hint given above, we run the following

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

And then we can load the package using `library`

```R
> library(BiocManager)
Bioconductor version 3.11 (BiocManager 1.30.10),
  ?BiocManager::install for help
```

Continuing from the bioconductor website, with an eye on the pseudocode hints, we see that there is a new way to load the `EBImage` bioconductor library. biocLite has been deprecated (scroll to bottom of bioconductor page to see).

_Note that we prefix the `install` command with `BiocManager::`.  We did this because `install` could be a function in another R package.  When this is a concern, you can add the name of the package for the command you want to run to make sure the correct function is run. 5% of mysterious R behavior is caused by different packages having functions with the same name but the user does not realize it._

```R
BiocManager::install("EBImage")
```

#### To review, the following lines should be in your text editor panel, documenting how you installed the `EBImage` library from bioconductor.

```R
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("EBIimage")
library("EBImage")
```

---

</p>
</details>

<details><summary>Begin Answering the First Question</summary>
<p>

#### Now we can continue addressing the question 

```R
# make sure you are in the right working diretory, `r/sandbox`
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# source the getArea.R function
source("../solutions/getArea.R")

# make list of files to processes
files <- list.files("../data/leafarea", 
                    pattern = ".JPG")

# create a data frame to record results
results <- data.frame(JPG = character(), 
                      area = numeric(), 
                      stringsAsFactors = FALSE)

# run function getArea on all images
for (f in files) {
    area <- getArea(f)
    results[nrow(results) + 1, ] <- c(f, area)
}

# convert the area column in the results data frame to numeric data
results$area <- as.numeric(results$area)
```

_Note that it is poor form to write a function with dependencies, like `EBImage`, without including the code to install and load the package in the script.  This is the fault of the script author, but you will find that the onus falls on you to solve these types of issues with open source software. Imagine if you had to write the function from scratch; it is usually easier to troubleshoot an existing script that is theoretically functional with a little tweaking._

---

</p>
</details>

<details><summary>Second Question</summary>
<p>


#### Next we extract information from the file names to rearrange the data frame

Let us break down what is about to happen.  The function `substr()`, which is short for substring, is being applied to the `JPG` column in `results`.  If you type `substr` into the help panel (lower right) you will see what the 1 and 2 mean.

```R
# extract time point information and save into new column called tp then make the tp datatype be a factor
results$tp <- substr(results$JPG, 1, 2)
results$tp <- as.factor(results$tp)
```

The `sapply` function is fast for loop.  The vector given to the loop is column `JPG`. One by one, each value in the column is stored into the variable `x` and then the commands `unlist(strsplit(x, "[_]|[.]"))[2])` are run on `x`.  

A function called `strsplit` can be used to break up the file names by delimiters (characters that signify a column break). Here we use the `_` and `.` to break up the name and then select the second "column" to keep.  `strsplit()` outputs a list, so the `unlist()` command is used to convert that list to a vector, and then we grab the second element in the vector `[2]`, which is the plant information

```R
# extract plant information
results$plant <- sapply(results$JPG, 
                        function(x) unlist(strsplit(x, "[_]|[.]"))[2])
results$plant <- as.factor(results$plant)
```

#### And then we can plot the results

Here, we will use base R to make a plot, and then we will give you a taste of "the tidyverse" by using `ggplot` to make the figure.

```r 
# rearrange data into vectors for plotting
tp1 <- results[results$tp == "t1", ]$area
tp2 <- results[results$tp == "t2", ]$area

plot(tp2 ~ tp1, 
     xlab = "Projected leaf area, tp1", 
     ylab = "Projected leaf area, tp2")
abline(c(0,1)) # add the 1-to-1 line
```

*_[`Tidyverse`](https://www.tidyverse.org/) to the rescue!_*

We will learn more about how this all works, for now, marvel at the power of the [`Tidyverse`](https://www.tidyverse.org/)

```r 
library(tidyverse)
results %>%                                   # the %>% is a pipe, in bash it was |
  select(-JPG) %>%                            # remove the JPG column, we have to remove this col for the next command to work
  pivot_wider(names_from = tp, 
              values_from = area) %>% # pivot_wider makes columns named according to the unique names in the tp col and fills them with the values from the area column
  ggplot(aes(x=t1, 
             y=t2)) +                   # assign data to plot elements, in ggplot, the + means more ggplot settings follow on next line
    geom_point(color="red4") +                # visualize the data with points
    geom_abline(linetype = "dashed") +        # draw y=x line
    labs(y="Projected leaf area (time 2)",    # edit the labels
         x="Projected leaf area (time 1)",
         title = "Change in Leaf Area",
         subtitle = "Tidyverse >> Base R") +
    theme_classic()                           # make it pretty
```

---

</p>
</details>

<details><summary>Third Question</summary>
<p>


#### Lastly, run the statistical test, using Base R

```r 
> t.test(tp1, 
         tp2, 
         paired = TRUE, 
         alternative = "less")

	Paired t-test

data:  tp1 and tp2
t = -20.01, df = 21, p-value = 1.856e-15
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
      -Inf -6486.002
sample estimates:
mean of the differences 
              -7096.227
```

> [!NOTE]
> ChatGPT is generally excellent at helping you interpret the output of statistical tests in R, especially if you show it the data that was processed using `str()` and you've named columns descriptively

```
The output indicates the result of a paired t-test comparing two sets of values (tp1 and tp2), where the alternative hypothesis is that the true mean of the differences between tp1 and tp2 is less than 0.

Here's a breakdown of the results:

    t = -20.01: This is the t-statistic, a measure of how many standard errors the observed difference is from the null hypothesis (that there is no difference between tp1 and tp2).
    df = 21: The degrees of freedom, which is based on the number of pairs in the data (in this case, 22 pairs, so n−1=21n−1=21).
    p-value = 1.856e-15: This is the probability of observing a t-statistic as extreme as -20.01 (or more extreme) under the null hypothesis. A p-value this small indicates that the null hypothesis can be rejected with very high confidence.
    alternative hypothesis: true difference in means is less than 0: This is the alternative hypothesis that was tested, meaning that the mean of tp1 is less than the mean of tp2.
    95 percent confidence interval: (-Inf, -6486.002): This interval suggests that with 95% confidence, the true difference in means is between negative infinity and -6486.002.
    mean of the differences: -7096.227: The mean difference between tp1 and tp2 is -7096.227, indicating that on average, tp1 is smaller than tp2 by about 7096.

Since the p-value is extremely small, this suggests that there is strong evidence that the mean of tp1 is significantly less than the mean of tp2.
```

---

</p>
</details>

---

## III. [`Tidyverse`](https://www.tidyverse.org/) Data Visualization w/ `ggplot2`

 R packages for data science

The tidyverse is an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

Today, I am going to project a ppt slide show.  I would like you to set up R Studio as follows:

* download the [`data_visualization_ggplot2.R`](Week07_files/data_visualization_ggplot2.R) script which has the code from the ppt slides

  * move `data_visualization_ggplot2.R` into your `CSB/data_wrangling/sandbox` dir
  
  * open `data_visualization_ggplot2.R` in R Studio, and execute the lines as we go in the ppt.


---


## Mind Expanders

Complete the following mind expanders:

[Mind Expander 9.5](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOE9LM0ZWOUZWVlZTUzBKQkZaUkcwRVg4Qy4u)

[Mind Expander 9.6](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURDFBNlc2UFFEOVJVMEpaWVZJWkJJNEc1US4u)

---

## Homework 

* Complete the Lecture Slides and [Mind Expander 9.6](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURDFBNlc2UFFEOVJVMEpaWVZJWkJJNEc1US4u)

* Complete the [Assignment 7 Questions](https://classroom.github.com/a/G7cmolw_)
	* clone this repo to your computer, update the R script, then push the changes to github

