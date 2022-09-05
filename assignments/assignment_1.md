# Assignment 1 

## Due 09/09

## Computer Preparation

<details><summary>Ubuntu on Windows</summary>
<p>

  * If the Ubuntu app is not installed, then follow [these instructions](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/README.md)
  
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._ After logging in, You are in your home directory. 
     
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
  
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```
  * It's always a good idea to keep your apps in `Ubuntu` up to date. _The first time you do this, it could take a long time to finish. After that, if you do this when you log in, it should go quickly._
    ```bash
    sudo apt update
    sudo apt upgrade
    ```
    

</p>
</details>

<details><summary>MacOS</summary>
<p>
 
  * Open a terminal window
  
  * If you haven't already, install [homebrew](https://brew.sh/).  You will be able to use homebrew to install linux software, such as `tree`, which is used in the slide show.
  

</p>
</details>


## Description of Assignment

We are also going to flip the classroom next week. Flipping the classroom means that you work on the material to be covered before we address it in lecture. Then we can spend time in lecture going over the most challenging topics, as identified by you. Then we will continue together in lecture through new material that builds upon this assignment.

Work through the remainder of [lecture 1](../lectures/lecture01.md).  To help you learn `bash`, you are expected to type in or copy and paste the commands in the

```
code blocks
```

Complete [Mindexpander 01.02](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOUo2UVRUMVgwTUlQMlpUQzUzOTIzME9LNi4u) by answering the question(s) in the online form and submitting.  You must be logged into your TAMUCC email account to have your identity attached to your answers. 

* **_You can resubmit your answers as neccessary_**

* **_I highly recommend that you first record your answers in a text document in either [Notepad++ for Win](https://notepad-plus-plus.org/downloads/) or [BBedit for Mac](https://www.barebones.com/products/bbedit/) and save them to your computer_**. 


## New Material To Be Covered Prior to Next Lecture  

1. Complete the [Pipes & Filters](https://swcarpentry.github.io/shell-novice/04-pipefilter/index.html) tutorial on sofware carpentry

2. Complete the [Finding Things](https://swcarpentry.github.io/shell-novice/07-find/index.html) tutorial on sofware carpentry

Work through the following tutorial

<details><summary>Advanced `bash` Commands</summary>
<p>

### Download Required Data from Dryad

Download data from Saavedra, Serguei; Stouffer, Daniel B. (2013) "Disentangling nestedness".  It's in [datadryad.org](https://datadryad.org).

```bash
# If you haven't yet, move to your home dir and create a `comp_bio` dir with an `assignment_01` dir inside of it
cd ~
mkdir -p comp_bio/assignment_01/data

# Move to the data dir you just made
cd ~/comp_bio/assignment_01/data

# Download the data from datadryad.org
# I searched datadryad.org for Saavedra 2013, and copied the download link
wget https://datadryad.org/stash/downloads/file_stream/52937 -O saavedra2013.zip
unzip unzip saavedra2013.zip

wget https://datadryad.org/stash/downloads/file_stream/52938 -O readme.txt

# move to the `assignment_01` dir
cd ~/comp_bio/assignment_01

```

---

### Redirection of output ([stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout))) to file `[command] > filename`
### Append [stdout](https://en.wikipedia.org/wiki/Standard_streams#Standard_output_(stdout)) to file `[command] >> filename` 
### Redirect contents of file to [stdin](https://en.wikipedia.org/wiki/Standard_streams#Standard_input_(stdin)) `[command] < filename` 

```bash
# let’s start by moving to our sandbox
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

A machine provides you with thousands of data files. There’s so many, it is breaking your file browser. How many files are there?

We will use the dir `assignment_01/data/networks` as an example of a directory with many files, but not quite thousands.

```bash
# start by moving to your assignment dir if you are not already there
$ cd ~/comp_bio/assignment_01

# save file names in the Saavedra 2013 networks dir to file in the present working directory
$ ls ./data/networks > filelist.txt

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

How many network files are there in Saavedra 2013?

```bash
# list file names
$ ls ./data/networks

# list file names and pipe into wc
$ ls ./data/networks | wc -l
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
  
* File extensions not always accurate, so it is important to view a file to be sure of the delimiter.

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

TSV File with tabs denoted by `\t`.  Note your text files will not contain `\t`.  I did this show where tabs were, versus spaces.
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

### Using `cut` to retrieve columns and `head` to retrieve rows

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


<details><summary>Mind Expander 1.3</summary>
<p>

[Mind Expander 1.3 Form](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOThBNjZNVzlGQUtJUzhYREZVSE5UVVJMNS4u)

</p>
</details>









<details><summary>Additional Important Commands</summary>
<p>

