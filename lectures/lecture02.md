# Week02 UNIX II

### [Assignment 1](https://github.com/tamucc-comp-bio-2020/classroom_repo/blob/master/assignments/assignment_1.md) is due at the beginning of this lecture

## [Lecture 02 Slides](Week02_files/Lecture02_WelcomeToTheMatrix.pdf)

## Computer Preparation

You are expected to start each lecture with your terminal window open and ready to go.

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
    
</p>
</details>


## Text Book Vs. Lecture Slides

<details><summary>click to expand</summary>
<p>

The [**Lecture_02 Slides**](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Lecture02_WelcomeToTheMatrix.pdf) closely follow the book but there is some additional information that is not provided in the book (and vice versa). In the lecture slides, the `code blocks` are represented by green text on a black background, mimicking the terminal.

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

</p>
</details>

## New Material To Be Covered Prior to Lecture (CSB Section 1.6.3 - 1.6.7) 

For the online version of this course, I am converting the ppt slides to a more screen-splitting friendly format here in GitHub.

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

[Link](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlURVhQUzBWODVKR0VJTTE2WjlZN05ZTjhMRi4u)

</p>
</details>

<details><summary>Scripting</summary>
<p>

See the lecture 2 slides and chapter 1 for this material

### What are [scripts](https://en.wikipedia.org/wiki/Scripting_language)?

A script is a file with a list of commands which are executed sequentially from the first line to the last.

