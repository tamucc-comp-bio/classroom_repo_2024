# Week01 UNIX

### [Assignment 0](https://github.com/tamucc-comp-bio-2020/classroom_repo/blob/master/assignments/assignment_0.md) is due at the beginning of this lecture

## [Lecture 01 Slides](Week01_files/Lecture01_WelcomeToTheMatrix.pdf)

## Computer Preparation

You are expected to start each lecture with your terminal window open and ready to go.

<details><summary>Win10</summary>
<p>

  * If the Ubuntu app is not installed, then follow [these instructions](https://github.com/cbirdlab/wlsUBUNTU_settings/blob/master/InstallLinuxOnWindows_Automated.pdf)
  
  * Log into your Ubuntu terminal.  _We will not use `gitbash` unless you can't get Ubuntu running._ After logging in, You are in your home directory. 
  
  * If you are using an Ubuntu terminal that hasn't been setup (you'll know because it will ask you to create a new user name and password) or you notice odd cursor behavior when editing text in the terminal, then run the following code:
  
    ```bash
    git clone https://github.com/cbirdlab/wlsUBUNTU_settings.git
    . ./wlsUBUNTU_settings/updateSettings.bash
    rm -rf wlsUBUNTU_settings
    ```
    
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
  
  * Consider installing [homebrew](https://brew.sh/).  You will be able to use homebrew to install linux software, such as `tree`, which is used in the slide show.
  
  * If the `CSB` directory does not exist in your home directory (check with `ls`), then run the following code to clone the `CSB` repository into your home directory:
  
    ```bash
    git clone https://github.com/CSB-book/CSB.git
    ```
    
</p>
</details>


## Text Book Vs. Lecture Slides

<details><summary> </summary>
<p>

* The [**Lecture_01 Slides**](Week01_files/Lecture01_WelcomeToTheMatrix.pdf) closely follow the book but there is some additional information that is not provided in the book (and vice versa). In the lecture slides, the `code blocks` are represented by green text on a black background, mimicking the terminal.

</p>
</details>


## Lecture: Unix, Linux, & CLI

For the online version of this course, I am converting the ppt slides to a more screen-splitting friendly format here in GitHub.

<details><summary>Introduction</summary>
<p>

### [Linux](https://en.wikipedia.org/wiki/Linux) is a Free & Open Source Version of the [UNIX](https://en.wikipedia.org/wiki/Unix) Operating System

![Common Operating Systems](Week01_files/os.png)

* An [operating system](https://en.wikipedia.org/wiki/Operating_system) is the primary interface between you and the computer

* [Open source](https://en.wikipedia.org/wiki/Open_source) is a decentralized development model where all aspects of a project are viewable and generally free to use

* Linux is free

  * [Supercomputers](https://en.wikipedia.org/wiki/Supercomputer) typically use it

  * Useful text manipulation tools

---

### The 2 Primary Methods of Interfacing with Computers

#### 1. Graphical User Interface ([GUI](https://en.wikipedia.org/wiki/Graphical_user_interface))

A mouse or you finger is used to interface with images on a screen.

![](Week01_files/mouse.png)

![](Week01_files/gui.png)


#### 2. Command-line Interface ([CLI](https://en.wikipedia.org/wiki/Command-line_interface))

A keyboard is used to type commands into the computer and computer gives feedback on the screen.

![](Week01_files/keyboard.png)

![](Week01_files/cli.png)

---

### Why use CLI Linux?

![](Week01_files/morpheus.png)

* Free

* Automation

* Flexibility

* Powerful

* Designed for developers

* Supercomputers use it

* Many software tools for biologists

* Large body of support online

---

### The [UNIX Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy)

![](Week01_files/unixguys.png)
![](Week01_files/unixphilosophy.png)

![](Week01_files/pipeline.png)

* One program ([command](https://en.wikipedia.org/wiki/List_of_Unix_commands)) does one thing

* All programs accept input as a text stream and output a modified [text stream](https://en.wikipedia.org/wiki/Standard_streams)

* Programs can be linked together into serial [pipelines](https://en.wikipedia.org/wiki/Pipeline_(Unix)) to achieve complex results

---

### Documentation of Linux CLI Pipelines Facilitate Scientific Reproducibility and Long-Term Efficiency

Comparison of GUI and CLI for manipulating data

![](Week01_files/guiVScli.png)

---


</p>
</details>

<details><summary>Interactive Session</summary>
<p>

### Open A Terminal Window

![](Week01_files/open_ubuntu-terminal.png)

![](Week01_files/open_mac-terminal.png)

</p>
</details>







* There were no in class exercises this week. CSB Mind Expanders 01.01 & 01.02 were completed prior to class in [Assignment_0](https://github.com/tamucc-comp-bio-2020/classroom_repo/blob/master/assignments/assignment_0.md)

<!-- 

## HOMEWORK
* [Assignment_1, Due 09/13](https://github.com/tamucc-comp-bio/fall_2019/blob/master/assignments/assignment_1.md)
* [Graduate Student Course Project Ideas, Due 09/13](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUOUo2UVRUMVgwTUlQMlpUQzUzOTIzME9LNi4u)

-->