### Substituting Characters Using 	`tr`
### Predefined Characters `[:upper:]`

`tr` can be used to replace one or more characters

```bash
# change all a to b
$ echo "aaaabbb" | tr "a" "b"
bbbbbbb

# change 1, 2, 3, 4, and 5 to zero
$ echo "123456789" | tr 1-5 0
000006789

# change a, c, t, g to upper case
$ echo "ACtGGcAaTT" | tr actg ACTG
ACTGGCAATT 

# change lower case letters to upper case
$ echo "ACtGGcAaTT" | tr [:lower:] [:upper:]
ACTGGCAATT

# change a, b, or c to 1, 2 ,or 3 repectively
$ echo "aabbccddee" | tr a-c 1-3
112233ddee

# delete all occurrences of a
$ echo "aaaaabbbb" | tr -d a
bbbb

# remove consecutive duplicate occurrences of a
$ echo "aaaaabbbb" | tr -s a
Abbbb

```

_Note: `tr` does not accept a file as an argument, always use pipe `|` or redirect a file into `tr` (`tr " " "," < file.txt`)_

---

### Use `;` to separate multiple independent commands on 1 line

`;` is equivalent to a period in an english sentence.

```bash
# move to sandbox and list files
cd ~/CSB/unix/sandbox; ls
```

---


### Making a New File From An Existing File

Make a new file `BodyMass.csv` in sandbox dir based on columns 2-6 in `Pacifici2013_data.csv`, remove header, sort lines according to body mass (large to small), change ; to spaces

```bash
# 1. View header row to refresh your memory
$ head -n 1 ../data/Pacifici2013_data.csv 
$ head -n 1 ../data/Pacifici2013_data.csv | tr ";" "\n"

# 2. Start building pipe, use head to view
$ cut -d ";" -f2-6 ../data/Pacifici2013_data.csv | head

# 3. Add to pipe by changing ; to tabs, use head to view
$ cut -d ";" -f2-6 ../data/Pacifici2013_data.csv | tr ";" "\t" | head

# 4. Add to pipe by removing first line, figure out sort options, use head to view
$ cut -d ";" -f2-6 ../data/Pacifici2013_data.csv | tr ";" " " | tail -n+2 | sort -nrk6 | head

# 5. Instead of piping to head, redirect output to file named BodyMass.csv
$ cut -d ";" -f2-6 ../data/Pacifici2013_data.csv | tr ";" " " | tail -n+2 | sort -nrk6 > BodyMass.csv
```

_Note: in step 1, we use `tr` to replace semicolons `;` with "[line feeds](https://en.wikipedia.org/wiki/Newline)" `\n` to view one column header per line._

