# Lecture 13: Scientific Computing, Ch 6

> [!NOTE]
> [Lecture Stream]()
> Passcode: TBA

> [!IMPORTANT]
> Assignment 12 is due the last day of classes

---

## Computer Preparation

<details><summary>Windows, Mac, Linux</summary>
<p>

- [ ] Step 0. Open Terminal

  > Search for the terminal app and open it.  For Windows, make sure you are using Ubuntu.

  > You should have already prepared your computer during Lecture 0.  If you did not then:  

  > * Complete the tasks listed in the [How to Set Up Your Computer for Computational Biology](https://github.com/tamucc-comp-bio/how_to/blob/main/howto_setup_computer.md), up to, but not including R and RStudio.
  >    * If you are having difficulty installing ubuntu, use Launch if your account is activated.

- [ ] Step 1. Update Your apps

  > It's always a good idea to keep your apps in your terminal up to date. 
  
  > For Ubuntu (Linux), enter the following commands to load the newest versions of your apps

  ```bash
  sudo apt update
  sudo apt upgrade
  ```

  > For Mac (Homebrew), enter the following commands to load the newest versions of your apps

  ```bash
  brew update
  brew upgrade
  ```

- [ ] Step 2. Confirm you have cloned the CSB (Computing Skills For Biologists) Repo into your home dir

    > In your terminal, enter the following commands:

    ```bash
    # make sure you're in your home dir
    cd ~
    
    # list the directories and files in the CSB dir to confirm it's in your home dir
    ls CSB
    ```

    > You should see the following output because we cloned the CSB Repo to your home dir in [Lecture 0](https://github.com/tamucc-comp-bio/classroom_repo_2024/blob/master/lectures/lecture00.md).  

    ```bash
    LICENSE  README.md  data_wrangling  git  good_code  latex  python  r  regex  scientific  sql  unix
    ```

    > If you see the output above, you're done! Goto the next section.

- [ ] Step 3. If you didn't have the CSB Repo, clone it now

  > If you **do not** see the output above, then clone the CSB repo by entering the following commands:

    ```bash
        git clone https://github.com/CSB-book/CSB.git
    ``` 

  > You should see the following output:

    ```bash
    Cloning into 'CSB'...
    remote: Enumerating objects: 1005, done.
    remote: Total 1005 (delta 0), reused 0 (delta 0), pack-reused 1005 (from 1)
    Receiving objects: 100% (1005/1005), 26.68 MiB | 7.74 MiB/s, done.
    Resolving deltas: 100% (389/389), done.
    ```

  > Goto Step 2 above.

<hr style="height: 0.1px; border: none; background-color: black;">

</p>
</details>

<details><summary>ChromeOS, iOS, Android</summary>
<p>

 - [ ] Step 0. [Log Into Launch HPC](https://portal-launch.hprc.tamu.edu/)

    > Use the following [link](https://portal-launch.hprc.tamu.edu/) to log in 

    > You should have already created your account during Lecture 0.  If you did not then:  
    > * Complete the tasks listed in the [Accessing Launch Instructions](https://hprc.tamu.edu/kb/User-Guides/Launch/Access/#no-ssh-login)

 - [ ] Step 1. Open Terminal

    > Select `launch Shell Access`

 - [ ] Step 2. Confirm you have cloned the CSB (Computing Skills For Biologists) Repo into your home dir

  > In your terminal, enter the following commands:

    ```bash
    # make sure you're in your home dir
    cd ~

    # list the directories and files in the CSB dir to confirm it's in your home dir
    ls CSB
    ```

  > You should see the following output because we cloned the CSB Repo to your home dir in [Lecture 0](https://github.com/tamucc-comp-bio/classroom_repo_2024/blob/master/lectures/lecture00.md).  

    ```bash
    LICENSE  README.md  data_wrangling  git  good_code  latex  python  r  regex  scientific  sql  unix
    ```

  > If you see the output above, you're done! Goto the next section.

- [ ] Step 3. If you didn't have the CSB Repo, clone it now

  > If you **do not** see the output above, then clone the CSB repo by entering the following commands:

    ```bash
        git clone https://github.com/CSB-book/CSB.git
    ``` 

  > You should see the following output:

    ```bash
    Cloning into 'CSB'...
    remote: Enumerating objects: 1005, done.
    remote: Total 1005 (delta 0), reused 0 (delta 0), pack-reused 1005 (from 1)
    Receiving objects: 100% (1005/1005), 26.68 MiB | 7.74 MiB/s, done.
    Resolving deltas: 100% (389/389), done.
    ```

  > Goto Step 2 above.

 </p>
</details>


<details><summary>Install Miniconda</summary>
 <p>
	[how_to/install_conda.md](https://github.com/tamucc-comp-bio/how_to/blob/main/install_conda.md)
 </p>
</details>


___


## I. Review: Python Problem Solving 101

* Think through problem
* Break down complex tasks into simple steps
* Write steps in english as comments
* Trouble shoot with subset of large data sets
* Use packages (like `os` and `csv`)
* Use reference materials (book, google search, stack exchange, etc)

___

## II. Lecture Activities

While we will not completely cover this whole chapter, you may want to review all of it if you are using python in your research.  It reviews `numpy`, `scipy`, `pandas`, and `biopython`.  

These are packages that extend the functionality of `python`, making it easier to perform common data manipulation, visualization, and analysis tasks.

* *NumPy*: adds vector and matrix data structures
* *SciPy*: adds algebra, integration, differential equations, stats, and simulations
* *Pandas*: manipulation, analysis, and visualization of data sets
* *Biopython8*: bioinformatics, connection to biological databases

---

### Importance of using `conda` Environments

I have stressed the importance of using `conda` in conjunction with `python`.  

The diversity of Python libraries often leads to version conflicts or dependency issues when working on multiple projects. This is where environments, such as those provided by `conda`, become essential. Using environments when working with Python is not just a best practice; it’s a necessity for efficient, reproducible, and conflict-free project management. They empower you to focus on your code and analyses instead of troubleshooting software compatibility issues.

* **Dependency Management:** Each project may require different versions of Python or specific libraries. For example, one project might rely on Biopython 1.8, while another needs the latest version of Pandas. Using environments, you can ensure each project has access to only the tools and dependencies it requires, avoiding conflicts.

* **Isolation:** Environments isolate the libraries of one project from another. This means you can work on different projects with completely different requirements on the same system without interference.

* **Reproducibility:** By creating and exporting an environment file, you can share the exact setup with collaborators. This ensures that they can replicate your work seamlessly, which is a cornerstone of good scientific practice.

* **Stability for Long-Term Projects:** Over time, library updates may introduce changes or deprecate functions you rely on. An environment locks in the versions of your libraries, allowing you to revisit old projects without compatibility issues.

* **Ease of Use:** Tools like Miniconda make creating and managing environments simple. You can quickly set up a fresh environment tailored to your needs and even clone or modify existing ones with minimal effort.

---

### Create an Environment for Today's Lecture

As an example of how to use environments, we will make and use an environment in `conda` explicitly for today's lecture activities.

You can create a new environment with `conda` in the `bash` terminal

```bash
(base) cbird@xps13plus:~$ conda create -n comp_bio_lecture_13
```

```bash
Channels:
 - defaults
Platform: linux-64
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cbird/miniconda3/envs/comp_bio_lecture_13



Proceed ([y]/n)? y
```

```bash
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate comp_bio_lecture_13
#
# To deactivate an active environment, use
#
#     $ conda deactivate
```

You can change between environments using `conda activate` and `conda deactivate`

```bash
(base) cbird@xps13plus:~$ conda activate comp_bio_lecture_13
```

```bash
(comp_bio_lecture_13) cbird@xps13plus:~$
```

> [!NOTE]
> The present `conda` environment is listed prior to your command prompt `(comp_bio_lecture_13)`

```bash
(comp_bio_lecture_13) cbird@xps13plus:~$ conda deactivate
(base) cbird@xps13plus:~$ conda activate
(base) cbird@xps13plus:~$ conda activate comp_bio_lecture_13
(comp_bio_lecture_13) cbird@xps13plus:~$
```

### Installation of Packages

The are installation details in `~/CSB/scientific/installation`.  You can also consult the official [python package installation tutorial](https://packaging.python.org/tutorials/installing-packages/)

I did the following in the bash shell to install biopython, given that we should all have anaconda:

```bash
cd ~
# list installed packages
conda list

# list numpy scipy pandas biopython
conda list | grep 'numpy\|scipy\|pandas\|biopython'

# I had numpy, scipy, and pandas
# to install biopython
conda install biopython

```

Confirm installation of biopython in python3 terminal

```python
>>> from Bio import Entrez
>>>
```

You can also update packages that are already installed.

```bash
# if you want to update a package
conda update pandas

```

___

### Numpy Arrays (Ch 6.2)

NumPy and SciPy are typically used in concert and imported together.  Here we will start by importing `NumPy` and name it `np`

```python
>>> import numpy as np
```

`NumPy` provides an `array` data structure.  An array can be one or more dimensions

* 1d: vector
* 2d: matrix
* 3d or more: tensor

`np.arrange()` can be used to create a 1d array that is similar to a list

```python
>>> a = np.arange(9)
>>> a
array([0, 1, 2, 3, 4, 5, 6, 7, 8])
```

___

### Arrays are Different Than Lists

While arrays look superficially similar to lists, they behave very differently when used in arithmetic expressions:

```python
# list
>>> al = list(range(9))
>>> al
[0, 1, 2, 3, 4, 5, 6, 7, 8]
>>> al * 2
[0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7, 8]

#array
>>> a * 2
array([ 0,  2,  4,  6,  8, 10, 12, 14, 16])

>>> 2 + a
array([ 2,  3,  4,  5,  6,  7,  8,  9, 10])

# you cannot add 2 to a list
>>> 2 + al
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'int' and 'list'
```

___


### Array Methods

Arrays have many attributes and methods.  Here are some:

```python
# length along each dimension
>>> a.shape
(9,)

# number of dimensions
>>> a.ndim
1

# data type of content
>>> a.dtype.name
'int64'

# number of elements
>>> a.size
9
>>>
```

Here are some examples of arithmetic and statistical methods associated with arrays

```python
>>> a.sum()
36
>>> a.mean()
4.0
>>> a.std()
2.581988897471611
>>> a.min()
0
>>> a.max()
8
>>>
```

Here are some examples of arithmetic and statistical NumPy methods that can be applied to arrays

```python
# sqrt each number in array
>>> np.sqrt(a)
array([0.        , 1.        , 1.41421356, 1.73205081, 2.        ,
       2.23606798, 2.44948974, 2.64575131, 2.82842712])

# e^ each number in an array, where e is the constant 2.718...
>>> np.exp(a)
array([1.00000000e+00, 2.71828183e+00, 7.38905610e+00, 2.00855369e+01,
       5.45981500e+01, 1.48413159e+02, 4.03428793e+02, 1.09663316e+03,
       2.98095799e+03])
>>>
```

___


### Convert Other Data Structures To Arrays with NumPy

```python
# convert list to one-dimensional array (aka a vector)
>>> a1 = np.array([1, 2, 3, 4])
>>> print(a1)
[1 2 3 4]
>>> a1.dtype.name
'int64'

>>> a1 = np.array([1.0, 2.0, 3.0, 4.0])
>>> print(a1)
[1. 2. 3. 4.]
>>> a1.dtype.name
'float64'

# convert a list of lists into a 2d array (aka a matrix)
>>> m = np.array([[1, 2], [3, 4]])
>>> m
array([[1, 2],
       [3, 4]])

# specify the data type in the 2d array
>>> m = np.array([[1, 2], [3, 4]], dtype = float)
>>> print(m)
[[1. 2.]
 [3. 4.]]
>>>
```

___


### Arrays can be created, or initialized with set properties

```python
# create 3x2 array filled with 0.0 (floating-point)
>>> m.dtype.name
'float64'
>>> m = np.zeros((3, 2), dtype = float)
>>> m
array([[0., 0.],
       [0., 0.],
       [0., 0.]])
>>>

# create 2x3 array filled with 1+0i (complex numbers)
>>> m = np.ones((2, 3), dtype = complex)
>>> m
array([[1.+0.j, 1.+0.j, 1.+0.j],
       [1.+0.j, 1.+0.j, 1.+0.j]])
>>>

# create an array containing the integers from 0 to 8 and arrange it in a 3x3 array
>>> a = np.arange(9)
>>> a.reshape((3,3))
array([[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8]])
>>>

# create an array with random values drawn from uniform distribution U[0,1]
>>> np.random.random((2, 3))
array([[0.75076835, 0.91614084, 0.81553323],
       [0.34772304, 0.8271986 , 0.46484672]])
>>>
```

___


### Array Elements & Indexing

The elements of arrays are indexed, just like lists, allowing you to interact with specific values in the array

```python
>>> a
array([0, 1, 2, 3, 4, 5, 6, 7, 8])
>>> a[1]
1
>>> a[:4]
array([0, 1, 2, 3])
>>> a[-3:]
array([6, 7, 8])
>>>
```

___


### Working With 2D Arrays (a.k.a. Matrices)

Here is an example with a 2d array

```python
#create 2d array
>>> m = np.arange(16).reshape((4, 4))
>>> m
array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11],
       [12, 13, 14, 15]])

# extract submatrix
>>> m[0:3, 1:4]
array([[ 1,  2,  3],
       [ 5,  6,  7],
       [ 9, 10, 11]])

# this is the second row
>>> m[1]
array([4, 5, 6, 7])

# this is the second column, you need the colon (:) which represents all rows
>>> m[:, 1]
array([ 1,  5,  9, 13])
>>>
```

___

### Matrix Math

With 2d arrays arithmetic functions can be applied by row or column

```python
# sum whole matrix
>>> m.sum()
120

# sum by column
>>> m.sum(axis = 0)
array([24, 28, 32, 36])

# sum by row
>>> m.sum(axis = 1)
array([ 6, 22, 38, 54])
>>>
```

___


### Read In Data From File With NumPy

The `NumPy` function `loadtxt` can be used to read in data from a file, such as a csv

```python
# this is pseudocode, do not type it in
m = np.loadtxt("my_matrix_file.csv", delimiter = ",")
```

As always, you can use the help function to learn more about other functions, such as `loadtxt`
```python
>>> help(np.loadtxt)
Help on function loadtxt in module numpy:

loadtxt(fname, dtype=<class 'float'>, comments='#', delimiter=None, converters=None, skiprows=0, usecols=None, unpack=False, ndmin=0, encoding='bytes', max_rows=None)
    Load data from a text file.

    Each row in the text file must have the same number of values.

    Parameters
    ----------
    fname : file, str, or pathlib.Path
        File, filename, or generator to read.  If the filename extension is
        ``.gz`` or ``.bz2``, the file is first decompressed. Note that
        generators should return byte strings for Python 3k.
    dtype : data-type, optional
        Data-type of the resulting array; default: float.  If this is a
        structured data-type, the resulting array will be 1-dimensional, and
        each row will be interpreted as an element of the array.  In this
        case, the number of columns used must match the number of fields in
        the data-type.
    comments : str or sequence of str, optional
        The characters or list of characters used to indicate the start of a
        comment. None implies no comments. For backwards compatibility, byte
        strings will be decoded as 'latin1'. The default is '#'.
```

`q` to exit the help

___


### Example: Image processing with NumPy

[Kacsoh et al. (2013)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3760715/) investigated a behavioral immune response
in Drosophila melanogaster. Female flies lay their eggs in alcohol-laden food when confronted with parasitic wasps so that their offspring are protected from infection by the wasps. This change in oviposition behavior is mediated by neuropeptide F (NPF) and its receptor (NPFRl) in fly brains. Coupled to a reporter gene, NPF and NPFRl can be visualized by confocal microscopy.

![](Week13_files/fruitflies.jpg)

_Fig 1. D. melanogaster medicates offspring with alcohol after exposure to wasps. (A) Standard oviposition preference setup. (B) Proportion eggs laid on 6% ethanol dishes for three wasp treatments, at two time points. ***P < 0.001. (C) Proportion eggs laid on dishes with increasing ethanol (EtOH) concentrations, depending on wasp presence. P < 0.001 for distribution comparisons at both time points. (D) Proportion wasp-exposed fly offspring that eclose when laid in cages with different combinations of oviposition dishes. (E) Proportion unexposed offspring that eclose. For (D to E), letters indicate significance groups at P < 0.01. For (B to E), error bars represent 95% confidence intervals (n = 4)._

![](Week13_files/Kacsoh2013_fig2.jpg)

_Fig 2. Sight and NPF signaling control fly ability to sense and respond to wasps. Proportion eggs laid on ethanol dishes by (A) smell and sight mutants, (B) NPF and NPFR1 over-expression mutants, and (C) NPF and NPFR1 knockdown mutants in the presence and absence of wasps. For (A to C), y-axis is the same; error bars represent 95% confidence intervals (*P < 0.05, ***P < 0.001, n = 4). (D) NPF immunostain of an unexposed fly brain. * = NPF-expressing neurons, FSB = fan-shaped body, Lat = lateral regions, SEG = subesophageal ganglion, OL = optic lobes. (E to H) NPF immunostained fan-shaped bodies from control and sight mutant flies unexposed or exposed to wasps._

___


### Getting Working Dir and Packages Set Up

Here we use `NumPy` for image processing.  An image is typically stored as a 3d numerical array:  

* height (y)
* width (x)
* color (z)

The color dimension can be composed of Red, Green, and Blue (RGB) with each channel containing an integer between 0 and 255, where 0 is the absence of color and 255 is the fully saturated color.

We will use functions from `NumPy`, 2 image analysis functions from the `scikit-image` library, aka `skimage`
* `io.imread` - reads an image into an array
* `io.imshow` - visualize an image
, and the matplotlib to visualize the images.  

Before we start, you should navigate to the sandbox for this chapter. Exit python with `ctrl-d`

```bash
$ cd ~/CSB/scientific/sandbox
$ python3
```

Windows-unbuntu folks should turn on the windows app, `Xming` for the next lines of code to work.  Recall that we installed this in lecture 0

Now let us start working in python:

```python
>>> import numpy as np
>>> import skimage.io as io
>>> import matplotlib as mpl
```

___

### Read in Image From Kascoh 2013

```python
# read in image, and note that it is an array
>>> image = io.imread("../data/Kacsoh2013_Drosobrain.png")
>>> type(image)
<class 'imageio.core.util.Array'>
```

The image below is the file you just loaded into python.

![](Week13_files/Kacsoh2013_Drosobrain.png)

___


### Viewing Image from Within Python

```python
# load image, this will cause quite a bit of error output
>>> io.imshow(image)
QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-cbird'
failed to get the current screen resources
<matplotlib.image.AxesImage object at 0x7f103b7a6080>
>>> QXcbConnection: XCB error: 170 (Unknown), sequence: 170, resource id: 90, major code: 146 (Unknown), minor code: 20

# hit enter key to move forward
# visualize the image
>>> mpl.pyplot.show()
```

![](Week13_files/Capture.PNG "image 1")

___

### Image Properties

```python
#note the dimensions of the image, the first two numbers represent the height and width, in pixels, respectively
>>> image.shape
(1024, 1024, 4)

# view characteristics of Red color channel
>>> image[:,:,0]
Array([[ 9,  4,  6, ..., 24,  9,  4],
       [21, 10, 10, ..., 16, 20,  6],
       [ 7, 13, 13, ...,  8,  5, 26],
       ...,
       [ 5,  7,  6, ..., 12,  4, 14],
       [ 3, 24,  4, ...,  5, 10,  3],
       [ 9,  8,  8, ..., 11,  9,  6]], dtype=uint8)
>>> red = image[:,:,0]
>>> red.mean()
23.1810245513916
>>> red.std()
30.44674082199301
>>> red.min()
0
>>> red.max()
255
>>>

# green color channel
>>> green = image[:,:,1]
>>> green.mean()
0.0

```

The images only contain red coloration because of the filters on the confocal microscope.

___

### Counting Red Pixels

We can count the number of red pixels, ie those exhibiting NPF and NPFR1 expression. While there are sophisticated methods to determine the background of an image, here we take the simplest approach and choose an arbitrary threshold of 100 (i.e., intensities below 100 are considered noise, all pixels with a value above this threshold are considered "red" or "expressed"). We can visually inspect how this threshold compares to the rest of the image by setting a part of our picture to 100:

```python
# create a copy of the image
>>> img_copy = image.copy()
# use Python slicing to change color values of part of the red channel in the image
>>> img_copy[:, 480:500, 0] = 100
>>> io.imshow(img_copy)
<matplotlib.image.AxesImage object at 0x7f103b7a6d30>
>>> mpl.pyplot.show()
```

![alt text](Week13_files/Capture2.PNG "image 2")

We now create a new array where we select only pixels that exceed the threshold, and then count their number:

```python
>>> threshold = 100
>>> mask = red > threshold
>>> mask.sum()
37037
>>> io.imshow(mask)
<matplotlib.image.AxesImage object at 0x7f103b7c31d0>
>>> mpl.pyplot.show()
```

There are 37,037 pixels above the threshold and that the expression of NPF and NPFR1 is spatially localized

![alt text](Week13_files/Capture3.PNG "image 3")

Using the mask (i.e., setting every pixel to either 0 or 1), we lost the information on the intensity of individual pixels (i.e., strength of expression signal). However, we can show the pixels above the threshold along with their intensity by calling

```python
>>> mask2 = red * (red > threshold)
>>> mask2.sum()
4855070
>>> io.imshow(mask2)
<matplotlib.image.AxesImage object at 0x7f103b7a6630>
>>> mpl.pyplot.show()
```

![alt text](Week13_files/Capture4.PNG "image 4")

We have developed a quantitative measure of NPF/NPFR1 expression from confocal images and this can now be easily automated and applied to many images.  This could be used to compare expression in different treatments.

___


## 6.3 Working with `pandas`

`pandas` is the Python Data Analysis Library, introducing a data structure similar to the data frame in R. `pandas` provides two main data structures: 
* _Series_, meant to store a one-dimensional array, and 
* _DataFrame_, which contains data organized in rows and columns, as in a spreadsheet. 
The data stored in a Series are all of the same type; in a Data Frame, each column can be of a different type. `pandas` provides useful functions to manipulate data sets, calculate statistics, and plot results.

___

### Read in CSV as Data Frame with Pandas

For our testing, we are going to import a . csv file containing a "plumage score" for male and female birds of several species. The method and the data are from Dale et al. (2015). Using pandas, we are going to import the file (start Jupyter from your `~CSB/scientific/sandbox` directory):

```python
>>> import pandas
>>> import numpy as np
>>> data = pandas.read_csv("../data/Dale2015_data.csv")
```

This function creates a DataFrame object, made of rows and columns.
You can specify the delimiter ( e.g., sep = ";" for semicolon), change the text encoding (e.g., encoding = "latin1"), etc. The function `pandas.read_excel` allows you to import Excel files directly into Python. 

___

### Attributes and Methods of Data Frame

Use the attribute shape to determine the numbers of rows and columns of the Data Frame:

```python
>>> data.shape
(5831, 5)
```

To see the first few rows in your data set, use the method head. Equivalently, tail returns the last few lines. To access the names of the columns, type:

```python
>>> data.columns
Index(['Scientific_name', 'English_name', 'TipLabel', 'Female_plumage_score',
       'Male_plumage_score'],
      dtype='object')
>>>
```

which returns an Index object with the column labels. 

___

### Add Column To Data Frame

You can combine columns to create new columns:

```python
>>> data["Sum_scores"] = data["Female_plumage_score"] + data["Male_plumage_score"]
>>> data.head()
            Scientific_name              English_name  ... Male_plumage_score  Sum_scores
0    Abroscopus albogularis      Rufous-faced Warbler  ...          51.944444   97.777778
1    Abroscopus schisticeps       Black-faced Warbler  ...          47.777778   96.666667
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...          43.611111   86.805556
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...          39.166667   78.472222
4       Acanthidops bairdii          Peg-billed Finch  ...          54.166667   94.722222

[5 rows x 6 columns]
>>>
```

You can also create a new column with a single operation:

```python
# add a column with a constant
>>> data["Study"] = 1
>>> data.head()
            Scientific_name              English_name  ... Sum_scores  Study
0    Abroscopus albogularis      Rufous-faced Warbler  ...  97.777778      1
1    Abroscopus schisticeps       Black-faced Warbler  ...  96.666667      1
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...  86.805556      1
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...  78.472222      1
4       Acanthidops bairdii          Peg-billed Finch  ...  94.722222      1

[5 rows x 7 columns]

# use NumPy function to add a column of random numbers
# shape[0] provides the number of rows
>>> data["Rnd"] = np.random.random(data.shape[0])
>>> data.head()
            Scientific_name              English_name  ... Study       Rnd
0    Abroscopus albogularis      Rufous-faced Warbler  ...     1  0.277765
1    Abroscopus schisticeps       Black-faced Warbler  ...     1  0.178028
2  Abroscopus superciliaris    Yellow-bellied Warbler  ...     1  0.558369
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater  ...     1  0.871557
4       Acanthidops bairdii          Peg-billed Finch  ...     1  0.326340

[5 rows x 8 columns]
```

___


### Removing Columns from Data Frame

To remove columns from the data, use `del` or `drop`:

```python
# remove a single column
>>> del(data["Sum_scores"])
>>> data.head()

# remove multiple columns
>>> data.drop(["Rnd", "Study"], axis = 1, inplace = True)
>>> data.head()
```

___

### Selecting Data In Data Frame

A method with option `axis = 1` will act along columns, while `axis = 0` acts along rows. The argument `inplace = True` means that the columns are removed directly and irrevocably from the data.
There are several ways of accessing data in a Data Frame: by column label, row index number, or specific x,y locations:

```python
# select data by column label
# select first three rows of output
# remember: noninclusive, 0-based indexing;
# row "3" is not included!
>>> data["Scientific_name"][:3]
0      Abroscopus albogularis
1      Abroscopus schisticeps
2    Abroscopus superciliaris
Name: Scientific_name, dtype: object

# column names can be specified using a dot
>>> data.Scientific_name[:3]
0      Abroscopus albogularis
1      Abroscopus schisticeps
2    Abroscopus superciliaris
Name: Scientific_name, dtype: object
```

The DataFrame methods loc and iloc select specific rows and columns without chaining multiple selections ( e.g., data[ column] [row] as seen above). While loc uses row and column labels for selection, iloc expects integers that correspond to the positions of rows and columns:

```python
# select rows by index label
# the row named "3" is included!
# select columns by their label
# (multiple labels within list)
>>> data.loc[:3, ["Scientific_name", "English_name"]]
            Scientific_name              English_name
0    Abroscopus albogularis      Rufous-faced Warbler
1    Abroscopus schisticeps       Black-faced Warbler
2  Abroscopus superciliaris    Yellow-bellied Warbler
3  Acanthagenys rufogularis  Spiny-cheeked Honeyeater


# select rows with Scientific_name Zosterops mouroniensis
>>> data.loc[data.Scientific_name == "Zosterops mouroniensis"]
             Scientific_name  ... Male_plumage_score
5801  Zosterops mouroniensis  ...               47.5

[1 rows x 5 columns]


# select subset by x,y position (zero-based!)
# select third row, second column
>>> data.iloc[2, 1]
'Yellow-bellied Warbler'
```

We can even select rows based on only part of the cell content:

```python
# select the column Scientific_name of all rows that
# contain "Bowerbird" in column English_name;
# show first three rows of output
>>> data[data.English_name.str.contains("Bowerbird")]["Scientific_name"][:3]
188      Amblyornis flavifrons
189        Amblyornis inornata
190    Amblyornis macgregoriae
Name: Scientific_name, dtype: object
```

___


### Filtering Data Frame with Pandas

Having shown how to select particular columns, we show how to filter rows based on their content:

```python
# select rows with Male_plumage_score larger than 65
>>> high_male_score = data[data["Male_plumage_score"] > 65]
```

You can also concatenate multiple conditions with Boolean operators; for example, we extract highly sexually dimorphic species by finding those in which males have a high plumage score, and females have a low score:

```python
>>> highly_dimorphic = data[(data.Male_plumage_score > 70) & (data.Female_plumage_score < 40)]
```

___

### Selecting Data to Analyze: View vs Copy of Data

One important feature of pandas is that many commands return a view, as opposed to a copy of the data. A simple example:

```python
>>> high_male_score["Qualitative_score"] = "High"
__main__:1: SettingWithCopyWarning:
A value is trying to be set on a copy of a slice from a DataFrame.
Try using .loc[row_indexer,col_indexer] = value instead

See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy
```

pandas raises a warning because high_male_score is not a new Data Frame, independent of data; rather, it is a view of a "slice" of the original data. While the behavior of this command is what you would expect (the column Qualitative_score is added to high_male_score, but not to data), this is not the correct way to proceed. When you want to take a subset of the data, and separate it from the original data, you need to copy it:

```python
>>> high_male_score = data[data["Male_plumage_score"] > 65].copy()
>>> high_male_score["Qualitative_score"] = "High"
```

The reason behind this behavior is that pandas can be used to analyze large data sets. In most cases, you want to take a subset to perform some operations that do not alter the data.  In which case, copying the data by default would be costly in terms of memory. Unsurprisingly, the idea of views is taken from databases (covered in chapter 10), where it arises for the exact same reason.

Once you have selected your data, it is easy to calculate summary
statistics:

```python
>>> data.Male_plumage_score.mean()
51.00918939004283
>>> data.Male_plumage_score.median()
49.72222222
>>> data.Male_plumage_score.std()
8.200662934673714
```

___


### Visualizing Data with Pandas

A useful feature is that you can produce nice plots for exploratory analysis. If you have not done it already, load the Matplotlib library and type

```python
>>> import matplotlib as mpl
>>> data.Male_plumage_score.hist()
<matplotlib.axes._subplots.AxesSubplot object at 0x7f9a3f2ecbe0>
>>> mpl.pyplot.show()
```

Hopefully, you see this:

![alt text](Week13_files/Capture5.PNG "image 5")

Similarly, to produce a scatter plot, use

```python
>>> data.plot.scatter(x = "Male_plumage_score", y = "Female_plumage_score")
<matplotlib.axes._subplots.AxesSubplot object at 0x7f9a3f3a6588>
>>> mpl.pyplot.show()
```

![alt text](Week13_files/Capture6.PNG "image 6")

To draw a box plot displaying the distributions of plumage scores for males and females, type

```python
>>> data[["Male_plumage_score", "Female_plumage_score"]].plot.box()
<matplotlib.axes._subplots.AxesSubplot object at 0x7f9a3c20b358>
>>> mpl.pyplot.show()
```

![alt text](Week13_files/Capture7.PNG "image 7")

This introduction presents only a few functions of the quite comprehensive pandas library. If you want to perform exploratory analysis of large data sets in Python, we recommend that you master this package. Section 6. 7 provides pointers to resources to further your understanding. Many of the ideas behind the pandas package are taken from R, which we will explore in chapters 8 and 9.

___


### 6.4 Biopython

The Biopython project provides many standardized bioinformatics tools which, for example, facilitate the analysis and visualization of sequence data, the interface with data repositories, the parsing of popular file formats, and the integration of programs such as BLAST or Primer3.

Biopython is not part of the standard Python library and needs to be installed. You can find instructions in `~/CSB/scientiftc/installation/install.md`. 

___

### 6.4.1 Retrieving DNA Sequences from NCBI

Many of the popular biological databases offer an application programming interface (API) that allows information to be accessed programmatically. Instead of manually accessing the website, entering search terms, and clicking your way to the desired data set, you can write a script that automatically queries the database and retrieves the data. The data are downloaded in a structured format, such as Extensible Markup Language (XML), making it both human readable and machine readable. Using APis automates your work flow, making it easy to scale up your analysis and facilitating the analysis within the Python environment.

The National Center for Biotechnology Information (NCBI) not only offers an extensive API, but also the Entrez Programming Utilities (E-utilities)-a set of server-side programs to search and retrieve information. Biopython offers functions to interact directly with E-utilities. Let us see how it works by retrieving information about the inquisitive shrew mole (_Uropsilus investigator_):

```python
# import package
>>> from Bio import Entrez

# provide your e-mail address to let NCBI know who you are
>>> Entrez.email = "me@bigu.edu"
>>> handle = Entrez.esearch(db = "nuccore", term = ("Uropsilus investigator[Organism]"))
```

The function `Entrez.esearch` allows us to search any of the databases hosted by NCBI, returning a handle to the results. A handle is a standardized "wrapper" around text information. Handles are useful for reading information incrementally, which is important for large data files. Handles are often used to pass information to a parser, such as the function `Entrez.read`:

```python
>>> record = Entrez.read(handle)
>>> handle.close()

# record is a dictionary, we can look at the keys
>>> record.keys()
dict_keys(['Count', 'RetMax', 'RetStart', 'IdList', 'TranslationSet', 'TranslationStack', 'QueryTranslation'])

# your output may look different:
# dictionaries have no natural order
```

The `Entrez.read` parser breaks the retrieved XML data down into individual parts, and transforms them into Python objects that can be accessed individually. Let us see how many sequences are available in the nucleotide database for our search term, and access the record IDs:

```python
>>> record["Count"]
'126'
# retrieve list of GenBank identifiers
>>> id_list = record["IdList"]
>>> print(id_list)
['1631860235', '1631860231', '1631860225', '1631860187', '1631860183', '1631860181', '1631860179', '1631860169', '1631859951', '1631859923', '1631859919', '1631859917', '1631859915', '1631859905', '1631859701', '1631859677', '1631859673', '1631859671', '1631859669', '1631859659']
```

Note that your counts and IDs might differ if more information about the inquisitive shrew mole has been uploaded since we ran our query.

___

### Fetch Sequences and Save to File

Now that we know what is available (using `Entrez.search`) we can fetch our sequence data using `Entrez.efetch`. We retrieve the first 100 sequences in FASTA format and save them to a file:

```python
# always tell NCBI who you are
Entrez.email = "me@bigu.edu"
handle = Entrez.efetch(db = "nuccore",
    rettype = "fasta",
    retmode = "text",
    id = id_list[:100])

#setup a handle to an output file
out_handle = open("Uropsilus_seq.fasta", "w")

# write obtained sequence data to file
for line in handle:
    out_handle.write(line)


88
71
71
...
71
2
1

out_handle.close()
handle.close()
```

___


### 6.4.2 Input and Output of Sequence Data Using SeqIO

Next, we use the module Seq IO to manipulate our sequences and obtain more information about our U. investigator results:

```python
>>> from Bio import SeqIO
>>> handle = open("Uropsilus_seq.fasta", "r")
>>> for record in SeqIO.parse(handle, "fasta"):
...     print(record.description)
...     print(len(record))
...

MH210524.1 Uropsilus investigator voucher KIZ:2012121035 titin (TTN) gene, partial cds
940
MH210522.1 Uropsilus investigator voucher KIZ:GLGS2416 titin (TTN) gene, partial cds
940
MH210519.1 Uropsilus investigator voucher KIZ:GLGS1945 titin (TTN) gene, partial cds
940
MH210500.1 Uropsilus investigator voucher KIZ:201211262 titin (TTN) gene, partial cds
940
MH210498.1 Uropsilus investigator voucher KIZ:201211169 titin (TTN) gene, partial cds
940
MH210497.1 Uropsilus investigator voucher KIZ:201211160 titin (TTN) gene, partial cds
940
MH210496.1 Uropsilus investigator voucher KIZ:201211149 titin (TTN) gene, partial cds
940
MH210491.1 Uropsilus investigator voucher KIZ:201211136 titin (TTN) gene, partial cds
940
MH210382.1 Uropsilus investigator voucher KIZ:2012121035 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210368.1 Uropsilus investigator voucher KIZ:201211262 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210366.1 Uropsilus investigator voucher KIZ:201211169 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210365.1 Uropsilus investigator voucher KIZ:201211160 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210364.1 Uropsilus investigator voucher KIZ:201211149 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210359.1 Uropsilus investigator voucher KIZ:201211136 recombination activating protein 2 (RAG2) gene, partial cds
701
MH210257.1 Uropsilus investigator voucher KIZ:2012121035 recombination activating protein 1 (RAG1) gene, partial cds
1010
MH210245.1 Uropsilus investigator voucher KIZ:201211262 recombination activating protein 1 (RAG1) gene, partial cds
1010
MH210243.1 Uropsilus investigator voucher KIZ:201211169 recombination activating protein 1 (RAG1) gene, partial cds
700




>>> handle.close()
```

SeqIO.parse returns a SeqRecord Python object that comes with several methods. Type record. and hit the Tab key in your Jupyter notebook to obtain a list of methods. Let us select only the records of the RAG1 gene and shorten our sequences before writing to a new file:

#################################
This code does not work, and you are not responsible for the rest of this document. I am keeping what follows so that I can just make a different example for a future class.

The problems in the book code were multifold. I have this down to 1 problem.  The SeqIO line does not work.  

```
>>> import re

```
output_handle = open("Uropsilus_RAG1.fasta", "w")
for record in SeqIO.parse("Uropsilus_seq.fasta", "fasta"):
	if re.search ("RAG1", record.description):
		print(record.id)
		short_seq = record[:100]
		SeqIO.write(record.id, output_handle, "fasta")

output_handle.close()


for record in SeqIO.parse("Uropsilus_seq.fasta", "fasta"):
	print(record.id)
	print(record.description)
		short_seq = record[:100]
		SeqIO.write(short_seq, output_handle, "fasta")




