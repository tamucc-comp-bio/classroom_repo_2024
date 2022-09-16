# Week03 UNIX III - Beyond the CSB Text Book

### [Assignment 2](../assignments/assignment_2.md) is due at the beginning of this lecture

<!-- 
### [Lecture Stream]() 
-->

---


## Computer Preparation

You are expected to start each lecture with your terminal window open and ready to go.

<details><summary>Ubuntu on Windows</summary>
<p>

  * If the Windows Terminal or Ubuntu app are not installed, then follow [these instructions](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/README.md)
  
  * Open an Ubuntu window in Windows Terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._ After logging in, You are in your home directory. 
     
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

  
<details><summary>If it's not already there, clone the CSB repository to your home dir</summary>
<p>

We will use the [open source files that accompany the CSB text book](https://github.com/tamucc-comp-bio-2022/CSB) in lectures and assignments.

If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the [`CSB` repository](https://github.com/tamucc-comp-bio-2022/CSB) into your home directory:

1. Open a terminal window
	* For Win laptops, use `Windows Terminal` to open Ubunutu.  
	* For Mac laptops, open your `Terminal`.
	
2. Run the code line by line in the code block below 
```bash
# check that you're in home dir, you should be there when you log in
pwd

# if you are not in your home dir, then move there
cd ~

# if pwd does not return `/home/yourusername` then let Dr. Bird know
pwd

# clone the CSB repository to your home dir
git clone git@github.com:tamucc-comp-bio-2022/CSB.git
```

The repository is named CSB, and it contains all of the example files and directories necessary to conduct the exercises in the text book.

</p>
</details>


---


# In Class Activities

## [I. Quiz](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUNEpSWTVNREU0N1IxUDNLU0tPMVYyUkpSRC4u)

## II. Review of What We Have Learned
<details><summary>Click to expand</summary>
<p>

1. There are several commands for navigating and manipulating a computer file directory.  I made a [linux cheat sheet](../resources/CheatSheetLinux_2022-09-02.pdf) for students learning to use linux that you can print out on a single double sided sheet of paper and use as a desk reference. 
	  * `cd`    change directories
	  * `pwd`   where am I?
	  * `ls`    show contents of `pwd`
	  * `cp`    copy files and directories from one location to another, could also rename copied file
	  * `mv`    move files and directories from one location to another, rename file or directories
	  * `rm`    delete file or dir, be careful, there is no undo
	  * `mkdir` make new directory, will not overwrite existing dir
	  * `less`  view a file without opening all of it, good for large files
	  * `nano`  word processor, edit text files
	  * `chmod` change file and dir permissions

2. Each command has *options* and accepts *arguments* to modify functionality and which can be viewed in the manual
	  * `man`   show manual for command
	  * `_command_ -h` if man does not work, this could show manual for command
	  * command` --help` another way to display manual
	  * command   another way to display manual
	  * use web browser to search on *bash command man*
	  * example of argument: `ls data` will return the file and contents of directory in pwd that are named *data* if they exist
	  * example of option:  `ls -ltrh` will return all files in `pwd` with details, in reverse chronological order with human-readable file sizes

3. Locations of files and dirs can be specified using absolute or relative *paths* and these *paths* are used by the majority of commands because most commands manipulate files and dirs

	  * `/`     root dir, top dir in directory tree
	  * `~`     home dir
	  * `-`     last directory your were in before the `pwd`
	  * `../`   parent directory, one directory up the tree from `pwd`
	  * `../../` 2 directories up the tree from `pwd`
	  * `./`    present working directory

4. Wildcards can be used to specify several files with one word or path

	* `*` can be any character
	* example: `ls *.txt` will list all files ending in `.txt` 

5. There are several commands we have learned that are important for manipulating biological data.

	* `echo`  prints text or converts text and the contents of variables into a text stream
	* `head`  returns only first few lines of a file, or remove last lines (rows)
	* `tail`  returns only last few lines of a file, or remove first lines (rows)
	  * `cut`   returns specified columns
	  * `cat`   combines files together by line (row)
	  * `uniq`  removes duplicates
	  * `sort`  changes the order of rows by column
	  * `grep`  returns lines (rows) that match a pattern
	  * `tr`    replaces one character with another, usually column delimiters (aka field separators)
	  * `wc`    count words, characters, lines, etc

6. Unix commands are designed to pipe `|` and redirect `>` text streams to construct pipelines that link commands and create new files
	  * `|`     takes standard output (*stdout*) from one command and pipes it to another command as *stdin*
	  * `>`     redirects *stdout* into a file of your naming, will overwrite existing file
	  * `>>`    redirects *stdout* into a file of your naming, will append existing file

7. The escape character `\ ` changes the meaning of the character that follows, including end of lines
	  * at the end of a line, it means do not end line and continue on next line
	  * `\t`   is a tab, but not all commands recognize this
	  * `\n`   is a line feed (*LF*), the unix end of line character (usually invisible)
	  * `\r`   is a carriage return (*CR*), in windows every line concludes with CRLF, and causes compatibility issues with unix/linux/mac 
	  * there are MANY more uses of `\ `

8. We can assign values to variables
	  ```bash
	  VARIABLE=1375
	  ```

9. We have learned how to use unix commands within a line of code to return a value with `$()` 

	  ```bash
	  VARIABLE=$(echo 1375)
	  cat <(ls *)
	  FILES=$(ls *)
	  ```

10. Repetative tasks can be automated using `for` loops

	  ```bash
	  for i in $VARIABLE; do
		echo $i
	  done
	  ```

11. Many lines of commands can be stored in file (script) and executed sequentially

	  ```
	  bash script.sh
	  ```

	  Each "pipe line" is like a sentence in English.  It can stand on its own.  It tells the computer to do something and output the result.  The script will be composed of several pipelines.
	  

12. Values can be passed into a script by listing them as argumnents which are stored sequentially into variables: `$1`, `$2`, `$3`, etc
	```
	# run script with the argument "../data.txt" 
	bash script.sh ../data.txt
	```
	
	The argument `../data.txt` is represented by `$1` inside script
	
	```
	#!/bin/bash
	
	InFilePath=$1
	
	cat $inFilePath
	```

---

</p>
</details>


## III. Additional Important Unix Commands and Intro to Regular Expressions for Pattern Matching

<details><summary>Click to expand</summary>
<p>

Let us all move to our `~/CSB/unix/sandbox` and copy the Marra and Dalziel data to the `sandbox` if it is not already there.
  ```bash
  $ cd ~/CSB/unix/sandbox
  $ cp ../data/Marra2014_data.fasta .
  $ cp ../../python/data/Dalziel2016_data.csv .
  $ less -S Marra2014_data.fasta
  
  >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh
  ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTCAAAGTCAGCTCAAGCAAGAGATTTG
  TTTACAATTAACCCACAAAAGGCTGTTACTGAAGGTGTGGCTTAAGTGTCAGAGCAACAG
  CTATGAGTGGAGGAATTTTCTATTACAATATAATTTCATCTCTGGTAAATTGACCAATTA
  ACTGGAACTTTTTCCAACTGAAATAAATGGTAAACTTTTTATCCACCATTCTGCCATCTG
  ACTCACAAAGACCCATGGGAATGGGTGATGAAATCCAACATGCTTCTTTGTAGCAAAAAT
  AAATAAAATCCCCAGAAGGGTGAGGTAAATGGAAAACTCCAAACTCGCCCCTCAGGTGGG
  TGTAATTTACCCAAGTCTGAGAGGAGGCAGAGTTTTTCCCAATGGACTTTGGTTAAGTGA
  GATATGCTGGTCTGTAGAAGGAGGGAGTTCTAGGAAAACAGACACTTAAGTAGGGCCGAA
  CTAAAAATTGTATCAGTCAGATCTTCATGTGAAGTCCTGTGTGCCCA
  
  # use q to exit less
  ```

This is an interleaved FASTA file.  Interleaved means that a single squence is spread across multiple lines, it make data manipulation difficult and there are tools to convert between an interleaved and non-interleaved format (but that is too specific right now).

---

### [`paste`](https://ss64.com/bash/paste.html) is used for combining files and text objects by *columns* or converting a file with one column into a file with several columns
  
  Paste is very convenient for converting non-tidy data into tidy data.  An example is `Marra2014_data.fasta`.  There is only 1 column and each row contains different types of information about different observational units.  Because there are the same number of lines for each of the first two observational units, the file can be converted to a tidy format which is easier to modify.  
  

  
  ```bash
  # we can use the paste command to take a single column of data and make it multi column
  $ head -n 20 Marra2014_data.fasta | paste - - - - - - - - - - | less -S

  >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh      ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTCAAAGTCAGCTCAAGCAAGAGATTTG    TTTACAATTAACCCACAAAAGGCTGTTAC
  >contig00002  length=551  numreads=8  gene=isogroup00001  status=it_thresh      GAACCATCCTGCGCGGGAAAGATCTAGAAGCTGGCACGTCAAACTGCTGCCGAGTAACGA    CTGTGAAAATACAGAGCAGAACGTACAGG
  ```
  
  ```bash
  # we can also use paste to join files by column, instead of by row (cat)
  # while you would not want to combine these two files, you can:
  $ paste Dalziel2016_data.csv Marra2014_data.fasta | less -S
  ```
  
  ```bash
  biweek,year,loc,cases,pop       >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh
  1,1906,BALTIMORE,NA,526822.1365 ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTCAAAGTCAGCTCAAGCAAGAGATTTG
  2,1906,BALTIMORE,NA,526995.246  TTTACAATTAACCCACAAAAGGCTGTTACTGAAGGTGTGGCTTAAGTGTCAGAGCAACAG
  3,1906,BALTIMORE,NA,527170.1981 CTATGAGTGGAGGAATTTTCTATTACAATATAATTTCATCTCTGGTAAATTGACCAATTA
  4,1906,BALTIMORE,NA,527347.0136 ACTGGAACTTTTTCCAACTGAAATAAATGGTAAACTTTTTATCCACCATTCTGCCATCTG
  5,1906,BALTIMORE,NA,527525.7134 ACTCACAAAGACCCATGGGAATGGGTGATGAAATCCAACATGCTTCTTTGTAGCAAAAAT
  6,1906,BALTIMORE,NA,527706.3183 AAATAAAATCCCCAGAAGGGTGAGGTAAATGGAAAACTCCAAACTCGCCCCTCAGGTGGG
  7,1906,BALTIMORE,NA,527888.849  TGTAATTTACCCAAGTCTGAGAGGAGGCAGAGTTTTTCCCAATGGACTTTGGTTAAGTGA
  8,1906,BALTIMORE,NA,528073.3264 GATATGCTGGTCTGTAGAAGGAGGGAGTTCTAGGAAAACAGACACTTAAGTAGGGCCGAA
  9,1906,BALTIMORE,NA,528259.7712 CTAAAAATTGTATCAGTCAGATCTTCATGTGAAGTCCTGTGTGCCCA
  ```
  
  It is very common to use subshells to pass text streams to `paste` (and `cat`).  When doing this, we use the following syntax `<()`
  
  ```
  paste <(echo Testing) <(echo 1) <(echo 2) <(echo 3)
  
  cat <(echo Testing) <(echo 1) <(echo 2) <(echo 3)
  ```
  


---

## [`sed`](https://ss64.com/bash/sed.html) can be used to find a pattern and replace it with text or a specified pattern

`sed` is a very versatile tool and we will only scratch the surface of what it can do, but 99.9% of the time, you will use it to find and replace text.

### `sed 's/FindThisRegExPattern/ReplaceWithThis/g'`

* the `s` triggers the *search* functionality of `sed`, its essentially an option

* The `/` divides the statement into its component arguments

* The `g` is optional and means *global*.  If present, all pattern matches will be replaced.  If there is no `g`, then only the first match on each line is replaced. See below to observe what happens without the `g`

  ```bash
  # find the first T on each line and replace with @
  $ sed 's/T/@/' Marra2014_data.fasta | head
  >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh
  A@CCTAGCTACTCTGGAGACTGAGGATTGAAGTTCAAAGTCAGCTCAAGCAAGAGATTTG
  @TTACAATTAACCCACAAAAGGCTGTTACTGAAGGTGTGGCTTAAGTGTCAGAGCAACAG
  C@ATGAGTGGAGGAATTTTCTATTACAATATAATTTCATCTCTGGTAAATTGACCAATTA
  AC@GGAACTTTTTCCAACTGAAATAAATGGTAAACTTTTTATCCACCATTCTGCCATCTG
  AC@CACAAAGACCCATGGGAATGGGTGATGAAATCCAACATGCTTCTTTGTAGCAAAAAT
  AAA@AAAATCCCCAGAAGGGTGAGGTAAATGGAAAACTCCAAACTCGCCCCTCAGGTGGG
  @GTAATTTACCCAAGTCTGAGAGGAGGCAGAGTTTTTCCCAATGGACTTTGGTTAAGTGA
  GA@ATGCTGGTCTGTAGAAGGAGGGAGTTCTAGGAAAACAGACACTTAAGTAGGGCCGAA
  C@AAAAATTGTATCAGTCAGATCTTCATGTGAAGTCCTGTGTGCCCA
  
  # find the all T and replace with @
  $ sed 's/T/@/g' Marra2014_data.fasta | head
  >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh
  A@CC@AGC@AC@C@GGAGAC@GAGGA@@GAAG@@CAAAG@CAGC@CAAGCAAGAGA@@@G
  @@@ACAA@@AACCCACAAAAGGC@G@@AC@GAAGG@G@GGC@@AAG@G@CAGAGCAACAG
  C@A@GAG@GGAGGAA@@@@C@A@@ACAA@A@AA@@@CA@C@C@GG@AAA@@GACCAA@@A
  AC@GGAAC@@@@@CCAAC@GAAA@AAA@GG@AAAC@@@@@A@CCACCA@@C@GCCA@C@G
  AC@CACAAAGACCCA@GGGAA@GGG@GA@GAAA@CCAACA@GC@@C@@@G@AGCAAAAA@
  AAA@AAAA@CCCCAGAAGGG@GAGG@AAA@GGAAAAC@CCAAAC@CGCCCC@CAGG@GGG
  @G@AA@@@ACCCAAG@C@GAGAGGAGGCAGAG@@@@@CCCAA@GGAC@@@GG@@AAG@GA
  GA@A@GC@GG@C@G@AGAAGGAGGGAG@@C@AGGAAAACAGACAC@@AAG@AGGGCCGAA
  C@AAAAA@@G@A@CAG@CAGA@C@@CA@G@GAAG@CC@G@G@GCCCA
  ```

---

## Regular Expressions (regex) are sequences of characters that define search patterns.  

There are different regex languages (POSIX, PERL, etc) that have slight differences in the meanings of different characters.  Regex is critical for `grep`, `sed`, and other commands associated with pattern matching and we will learn more regex later in the course.

### `^`     Beginning of line

### `$`     End of line

### `[]`    Any of of the characters inside the square brackets are a match for a single character

### `.`     Any character

### `*`     Any number of repeats of the previous character, including zero  (meaning the absence of the previous character)

### `\ `     Escape character 
  
  ```bash
  # return contig names for either isogroup00001 or isogroup00002 in Marra data
  $ grep 'isogroup0000[12]' Marra2014_data.fasta 
  >contig00001  length=527  numreads=2  gene=isogroup00001  status=it_thresh
  >contig00002  length=551  numreads=8  gene=isogroup00001  status=it_thresh
  >contig00003  length=541  numreads=2  gene=isogroup00001  status=it_thresh
  >contig00004  length=291  numreads=3  gene=isogroup00001  status=it_thresh
  >contig00005  length=580  numreads=12  gene=isogroup00001  status=it_thresh
  >contig00006  length=3288  numreads=35  gene=isogroup00001  status=it_thresh
  >contig00008  length=1119  numreads=10  gene=isogroup00001  status=it_thresh
  >contig00010  length=202  numreads=4  gene=isogroup00001  status=it_thresh
  >contig00011  length=5563  numreads=61  gene=isogroup00001  status=it_thresh
  ```

  ```bash
  # return lines that begin with A
  $ grep '^A' Marra2014_data.fasta 
  ATCCTAGCTACTCTGGAGACTGAGGATTGAAGTTCAAAGTCAGCTCAAGCAAGAGATTTG
  ACTGGAACTTTTTCCAACTGAAATAAATGGTAAACTTTTTATCCACCATTCTGCCATCTG
  ACTCACAAAGACCCATGGGAATGGGTGATGAAATCCAACATGCTTCTTTGTAGCAAAAAT
  AAATAAAATCCCCAGAAGGGTGAGGTAAATGGAAAACTCCAAACTCGCCCCTCAGGTGGG
  AGGCGCTCCGTGGTAAAGTACGATCATCACCAATCTACCTATAAGAGAAACAGACTGGCT
  AGGTTCCCCGGGGTGCCCGGCCCCACCACGTATGTGCACTCCGACTTCTCTGCAAACTTC
  ```

---


## Basic addition and subtraction

We need to tell `bash` that we are asking for arithmetic by wrapping the equation with `$(())`.  No spaces should be used.

  ```bash
  # addition
  X=$((1+1))
  echo $X
  
  # subtraction
  Y=$((10-5))
  echo $Y
  
  echo $((1+11-2))
  
  ```

---

## Decision logic with if-then-else statements

We can program a computer to make decisions.  

* If something is true, then do "this", otherwise do "that".  

* If X is true, then do Y; else if Z is true, then do W; else if A is true, then do B

If-then statements have a standard multiline architecture with a distinct beginning (`if`) and end (`fi`) and internal spacing matters. There are no optional internal spaces, they are required where you see them

In a script, it is a good practice to indent the code between `if`, `else`, and `fi`

```bash
if [ 1 == 2 ]; then                # if 1 equals 2 then
  echo 1 does equal 2               # print "1 does equal 2" to screen
else                               # if 1 does not equal 2 then
  echo 1 does not equal 2          # print "1 does not equal 2" to screen
fi                                 # end of if statement
```
  
In the if-then statement, the square brackets denote the condition to test.  Note that two equals signs are neccessary.  Also note below that we quotified the variables `$A` and `$B`.  I recommend that you consult a web resource when constructing if then statements in bash because the syntax can be tricky and I am not showing everything that is possible here.
  
```bash
A="orangutang"
B=100
if [ "$A" != "$B" ]; then
  echo $A does not equal $B
else
  echo $A does equal $B 
fi  
```

---


## A function allows you to define a new customized command composed of several existing commands

A function is a command that you can define and use in the terminal environment or a script. You should make a function when you find yourself repeatedly using the same code over and over. 

Let us build upon the if-then-else logic in the last section to create a function that decides whether the two arguments passed to it are equal.

* The name of the function is `DECIDER`

* The `()` are there because other languages have the same structure, but they do not do anything

* you *_cannot_* define default input variable values in the parentheses `()`, like you would in `R`

* The code passed to the function is wrapped in curly brackets `{}`

* everything else is just `bash` code

Note that a function treats "arguments" just like a script.  The first argument becomes `$1`, the second `$2`, etc. It is good practice to convert the variables containing arguments into variables with more meaningful names in the first lines of the function. 

Also note the indenting to make code readable and signify hierarchy

```bash
DECIDER(){
A=$1
B=$2
if [ "$A" != "$B" ]; then
  echo $A does not equal $B
else
  echo $A does equal $B 
fi 
}
  ```

After you enter the function, nothing will happen, but it has been stored into memory and can now be used.

```bash
DECIDER 1 2
  ```

---

</p>
</details>


## IV. Real World Application of Skills Learned: Fisheries-Induced Evolution

My lab has been studying the evolution of limpets in Hawaii.  They are a local delicacy and are under intense harvesting pressure.  We are interested in the selective pressures applied by overharvesting and how it affects the evolution of phenotypes.  

We found that shell surface area is associateD with human harvesting and want to use 3d scans of the limpet shells to more precisely test of effects of harvesting on phenotype. Here are some views of a 3d scan:

![alt text](Week03_files/3Dscan_limpetShell.PNG) ![alt text](Week03_files/3Dscan_limpetShell_left.PNG) ![alt text](Week03_files/3Dscan_limpetShell_right.PNG) ![alt text](Week03_files/3Dscan_limpetShell_top.PNG) ![alt text](Week03_files/3Dscan_limpetShell_bottom.PNG)

#### [Related Publication from my Research Group](https://onlinelibrary.wiley.com/doi/abs/10.1111/jbi.13845?af=R)

The images above are rendered 3d scans, but the data file is in [STL](https://en.wikipedia.org/wiki/STL_%28file_format%29) format.  An stl file is obtuse and not the easiest for a human to read.  Consequently, a tool to extract information from stl files, [admesh](https://admesh.readthedocs.io/en/latest/#), was created as a master's thesis.  I found this program and used it to extract the surface areas of the shells.  I did also have to manipulate the stl files and clip off the bottom surface covering the shell aperature using a bash tool that I made.  

The output of admesh is not tidy and I had to make a tool to tame it, `admesh2tabdelimited`. I'll show you how this works and then you'll edit it for homework.

#### Clone the [LimpetShell Evolution repo](https://github.com/tamucc-comp-bio/LimpetShellEvolution) to your home dir
```bash
cd ~
git clone https://github.com/tamucc-comp-bio/LimpetShellEvolution.git
```

### important: delete the `LimpetShellEvolution` repo we cloned in class before doing the homework. For the home work, you will clone your homework repo, which is very similar to `LimpetShellEvolution`, to your computer and complete you work there.

```
cd ~
rm -rf LimpetShellEvolution
```

---


## HOMEWORK
[Assignment 3  Due 9/23](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_3.md)

