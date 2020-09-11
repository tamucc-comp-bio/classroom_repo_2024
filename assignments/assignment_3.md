# [Assignment 3](https://classroom.github.com/a/GzvR1gG5)

## Due 09/18

## Computer Preparation

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


## GitHub Preparation

* You must be a member of our class's github repository. If you are not a member (because you did not accept the initial invite) then please let me know and I'll reinvite you. 

* Make sure you are logged into github.

## Description of Assignment (Due 09/18)

You will be working in bash to manipulate the 3d scans of limpet shells we discussed in class.  

### [Click on this Link to Initiate this Assignment](https://classroom.github.com/a/GzvR1gG5)

* I recommend testing function and troubleshooting as necessary after each change you make to the script

* You may work in groups but each student must submit their own work.


### To `push` your changes to your repository on GitHub, and thus submit the assigment, do the following

* change directories to the directory for this assignment
* type the following:
```
git add *
git commit -m "updating my assignment"
git push origin master
```

Note that 
* you can change the `commit` message to whatever you want (the part in quotations, but keep it brief
* you will have to provide your github username and password for the `push` to `origin master`
