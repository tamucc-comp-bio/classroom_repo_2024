# RESOURCES

This directory contains resources that will help you with your assignments that aren't included with the CSB Text Book.

---

## ssh keys - No more passwords for remote servers and github

If you are here, you're probably wanting to set up an ssh key which allows your laptop to connect to a remote server, like one of our [`high performance computing systems, aka supercomptuers`](https://hpc.tamucc.edu/) or [GitHub](https://github.com). Follow these steps to get it setup

1. Determine if you've already created a key
    
    Run the following commands in your terminal
    ```bash
    cd ~
    ls .ssh
    ```
    
    If you see the following files (or something very similar), you have a key. Goto step 3.
    ```
    id_rsa  id_rsa.pub
    ```
    
    If you don't see a key pair `id_???` and `id_???.pub`, then goto step 2
 
 2. Create a key pair
    
    You only need 1 key pair, so if you *don't* have files named `id_???` and `id_???.pub` in your `~/.ssh` dir, then you need to generate them as follows:
    
    ```bash
    ssh-keygen -t rsa
    ```
    
    If you see the following files (or something very similar), you have a key. Goto step 3.
    ```
    id_rsa  id_rsa.pub
    ```
    
There are some instructions [here](Github_SS)
