# Week04 How to use ChatGPT  and   How to use Version Control

### [Assignment 3](../assignments/assignment_3.md) is due at the beginning of this lecture

___

## Computer Preparation

You are expected to start each lecture with your terminal window open and ready to go.

<details><summary>Ubuntu on Windows</summary>
<p>

  * If the Windows Terminal or Ubuntu app are not installed, then follow [these instructions](../resources/README.md)

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


___

## In Class Activities

### I. [Quiz!](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUNU1IUUg4Nzc1SU9KQVNRTVc0TU0xMFI1Sy4u)

---

### II. [Assignment 3](../assignments/assignment_3.md) Triage

We will review your burning questions about the assignment.

---

### III. ChatGPT

Let's use ChatGPT to solve `assignment-02-xc`.  See my [session log with ChatGPT](https://chat.openai.com/share/b6a5adb2-bd6b-4fd6-ab49-d585b2d0bb12)

---

### IV. Version Control

<details><summary>What is version control?</summary>



* A tool to record changes to your files and directory structure
  * additions, deletions, changes, etc

---

  </p>
  </details>

<details><summary>Why use version control?</summary>



* Organize project, especially with multiple people
  * e.g., student, advisor, committee members, collaborators
  * efficient
* Recover old versions of work (undo)
* No need for 10 versions of each of your files

---
</p>
</details>

<details><summary>What is Git?</summary>



