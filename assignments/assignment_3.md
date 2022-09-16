# [Assignment 3](https://classroom.github.com/a/q5PkCvK7)

## Due 09/23

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



## GitHub Preparation

* You must be a member of our class's github repository. If you are not a member (because you did not accept the initial invite) then please let me know and I'll reinvite you. 

* Make sure you are logged into github.

## Description of Assignment 

You will be working in bash to manipulate the 3d scans of limpet shells we discussed in class.  

### [Click on this Link to Initiate this Assignment](https://classroom.github.com/a/q5PkCvK7)

* I recommend testing functions and troubleshooting as necessary after each change you make to the script

* You may work in groups but each student must submit their own work.


### To `push` your changes to your repository on GitHub, and thus submit the assigment, do the following

* change directories to the repo for this assignment
* type the following:

```
git add --all
git commit -m "updating my assignment"
git push
```

Note that 
* you can change the `commit` message to whatever you want (the part in quotations, but keep it brief)
* you will have to provide your github username and password for the `push` to `origin master` if you did not set up the ssh key in lecture_0