_`\ ` is the "[escape character](https://en.wikipedia.org/wiki/Escape_character)".  What follows the `\ ` has an alternate meaning._
  * `t` is the letter "t", `\t` is a [metacharacter](https://en.wikipedia.org/wiki/Metacharacter) that symbolizes a tab
  * `n` is the letter "n", `\n` is a metacharacter that symbolizes the end of a line (aka line feed)

---

### [Wildcards](https://en.wikipedia.org/wiki/Wildcard_character) are Symbols that Represent Multiple Characters

`*` Matches zero or more characters, except "leading dot"

`?` Matches any single character, except "leading dot"

`[]` match any one of the characters in the brackets


```bash
# goto miRNA dir inside data dir
$ cd ~/CSB/unix/data/miRNA

# list all files that end with fasta 
$ ls *fasta

# count the numbers of lines in all the fasta files
$ wc -l *fasta

# print the first two lines of each file whose name starts with pp
$ head -n 2 pp*

# determine the type of every file that has an extension with exactly three letters
$ file *.???

# list all files begining with either g, h, or m and ending with fasta
ls [ghm]*fasta

```

_Note: in unix and linux, hidden files are marked by a "leading dot" `.`.  Try `ls -a` to see all files, including those that are hidden.  Wildcards will not return hidden files without being preceded by a `.` _

---

### Selecting lines with matching pattern using `grep [options] [pattern] <filename>` 

* Every line that matches the pattern is returned

  * there are options that allow more specific output, such as a word rather than a line

* Many options to increase functionality. I use `grep` all the time.

* [Regular Expressions](https://en.wikipedia.org/wiki/Regular_expression), aka regex, are used for pattern matching in text files

  * A language of characters, metacharacters, wildcards
  
  * 2 primary syntaxes or standards: [POSIX](https://en.wikipedia.org/wiki/POSIX) (default in `grep`), [Perl](https://en.wikipedia.org/wiki/Perl) (use `-P` option in `grep`)
  
    * when searching for help on regex, it is important to know which standard the pattern is using because POSIX is not the same a Perl


```bash
# goto unix chapter sandbox
$ cd ~/CSB/unix/sandbox

# how many wombats (fam Vombatidae)?
$ grep "Vombatidae" BodyMass.csv
$ grep -c "Vombatidae" BodyMass.csv

# which cattle are in file?
$ grep "Bos" BodyMass.csv

# Only match whole words
$ grep -w "Bos" BodyMass.csv

# Only match whole words and only return the words that match, rather than the lines
$ grep -wo "Bos" BodyMass.csv

# Make search case insensitive
$ grep –i "Bos" BodyMass.csv

# which mammals have body weight most similar to the gorilla?
# option –B lines before match, option –A lines after match
$ grep -B 2 -A 2 "Gorilla gorilla" BodyMass.csv

# show line number of gorilla
$ grep -n "Gorilla gorilla" BodyMass.csv

# -v means match anything except pattern
$ grep Gorilla BodyMass.csv | grep -v gorilla

# return all lines with Gorilla or Pan, note use of escape char \
$ grep -w "Gorilla\|Pan" BodyMass.csv

# return all lines with Gorilla for all files in data dir and its subdirs. -r recursive, searches subdirs
$ grep -r "Gorilla" ../data

```

_Note: the `grep -c` option is very handy for counting and can negate the need for `wc -l` _

---

### Searching for files with `find [dir] [options] [pattern]` 


```bash
# current directory is the unix sandbox
$ find ../data

# how many files are in data?
$ find ../data | wc -l

# find file named n30.txt in data
$ find ../data -name "n30.txt"

# use wildcards to find all files in data that contain about
$ find ../data -iname "*about*"

# count all files that end in .txt in data, then do same but do not include subdirs
$ find ../data -name "*.txt" | wc –l
$ find ../data -maxdepth 1 -name "*.txt" | wc –l

# count files in data that do not include about
$ find ../data -not -name "*about*" | wc -l

# find directories with data in path or name
$ find ../data -type d
```

---

### Change Permissions with `chmod [options] ### filename`

* Three types of permissions

  * Read, Write, Execute
  
  * Program will not run if `x` is not set

* Three types of users

  * User, Group, Global

* View with `ls -l`

![](Week01_files/ls-ltrh_3.PNG)

* Setting permissions using “octal” numeric system

  * read = 4
  
  * write = 2
  
  * execute =1
  
  * Simply add numbers together for different combos of permissions

    * if the user has all permissions, 4 + 2 + 1 = 7
  
    * if the group has read permissions, 4
  
    * if the global has no permissions, 0

      * the full set of permissions are then: 740

```bash
# create a file in the unix sandbox
$ touch permissions.txt
$ ls –l

# change permissions so that user can r,w,x; group can r,x; and global can r
$ chmod 754 permissions.txt
$ ls –l

# give everybody full permissions 
$ chmod 777 permissions.txt
$ ls –l

# give yourself full permissions, but only let others read your files 
$ chmod 744 permissions.txt
$ ls –l
```

---

### Super User Do to Execute Command as Administrator: `sudo <command> <options> <arguments>`

* Use `sudo` when computer tells you no.
* Make sure you are certain that you are correct and computer is wrong to not execute your command.
* You will need sudo for installing software


```bash
$ apt update
Reading package lists... Done
E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/
W: Problem unlinking the file /var/cache/apt/pkgcache.bin - RemoveCaches (13: Permission denied)
W: Problem unlinking the file /var/cache/apt/srcpkgcache.bin - RemoveCaches (13: Permission denied)

$ sudo apt update

```

---

### Change Owners With `chown`

The user who creates a file or directory owns that file or directory, but sometimes you will want to transfer ownership (usually to yourself).

```bash
# create a directory with a subdirectory
$ mkdir -p test_dir/test_subdir
$ ls -l 
$ ls -l test_dir

# list valid users
$ cut –d: -f1 /etc/passwd

# change owner of dir, -R includes subdirs
$ chown -R ValidUserName test_dir/
$ sudo chown -R ValidUserName test_dir/
$ ls –l
$ ls –l test_dir

# change owner back to you
$ sudo chown -R $USER test_dir/
```

---



</p>
</details>

<details><summary>Mind Expander 1.4</summary>
<p>

[Mind Expander 1.4 Form](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURVhQUzBWODVKR0VJTTE2WjlZN05ZTjhMRi4u)

</p>
</details>


<details><summary>Exercise 1.10.1 Next Generation Sequencing Data</summary>
<p>

[Exercise 1.10.1 Next Generation Sequencing Data](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMTVENFg0UjhFTzc3Wkc0NExRTjdLSjdGNi4u)

</p>
</details>




## Text Book Versus Online Materials

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



