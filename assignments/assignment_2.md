# Assignment 2 

## Due 09/16

---

## Computer Preparation

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

  
<details><summary>Clone the CSB repository to your home dir</summary>
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
## Description of Assignment

In Software Carpentry, complete The [Unix Shell Sections 5-7](https://swcarpentry.github.io/shell-novice/)

Then, complete the exercise(s) below by answering the question(s) in the online form and submitting.  You must be logged into your TAMUCC email account to have your identity attached to your answers. 

You may work in groups, but each person must fill out the online answer form.

The exercises in the online forms closely follow those in the book.  I do make minor modifications and provide tips in the online form.  To ensure that your work is saved, **_I highly recommend that you first record your answers in a text document in either Notepad++ or BBedit and save them to your computer_**.  For an excellently formatted example, see the solutions provided by the book in `CSB/unix/solutions`. 

* [Exercise 1.10.2 Hormone Levels in Baboons](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUQldJQTVHMTlYMFVYTkhZSDBZR1A0Q1E2Ny4u)

* [Exercise 1.10.3 Plant-Pollinator Networks](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMlpVSUQ0U1hTSFZERDE1WUdZWjRYUlhaWi4u)


### Extra Credit, worth 1 whole assignment (Due 09/16)  

Complete Exercise 1.10.4 Data Explorer (data from Buzzard *et al.*, 2016), and submit script by updating your repository (see below). You may work in groups but each student must submit their own work.

[Click on this Link to Initiate this Assignment](https://classroom.github.com/a/TOdLhvcV)

Hints:

* Start by cloning this repository to your computer

* **_I highly recommend that you create your script in a text document in either Notepad++ or BBedit_**.  

* Make a copy of the `Buzzard2015_pseudo.md` document and a give it a new name as requested in the exercise or of your choosing.  It should end with an `.sh`

  * "Comment" the pseudo code using `#`
  
* Add a shebang!

* Use your terminal to play in this repository and construct/troubleshoot code

* Copy and paste working code into your script in your text editor

* I have noticed that the Win10-Ubuntu terminal does not like when you copy properly formatted code with leading tabs and spaces from your script in the text editor and paste it at the command line

  * You can, however, copy and paste the lines without the leading tabs and spaces
  
  * You can also create the script in the terminal using `nano` and paste in your properly formatted code to then run the script
  
    * _*Win10 only*_, it is critical that you do not modify files in your Ubuntu directory structure with Win10
	  * You can, however, move to your Win10 directory structure from the Win10-Ubunutu terminal and manipulate files as you wish `cd /mnt/c/Users/YOURUSERNAME`

### To `push` your changes to your repository on GitHub, and thus *_submit the assigment_*, do the following

* change directories to the directory for this assignment

* type the following:

	```
	git add *
	git commit -m "updating my assignment"
	git push origin master
	```

Note that 
* you can change the `commit` message `"updating my assignment"` to whatever you want (the part in quotations, but keep it brief

* you will have to provide your github username and password for the `push` to `origin master`
