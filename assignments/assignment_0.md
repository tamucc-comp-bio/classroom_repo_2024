# Assignment 0 

## Due 09/08

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

We have a steep learning curve to traverse, so we are going to "flip" the classroom next week. Flipping the classroom means that you work on the material to be covered before we address it in lecture.  Then we can spend time in lecture going over the most challenging topics, as identified by you. Then we will continue together in lecture through new material that builds upon this assignment.

Your assignment is to work through [Software Carpentry's The Unix Shell](https://swcarpentry.github.io/shell-novice/) from Introducing the Shell through Working with files and directories.

---

## Download Data for Assignment

You will need to **download the data file for the lesson**.  Copy and paste the following code block into your terminal. _If you are having trouble copying and pasting in Ubuntu on windows, make sure that you are using the [Windows Terminal App](https://docs.microsoft.com/en-us/windows/terminal/install) to run Ubuntu.  You were asked to install the terminal app in the [Week 00 Lecture In Class Exercises](../lectures/lecture00.md). With terminal, copying and pasting should work as you're accustomed to.  For those with Macs, there should be no issues with copying and pasting._

```bash
wget https://swcarpentry.github.io/shell-novice/data/shell-lesson-data.zip
unzip shell-lesson-data.zip
mkdir Desktop
mv shell-lesson-data Desktop
```

In the code above, `wget` is a command to download files with a https web address and `https://swcarpentry.github.io/shell-novice/data/shell-lesson-data.zip` is the web address of the data file.  Notice that it is zipped.  You can use the `unzip` command to unzip it.  Once you have executed the commands above, the data will be in your present directory in the directory named `shell-lesson-data`. The last two lines will make your directory have the same structure as assumed in the lesson.  Those with macs might see an error after `mkdir Desktop`.  That's ok, it just means that the desktop dir was already there. Those with Ubuntu on windows, the `Desktop` dir will be created.  Then for everybody `mv` will move the `shell-lesson-data` dir inside of the `Desktop` dir

---

## Resources to Help You

I highly recommend that you print out the [Linux Cheat Sheet](../resources/CheatSheetLinux_8-12-2016.pdf) which I created for myself and my students when I was learning `bash`.  It's unique because it translates english into `bash`.

---

## Hints and Addiitions to The Unix Shell Lesson

### 1. [Introducing the Shell](https://swcarpentry.github.io/shell-novice/01-intro/index.html)

Nothing to note

### 2. [Navigating Files and Directories](https://swcarpentry.github.io/shell-novice/02-filedir/index.html)

* use `ctrl+l` keystroke to clear the terminal (those with macs, try `command+l`).  that's a lower case `L`
* my favorite `ls` flags, aka options
  * `ls -ltrh` list all file details (`l`) with human readable file sizes (`h`) in reverse (`r`) chronological order (`t`)
  * `ls -lh`  list all file details (`l`) with human readable file sizes (`h`)
  * `ls -lhd */` list all file details (`l`) with human readable file sizes (`h`), but only directories (`d`) not files
  * I've never used the `-F` flag, frankly you don't need it
* those with Ubuntu running in windows won't have a `Desktop` dir unless you follow the data download instructions above. 
* realize that you will have your own home directory with your username.  It won't be named `nelle`

### 3. [Working With Files and Directories](https://swcarpentry.github.io/shell-novice/03-create/index.html)

* realize that the orange boxes don't always pertain to the directory structure in you lesson data.  For example, the 2nd one (Moving Files to a new folder) does not refer to our directory structure, but rather a hypothetical directory structure on Jamie's computer.  Who's Jamie?  idk

---

## Self Check on Assignment 0

If you did everything correctly, then the directory structure of your `shell-lesson-data` directory should look like that below.

You probably need to install `tree` as follows:

```
#mac 
sudo brew install tree

#ubuntu
sudo apt install tree
```

Then you can create your assignment directory tree with the following command and argument:
```bash
tree ~/Desktop/shell-lesson-data
```

![](assignment_0_answer.png)


