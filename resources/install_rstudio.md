# Installing R Studio

It is important that you keep R Studio up to date on your computer.  If you do not, you will start to run into compatibility issues.  Also note that there are many versions of RStudio.  We are going to use "RStudio Desktop Open Source Edition".  It is free.

_Note: you will not be installing R Studio on Ubuntu. If you have a Windows computer, you'll be working in windows._

<details><summary>Installing RStudio on Windows</summary>
<p>

<details><summary>Install `R`</summary>
<p>

[You can find R install instructions here](../resources/install_r.md). If you have a windows computer, you will need to separately install `R` in the windows environment even if you already installed it in Ubuntu. 

---
</p>
</details>

<details><summary>Install `R Studio`</summary>
Regardless of your operating system, if you have not already installed R studio, you need to do that now.  On windows computers, install R studio in Windows.  

*If you installed R Studio a while ago, you should do it again to upate to the latest version.*

[RStudio Install](https://www.rstudio.com/products/rstudio/download/)

Make sure you install "RStudio Desktop Open Source Edition".  An install package will be downloaded to your computer and then you double click that file to install.

---
</p>
</details>

<details><summary>Clone CSB Repo to Your Windows Home Dir</summary>

Just to make things a little more tricky, if you have windows, it is not easy to access the `CSB` repo that you cloned to your home directory in Ubuntu from RStudio. So, we have to clone the repo again, but this time to the `Downloads` dir inside your windows home dir.

Open your ubuntu terminal and navigate to your windows `Downloads` directory, then clone the CSB repo to there.

```bash
# make sure you are in ubuntu
cd /mnt/c/Users/YourWinUserName/Downloads
git clone git@github.com:tamucc-comp-bio-2022/CSB.git
```

---
</p>
</details>


