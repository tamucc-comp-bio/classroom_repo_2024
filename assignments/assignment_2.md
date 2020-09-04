# Assignment 2 

## Due 09/11

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


## Description of Assignment
Complete Exercieses [1.10.2](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUQldJQTVHMTlYMFVYTkhZSDBZR1A0Q1E2Ny4u) and [1.10.3](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMlpVSUQ0U1hTSFZERDE1WUdZWjRYUlhaWi4u) which you started in class.

### Extra Credit, worth 1 whole assignment (Due 09/11)  I NEED TO UPDATE THIS FOR 2020 CLASS

Complete Exercise 1.10.4 Data Explorer (data from Buzzard *et al.*, 2016), and submit script by updating your repository (see below). You may work in groups but each student must submit their own work.

[Click on this Link to Initiate this Assignment](https://classroom.github.com/a/1id4ZoG_)

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

### To `push` your changes to your repository on GitHub, and thus submit the assigment, do the following

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
