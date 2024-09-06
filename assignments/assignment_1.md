# Assignment 1 

## Reading for Discussion Next lecture

[Wilson_etal_2017_good_enough_practices](../literature/Wilson_etal_2017_good_enough_practices_in_scientific_computing.pdf)

---

## Computer Preparation

> [!IMPORTANT]
> Make sure your computer is ready to complete the assignment

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


---


## Description of Assignment

We are also going to flip the classroom next week. Flipping the classroom means that you work on the material to be covered before we address it in lecture. Then we can spend time in lecture going over the most challenging topics, as identified by you. Then we will continue together in lecture through new material that builds upon this assignment.  This material is covered in ch 1.6 of the CSB book.

<details><summary>Work through remainder of Lecture 01 & Complete Mind Expander 01.02</summary>
<p>

Work through the remainder of [lecture 1](../lectures/lecture01.md).  To help you learn `bash`, you are expected to type in or copy and paste the commands in the

```
code blocks
```

Complete [Mindexpander 01.02](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOUo2UVRUMVgwTUlQMlpUQzUzOTIzME9LNi4u) by answering the question(s) in the online form and submitting.  You must be logged into your TAMUCC email account to have your identity attached to your answers. 

* **_You can resubmit your answers as neccessary_**

* **_I highly recommend that you first record your answers in a text document in either [Notepad++ for Win](https://notepad-plus-plus.org/downloads/) or [BBedit for Mac](https://www.barebones.com/products/bbedit/) and save them to your computer_**. 

</p>
</details>

---

<details><summary>Software Carpentry</summary>
<p>

Complete the [Pipes & Filters](https://swcarpentry.github.io/shell-novice/04-pipefilter.html) tutorial on software carpentry

Complete the [Finding Things](https://swcarpentry.github.io/shell-novice/07-find.html) tutorial on software carpentry

</p>
</details>

---

<details><summary>Advanced `bash` Commands</summary>
<p>

Work through the following tutorial. Note the instructions to clone the CSB repo in the [Computer Preparation instructions](#computer-preparation) above


---

### Redirection of output ([stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout))) to file `[command] > filename`, Append [stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout)) to file `[command] >> filename`, Redirect contents of file to [stdin](https://en.wikipedia.org/wiki/Standard_streams#Standard_input_(stdin)) `[command] < filename` 

```bash
# let’s start by moving to our sandbox in the unix dir of the CSB repo
# you must have cloned the CSB repo to your home dir for this path to work
$ cd ~/CSB/unix/sandbox

# print text to screen, then print to file, then print file to screen
$ echo "My first line" 
My first line

$ echo "My first line" > test.txt
$ cat test.txt
My first line

# append file with additional text, then print file to screen
$ echo "My second line" >> test.txt
$ cat test.txt
My first line
My second line
```

_use `Tab` key to autocomplete names, prevent spelling mistakes_

---


### Problem Solving Scenario

A machine provides you with thousands of data files. There’s so many, it is breaking your Win/Mac GUI file browser. How can you determine the number of files?

We will use the dir `unix/data/Saavedra2013` as an example of a directory with many files

```bash
# start by moving to our sandbox if you are not already there
$ cd ~/CSB/unix/sandbox

# save file names to file in pwd
$ ls ../data/Saavedra2013 > filelist.txt

# look at the file
$ cat filelist.txt

# count lines in the file
$ wc -l filelist.txt

# remove the file
$ rm filelist.txt
```

---

### Piping Text Streams From One Command to the Next with `|`

![Common Operating Systems](Week01_files/pipeline.png)

![Common Operating Systems](Week01_files/pipeline2.png)

A pipe `|` passes the [stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout)) from one command to the [stdin](https://en.wikipedia.org/wiki/Standard_streams#Standard_input_(stdin)) of another

How many files are there?

```bash
# list file names
$ ls ../data/Saavedra2013

# list file names and pipe into wc
$ ls ../data/Saavedra2013 | wc –l
59

```

---

### [TSV](https://en.wikipedia.org/wiki/Tab-separated_values) & [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) Data Files

In the tidy table below, columns are _*delimited*_ by tabs.  The first column has no column header but is the sample ID.  Ozone, Solar.R, Wind, Temp, Month, and Day are all pieces of data (dimensions) describing each of the 10 samples.

![Common Operating Systems](Week01_files/tsv.png)

* Tab Separated Values (TSV)

  * Tabs denote columns

* Comma Separated Values (CSV)

  * Commas denote columns
  
* [Tidy data](https://en.wikipedia.org/wiki/Tidy_data)

  * Each [row](https://en.wikipedia.org/wiki/Row_(database)) is one [unit of observation](https://en.wikipedia.org/wiki/Unit_of_observation)
  
  * Each [column](https://en.wikipedia.org/wiki/Column_(database)) is one dimension or aspect of the units of observation
  
* File extensions are not always accurate, so it is important to view a file to be sure of the delimiter.

Do not type in the following code blocks.  They are here to show you TSV and CSV formatting

Tidy Table:
| Column 1 Header | Column 2 Header | Column 3 Header |
| --------------- | --------------- | --------------- |
| Row 1 Column 1 | Row 1 Column 2 | Row 1 Column 3 |
| Row 2 Column 1 | Row 2 Column 2 | Row 2 Column 3 |
| Row 3 Column 1 | Row 3 Column 2 | Row 3 Column 3 |
| Row 4 Column 1 | Row 4 Column 2 | Row 4 Column 3 |

TSV
```
Column 1 Header	Column 2 Header	Column 3 Header
Row 1 Column 1	Row 1 Column 2	Row 1 Column 3
Row 2 Column 1	Row 2 Column 2	Row 2 Column 3
Row 3 Column 1	Row 3 Column 2	Row 3 Column 3
Row 4 Column 1	Row 4 Column 2	Row 4 Column 3
```

TSV File with tabs denoted by `\t`.  Note your text files will not contain `\t`.  I did this show where tabs were, versus spaces. This is also the first use of a regular expression in this course.  The `\` is the escape character, which changes the meaning of the character that follows.  `\t` is the regular expression for a tab. Regular expressions are recognized by almost all commands across all computer languages that use a pattern (`\t`) to find matching text (tab character).

```
Column 1 Header\tColumn 2 Header\tColumn 3 Header
Row 1 Column 1\tRow 1 Column 2\tRow 1 Column 3
Row 2 Column 1\tRow 2 Column 2\tRow 2 Column 3
Row 3 Column 1\tRow 3 Column 2\tRow 3 Column 3
Row 4 Column 1\tRow 4 Column 2\tRow 4 Column 3
```

CSV
```
Column 1 Header, Column 2 Header, Column 3 Header
Row 1 Column 1, Row 1 Column 2, Row 1 Column 3
Row 2 Column 1, Row 2 Column 2, Row 2 Column 3
Row 3 Column 1, Row 3 Column 2, Row 3 Column 3
Row 4 Column 1, Row 4 Column 2, Row 4 Column 3
```

---


### Convert Among Formats Using `tr "<old delimiter>" "<new delimiter>"`

```bash
# view contents of csv
$ less -S ../data/Pacifici2013_data.csv 

# replace semicolons with commas using tr [find] [replace]
$ cat ../data/Pacifici2013_data.csv | tr “;” “,” | less –S

# view as tsv
# \t is the nearly universal symbol for tab
$ cat ../data/Pacifici2013_data.csv | tr ";" "\t" | less -S

```

_`tr` is an abbreviation for translate_

---


### Using `cut` to retrieve/isolate/select columns and `head` to retrieve rows

```bash
# change directory
$ cd ~/CSB/unix/data

# display first line of file (i.e., header of CSV file)
$ head -n 1 Pacifici2013_data.csv

# display first column of file
$ cut -d ";" –f 1 Pacifici2013_data.csv

# display second through fourth columns
$ cut -d ";" -f 2-4 Pacifici2013_data.csv

# display first “cell” of data
$ head -n 1 Pacifici2013_data.csv | cut -d ";" -f 1

```

_Note: cut assumes tab delimited files.  If a different delimiter is used in the file, the `-d` option is used to specify the delimiter.  It is very easy to mistake spaces for tabs, and that will make `cut` do odd things with your data if you do not set `-d " "`_

---


### Connecting `cut` `head` `tail` `sort` `uniq`

```bash
# select 2nd column, display first 5 elements
$ cut -d ";" -f 2 Pacifici2013_data.csv | head -n 5

# select 2nd and 8th columns, display first 3 elements
$ cut -d ";" -f 2,8 Pacifici2013_data.csv | head -n 3

# select 2nd column without header, show 5 first elements
$ cut -d ";" -f 2 Pacifici2013_data.csv | tail -n +2 | head -n 5

# identify the orders in csv
# select 2nd column without header, unique sorted elements
$ cut -d ";" -f 2 Pacifici2013_data.csv | tail -n +2 | sort | uniq

# count how many records per order in csv
$ cut -d ";" -f 2 Pacifici2013_data.csv | tail -n +2 | sort | uniq -c

# output the order with the most records, including the number of records in csv
$ cut -d";" -f2 ../data/Pacifici2013_data.csv |  tail -n +2 | sort | uniq -c | tr -s " " "\t" | cut -f2-3 | sort -n | tail -n1

```

_Note: `uniq` is a command that that removes consecutive duplicate lines (rows). For this reason, the input to `uniq` is almost always sorted beforehand.  Use `man uniq` to see the description of the `-c` option.  I use `uniq -c` all the time._

_Note: `sort -t";"` specifies the delimiter character, also known as a field separator.  Try `man sort` and search `/field` to see the manual entry for this._

_Note: `tr -s` can be used to easily convert files or text streams that have multiple spaces in between columns (such as the output of `uniq -c` into a tab separated format.  The `-s` means squish consecutive charcters to one character_

---

### Advanced Pipelining

When constructing long pipelines like the last one in the code block above, you should build it step by step, testing the output as you go.  This strategy reduces the possibility of making a mistake.

I like to use `less -S` or `head` to capture and view the output when it takes up many lines.  The `q` key closes the `less` viewer.

```
# here is an example of how to build the really long pipe above, from scratch
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | less -S
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | head
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | head
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | uniq -c | less -S
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | uniq -c | tr -s " " "\t" | head
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | uniq -c | tr -s " " "\t" | cut -f2-3 | head
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | uniq -c | tr -s " " "\t" | cut -f2-3 | sort -n | less -S
$ cut -d";" -f2 ../data/Pacifici2013_data.csv | tail -n +2 | sort | uniq -c | tr -s " " "\t" | cut -f2-3 | sort -n | tail -n1
```

</p>
</details>

---

<details><summary>Mind Expander 1.3</summary>
<p>

[Mind Expander 1.3 Form](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOThBNjZNVzlGQUtJUzhYREZVSE5UVVJMNS4u)

</p>
</details>

---

<details><summary>Exercise 1.10.1</summary>
<p>

Complete [Exercise 1.10.1 Next Generation Sequencing Data](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMTVENFg0UjhFTzc3Wkc0NExRTjdLSjdGNi4u) using the commands you've learned and the `grep` command. Please consult the [Unix/Linux Cheat Sheet](../resources/CheatSheetLinux_2022-09-02.pdf). Make sure that you document your work by saving your answers for each question in a text document (use notepad++  or bbedit).  Then when done, copy and paste your answers into the form and submit.  We will review this in class

</p>
</details>

---


## CSB Book Versus Online Materials

While the CSB book is not required, I include this to help those that do use it.

The _*New Material*_ closely follows the book but there is some additional information that is not provided in the book (and vice versa). In the lecture slides, the `code blocks` are represented by green text on a black background, mimicking the terminal.

The material below closely follow the book but there is some additional information that is not provided in the book (and vice versa). If you choose to follow the lecture slides, the `code blocks` are represented by green text on a black background, mimicking the terminal.

* Page 35 **Use _BodyMass.csv_ (slides) rather than _BodyM.csv_ (book)**

* Page 46, the script on the bottom half of the page is poor form. Making a bunch of tmp files is a bad idea.  Do this instead:

```
#!/bin/bash

# to run do this:
# ./ExtractBodyM.sh [infile] [outfile]

# isolate columns 2-6 of csv (first argument) using cut
# translate the ; to “ “ using tr
# remove the header row using tail
# sort by sixth column, descending order
# save to file (second argument)

# isolate columns 2-6 of csv (first argument) using cut
cut -d ";" -f 2-6 $1 | \
 # translate the ; to “ “ using tr
	tr ";" " " | \
 # remove the header row using tail
	tail -n+2 | \
 # sort by sixth column, descending order
 # save to file (second argument)
	sort -nrk6 > $2
```