`git` is a version control tool and [`GitHub`](https://github.com) is a website that uses `git`.  `git` is popular, free, open source, and [`GitHub`](https://github.com) is a paid service that is free for educational use.  Fun fact, the [person who made linux os](https://en.wikipedia.org/wiki/Linus_Torvalds) created `git` to version control his and others work on linux.  Thus, `git` is in the "DNA" of linux.

![alt text](Week04_files/gitlogo.jpg)
![alt text](Week04_files/githublogo.jpg)

---
</p>
</details>

<details><summary>Schematic diagram of how Git is used</summary>

Git is *distributed* and a full copy of the history of changes resides on every instance of the *repository*

![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/distributedvcs.png)

![alt text](https://miro.medium.com/v2/resize:fit:1386/format:webp/1*pEduJdPky05DeojVGVtPpQ.jpeg)

---
</p>
</details>

<details><summary>Configuring Git</summary>



Viewing your current `git` settings:

```bash
$ git config --list

user.name=Chris Bird
user.email=cbird808@gmail.com
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
```

Updating your user.name, email, etc...

```bash
$ git config --global user.name "Chris Bird"
$ git config --global user.email cbird808@gmail.com
$ git config --global color.ui true
```

---
</p>
</details>

<details><summary>Getting Help with Git</summary>

[ChatGPT](https://chatgpt.com/)

[Google Gemini](https://gemini.google.com/)

[duckduckgo search](https://duckduckgo.com/)

```bash
$ git help
$ man git
```

---
</p>
</details>

<details><summary>Initializing a Local Git Repository</summary>



1. Initializing a repository only needs to be done once.  Any directory (dir) can become a `git` repository (repo). `git` cannot version control if you do not make a dir a repo.  Let us make the `~/CSB/git/sandbox/originspecies` directory a `git` repository:

    ```bash
    # TAMUCC COMP BIO ONLY, Run this line
    $ cd ~/CSB/git/sandbox
    
    # WORKSHOPS ONLY, Run this line
    $ cd sandbox
    
    $ mkdir originspecies
    $ cd originspecies
    $ git init

      Initialized empty git repository in /home/cbird/CSB/git/sandbox/originspecies/.git/
    ```

2. Checking the status of a repo:

    ```bash
    $ git status

    On branch master

    Initial commit

    nothing to commit (create/copy files and use "git add" to track)
    ```

---
</p>
</details>

<details><summary>Making and Tracking Changes In a `git` Repo</summary>



1. Create a file called `origin.txt` in your repo as follows:

    ```bash
    $ echo "An Abstract of an Essay on the Origin of Species and Varieties Through Natural Selection" > origin.txt
    ```

2. View file contents:

    ```bash
    $ cat origin.txt

    An Abstract of an Essay on the Origin of Species and Varieties Through Natural Selection
    ```

    So far, `git` has not tracked anything we did.  We need to tell it to record the changes. `git` will only track the files you tell it to track.

3. Set `origin.txt` for `git` tracking then check the repo status:

    ```bash
    $ git add origin.txt
    $ git status

    On branch master

    No commits yet

    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)

            new file:   origin.txt
    ```

    We have yet to actually save a snapshot of our updates.  You should `git commit` your changes at the end of every session, when you have a working script, or when you can succinctly describe the changes you made.

4. Creating a snapshot of the project:

    ```bash
    $ git commit -m "started the book"

    [master (root-commit) a90fea2] started the book
     1 file changed, 1 insertion(+)
     create mode 100644 origin.txt
    ```

    The `-m` option stands for "message".  The message is there to help you know how this version is different than the previous one should you need to recover an older version in the future.  The message should be short but sufficiently descriptive.

5. Show the repo history:

    ```bash
    $ git log

    commit a90fea2df1a59e635fba3c09a0cc0f1dfe78b2d9   #this number is the fingerprint of the commit
    Author: Chris Bird <cbird808@gmail.com>
    Date:   Fri Sep 27 08:24:34 2019 -0500

        started the book
    ```

---
</p>
</details>

<details><summary>Tracking a Change in a Text Document</summary>



1. Let us change the text in our tracked document

    ```bash
    $ echo "On the Origin of Species, by Means of Natural Selection, or the Preservation of Favoured Races in the Struggle for Life" > origin.txt
    $ git status

    On branch master
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   origin.txt

    no changes added to commit (use "git add" and/or "git commit -a")
    ```

2. Both add and commit need to be executed to update the repo

    ```bash
    $ git add .
    $ git commit -m "Changed the title as suggested by Murray"

    [master 5b762fe] Changed the title as suggested by Murray
     1 file changed, 1 insertion(+), 1 deletion(-)
    ```

3. View the log history again after the commit

```bash
$ git log

commit 5b762fec87bd70db9bdd0d54620b8e4728927a36
Author: Chris Bird <cbird808@gmail.com>
Date:   Fri Sep 27 08:36:22 2019 -0500

Changed the title as suggested by Murray

commit a90fea2df1a59e635fba3c09a0cc0f1dfe78b2d9
Author: Chris Bird <cbird808@gmail.com>
Date:   Fri Sep 27 08:24:34 2019 -0500

started the book
```

    Notice that both commits are logged and each has the "fingerprint" id.

That is the majority of the commands you will use in git: `git add`,  `git commit`

---
</p>
</details>

<details><summary>Git Can Only Track Internal Changes Made to Text Documents</summary>



  It is important to note that `git` is made to track human-readable text files.  A human-readable text file will be readable by your text editor. Files that are binary (`docx`, etc) cannot be tracked by `git` in the same way that text files can.

1. Everybody use your text editor (notepad++ or bbedit) and try to open a MS Word doc

---
</p>
</details>

<details><summary>Showing Changes Since Last Commit</summary>



  We will use the `sed` command to find the ends of lines (represented by `$` in regex) and replace them with a period (represented by `\.` in regex).  The `-i` argument tells `sed` to change the input file rather than outputting a text stream.

  Then use the `git` argument `diff` to show all changes *since the last commit*.  


```bash
$ sed -i 's/$/\./' origin.txt
$ git diff

# now change it back by removing periods at the ends of lines
$ sed -i 's/\.$//' origin.txt
```

  If you do not see any differences, then you did not change the repo by adding a file or changing the text in `origin.txt`

  Note that the previous version is marked with an `a/` and the newer version is labeled `b`/.  The addition and subtraction of files are marked with `+` and `-`

---
</p>
</details>

<details><summary>Moving and Removing Files in a Repo</summary>

you need to tell `git` when you remove or move version controlled files

```bash
$ git mv origin.txt origins.txt
$ git rm *.txt

# note that you can skip git add and go straight to commit after this
$ git commit -m "deleted text files"
$ git log
```

  ---
</p>
</details>

<details><summary>Putting it All Together</summary>

Let us review what we have learned by making a new project in your sandbox and initializing the repo

  ```bash
  $ cd ~/CSB/git/sandbox
  $ rm originspcies
  $ mkdir newproject
  $ cd newproject
  $ git init
  $ git status
  # make changes to repo, then track changes by:
  $ git add --all
  $ git commit -m "my descriptive message"
  ```

---
</p>
</details>

---

### [Mind Expander 2.1](https://forms.office.com/Pages/ResponsePage.aspx?id=8frLNKZngUepylFOslULZlFZdbyVx8RLiPt1GobhHnlUMVJSRE4zRVpFOElBVTUzMTVVNFZBNkRGVy4u)

---

<details><summary> Troubleshooting `git`</summary>

Git can get confused if you are not dilligent in your pattern of adding and comitting changes and it will be neccessary to troublshoot conflicts.

1. Amending an Incomplete Commit

  Incomplete commits can occur when files are not removed within git, changes are made but not added, etc..  The solution is to rectify these conflicts.

    ```bash
    # make file
    $ touch barnacles.txt

    # mistakenly commit changes without adding
    $ git commit -m "added barnacles.txt"

    On branch master
    Untracked files:
            barnacles.txt

    nothing added to commit but untracked files present

    # fix by adding then committing
    $ git add barnacles.txt
    $ git commit -m "added barnacles.txt"
    ```

2. Unstaging Files

  You may have added files to the snapshot staging area by mistake.  To unstage them:
  (do not type this in, it is an example)

    ```bash
    #do not type this into your terminal
    $ git reset HEAD filetounstage.txt
    ```

---
</p>
</details>

<details><summary>Remote Repositories (GitHub)</summary>

1. Cloning a repository:
  ```bash
  git clone ADD_YOUR_HOMEWORK_REPO_LINK_HERE
  ```

2. Move into your repository, change it, add and commit the changes

3. Push changes from local repository back to central repository on GitHub

    ```bash
    git push
    ```

![alt text](https://github.com/tamucc-comp-bio/fall_2019/blob/master/lectures/Week04_files/git_common_commands.png)

---
</p>
</details>


<details><summary>GitHub Repo Philosophy</summary>

* You should be conducting your work in your repo, not somewhere else.
  * If you are doing some things for the project on the supercomputer (or a remote server) you should clone your repo there and run the scripts in/from it.

* Do not change the same document in your repo in different locations at the same time
	* for example, don't edit the readme on GitHub and on your laptop without syncing the changes between them

* Every time you pull up to a computer to work on your repo, `pull` the latest version:

	```
	cd path/to/your/repo
	git pull
	```

* As you make progress during a single session, `add` and `commit` your changes.

* Every time you walk away from a computer after working on your repo,`push` your changes

* When you don't follow this philosophy, your repo will not sync with github, and you'll see errors
	* To solve, "burn it down" and start over.  Make a new repo, and copy the contents of your old repo to the new one.

  ---
  </p>
  </details>

<details><summary>Directory Organization Philosophy</summary>

* Every directory should have a descriptive name

* Every directory should contain a descriptive `README.md`
	* this file is automatically displayed when navigating directories on GitHub.
	* yes, part of the intention here is to discourage you from making too many dirs.  Ask yourself, is this new dir I'm thinking of worth writing a `README.md` for?  The answer is usually no.

* Fewer directories is more (better)

* No "rabbit holes".  
	* A "rabbit hole" is a dir in a dir in a dir in a dir in a...
	* Try to minimize nested directories

  ---
  </p>
  </details>

<details><summary>Large files (>100MB) and `.gitignore`</summary>

If you are working with large files, GitHub will not accept them and it will cause problems with git. You should add large files to the `.gitignore` file.

The `.gitignore` file in the top level of your repo that is a list of files and dirs (wildcards work too) that should not be tracked by `git`. The file is invisible (all files and dirs that start with a `.` are invisible).  To list invisible files, `ls -a`.

This is an example `.gitignore` that includes files created when working with R and RStudio that should not be tracked:

    ```
    # History files
    .Rhistory
    .Rapp.history

    # Session Data files
    .RData
    .RDataTmp

    # User-specific files
    .Ruserdata

    # Example code in package build process
    *-Ex.R

    # Output files from R CMD build
    /*.tar.gz

    # Output files from R CMD check
    /*.Rcheck/

    # RStudio files
    .Rproj.user/

    # produced vignettes
    vignettes/*.html
    vignettes/*.pdf

    # OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
    .httr-oauth

    # knitr and R markdown default cache directories
    *_cache/
    /cache/

    # Temporary files created by R markdown
    *.utf8.md
    *.knit.md

    # R Environment Variables
    .Renviron

    # pkgdown site
    docs/

    # translation temp files
    po/*~

    # RStudio Connect folder
    rsconnect/
    ```

---
</p>
</details>


## EXAM 1  

### Initializing Exam

1. Clone your repository for this exam to your local computer.

	* If you have a Windows computer, then I want you to clone your Exam 1 repo into the windows `Downloads` directory. Here is pseudocode to help you get there in your terminal.

	```bash
	# replace YOUR_WINDOWS_USERNAME with your actual user name
	cd /mnt/c/Users/YOUR_WINDOWS_USERNAME/Downloads
	```

	* If you are unsure of your Win10 user name, hit tab twice after typing in the file path up to `Users/` to see the options.  You could alternatively right click on your `Downloads` folder in the file explorer, select `Properties` and then the `Location` tab to see its file path.  Your Windows user name is the name of the directory that `Downloads` is inside of.

	* If you have a Mac computer, then I want you to clone your Exam 1 repo into your home dir or wherever your want.

	```bash
	cd ~
	```