In lecture 0, we installed [xming](https://sourceforge.net/projects/xming/) on windows computers.  You need to have [xming](https://sourceforge.net/projects/xming/) turned on for the next commands to work in Ubuntu on windows computers.  

```bash
# create and open ExtractBodyM.sh in CLI text editor
$ nano ExtractBodyM.sh

# ctrl + x to save and exit, then "y" to use the existing name, then "enter key"

# If you have Ubuntu, make sure that you have xming turned on
# open ExtractBodyM.sh in GUI text editor.  If this does not work, then use the nano command above
$ gedit ExtractBodyM.sh

# If you have Mac
# open ExtractBodyM.sh in GUI text editor.  If this does not work, then use the nano command above
$ open –a bbedit ExtractBodyM.sh
# or
$ open ExtractBodyM.sh
```

Either type in or copy and paste the pipeline we made previously to make `BodyMass.csv` into `ExtractBodyM.sh`:

```bash
cut -d ";" -f 2-6 ../data/Pacifici2013_data.csv | tr ";" " " | tail -n+2 | sort -nrk6 > BodyMass.csv
```

The script should look like this:

![](Week02_files/nano_screen_1.png)

Close the script `ctrl + x` then run it as follows:

```bash
# run ExtractBodyM.sh script
$ bash ExtractBodyM.sh

# view directory
$ ls –ltrh

# Open script again
$ nano ExtractBodyM.sh
```

---

### Documenting your script appropriately

* It is important to write comments in English to describe what the script is doing

  * You’ll forget what the code does
  
  * Makes it easier for others to figure out what is happening in the script
  
  * Easier to identify errors

Add the following comments to the script before the code using nano

```bash
# isolate columns 2-6 of csv using cut
# translate the ; to “ “ using tr
# remove the header row using tail
# sort by sixth column, descending order
# save to file
```

Your screen in `nano` should look like this:

![](Week02_files/nano_screen_2.png)

To save changes made in nano without closing: `ctrl + o`, then `enter`.  Do not change the name of the script

---

### Organizing the script

It can be a good idea to try to limit a script to 1 command per line to improve its readability.

Now, let us organize the script so that each pipe in the pipeline occurs on one line by adding the escape character `\ ` after each pipe `|` and hitting enter. The `\ ` tells `bash` to ignore the end of the line.  When complete, your screen should look like this:

![](Week02_files/nano_screen_3.png)

Now that each command is on one line, we can reorganize the comments to occur immediately before the correct line, as follows:

![](Week02_files/nano_screen_4.png)

_Note: `ctrl + k` will delete a line in `nano`_


---

### Indenting consistently

Indentation is a key to writing readable code.  Because we are continuing the same pipe, it is a good idea to indent the subsequent lines in the pipe, as follows:

![](Week02_files/nano_screen_5.png)

---

### Accepting arguments from the command line

It is easy to write a script that accepts arguments when run from the command line.  Recall that an argument is a word or number that is passed to a command.  The first argument after a script or command is saved into a variable called `$1` automatically. A second argument is saved to `$2`, so on and so forth.  

Let us make our script accept a path to the input file and a path to the output file rather than [hard coding](https://en.wikipedia.org/wiki/Hard_coding) the input and output files. We do this by replacing the input `../data/Pacifici2013_data.csv` and output file paths `BodyMass.csv` with `$1` and `$2`, respectively. Do not forget to add to the documentation, and describe how the script should be run:

![](Week02_files/nano_screen_6.png)

Do not forget to save your work with `ctrl + o`.

_Note: all variables are preceded by a `$`.  Avoid creating variables named 1, 2, etc because they could interfere with arguments read in from the command line._

---

### Running the script

Close `nano` with `ctrl + x`, then let us run the script.

```bash
# run ExtractBodyM.sh script
$ bash ExtractBodyM.sh ../data/Pacifici2013_data.csv BodyM.csv
```

---

### Making script "executable"

You can always run a bash script using `bash scriptname`, but you can also make the script executable so that you do not need to call `bash` to run the script.  The permissions need to be changed with `chmod`. Here we will give all users read, write, and execute priviledges. 

```bash
# change permissions so script is executable
$ chmod 777 ExtractBodyM.sh

# open script to add shebang!
$ nano ExtractBodyM.sh
```

Then, we need to add a [shebang!](https://en.wikipedia.org/wiki/Shebang_(Unix)) `#!`to the script. A shebang! tells the computer which program to run the script with, is always preceded by a `#!` and should be on the first line of the script.

![](Week02_files/nano_screen_7.png)

Close `nano` and now you run the script as follows:

```bash
./ExtractBodyM.sh ../data/Pacifici2013_data.csv BodyM.csv
```

---

</p>
</details>


<details><summary>For Loops</summary>
<p>

### `for [variableName] in [list]; do [something]; done` 

* For loops automate repetitive tasks

  * 1 task, 100 files
  
  * Same task, many different arguments


```bash
$ cd ~/CSB/unix/data/miRNA
$ ls

# display first two lines of two fastas ( do not type in the > )
$ for file in ggo_miR.fasta hsa_miR.fasta
> do head -n 2 $file
> done
```

Let us break down the multiline `for` loop above.  

  * Line 1: `file` is the variable name.  
  
    * We could have named it anything but the CSB book uses `file`.  
	
    * I prefer to use `i`.  
  
  * Line 1: `ggo_miR.fasta hsa_miR.fasta` is the list
  
    * A list of file names
  
    * A list can also be the name of a file with a list inside of it
	
	* Or, a list can be a sequence of numbers, e.g. `seq 1 10`

  * Line 2: `head -n2 $file` is the command
  
    * return the first two lines of the file specified in `$file`
	
	* on the first cycle of the loop, `$file` is `ggo_miR.fasta`
	
  * Line 3: `done` tells the code to loop back to line 1 and make `file=hsa_miR.fasta`
  
    * The loop continues cycling until the whole list is complete.
	
	* this loop cycles twice because there are two file names in the list
	

Let us make a longer list of files using a wildcard

```bash
# display first two lines of all fastas
$ for i in *.fasta
> do head -n 2 $i
> done

```

_Note: When setting a variable equal to a value, don’t use a `$`. When calling the value held in the variable, use a `$`_

---

### Another `for` loop example

In the following for loop, we use a for loop to extract three types of microRNA from all of the `fasta` files and save them into 1 file per type of miRNA.

```bash
# display first two lines of two fastas
$ for miR in miR-208a miR-564 miR-3170
> do grep $miR -A1 *.fasta > $miR.fasta
> done
```

![](Week02_files/forloop.png)

---

</p>
</details>


<details><summary>Tips & Tricks</summary>
<p>

### The `$PATH`

* A variable that holds all paths to directories where executable commands and scripts are located

* When you type `ls`, `bash` looks at `$PATH` to find the `ls` command file

* If you compile and install software manually (not with `apt`), you need to move it to a `$PATH` dir such as `/usr/local/bin`


```bash
# show path variable
$ echo $PATH

# identify the path to the ls command
$ which ls
/bin/ls
```

---

### Line Terminators - Use a Real Text Editor to View

* There are invisible characters at the end of every line in a text document

  * Carriage Return (CR or `\r`)
  
  * Line Feed (LF  or `\n`)
  
* Unix, Linux, Mac systems end lines with `LF`

* Win systems end lines with `CR LF`

* Make sure your remove CR from files made in Windows that will be used in Linux

* This is one of many reasons why we use a Notepad++ or BBedit

Showing line terminators in `Notepad ++`

![](Week02_files/line_terminators.png)

Finding CR and replacing with nothing in `Notepad ++`

![](Week02_files/line_terminators2.png)

---

### Misc Useful Commands

Note that some of these commands need to be installed on MacOS using `brew`

![](Week02_files/misc_useful_commands.png)

![](Week02_files/misc_useful_commands2.png)

</p>
</details>


## In Class Exercises
Complete the exercise(s) by answering the question(s) in the online form and submitting.  You must be logged into your TAMUCC email account to have your identity attached to your answers. 

You may work in groups, but each person must fill out the online answer form.

The exercises in the online forms closely follow those in the book.  I do make minor modifications and provide tips in the online form.  To ensure that your work is saved, **_I highly recommend that you first record your answers in a text document in either Notepad++ or BBedit and save them to your computer_**.  For an excellently formatted example, see the solutions provided by the book in `CSB/unix/solutions`. 

* [Exercise 1.10.2 Hormone Levels in Baboons](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUQldJQTVHMTlYMFVYTkhZSDBZR1A0Q1E2Ny4u)

* [Exercise 1.10.3 Plant-Pollinator Networks](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMlpVSUQ0U1hTSFZERDE1WUdZWjRYUlhaWi4u)

## Homework NEED TO UPDATE
* [Assignment_2, Due 09/20](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_2.md)

