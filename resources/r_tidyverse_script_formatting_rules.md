# R Tidyverse Script Style & Formatting Guidelines - Beginner Version

0. Your script should be in the `scripts` dir of your github repo for your project with the following dirs:

```
my_descriptive repo name
	data
	output
	scripts
```

1. Start every script with a shebang!

```r
#!/usr/bin/env Rscript
```

2. Use collapsing code sections to make your script easier to navigate

```r 
#### SECTION NAME ####
```

3. Use the `rstudioapi` package to automatically set the working dir to the present working dir

```r
#### INITIALIZE ####
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
```

4. Load all libraries in the #### INITIALIZE #### section at the top of the script and comment out any package installation lines

```r 
# install.packages("tidyverse")
# install.packages("janitor")
library(tidyverse)
library(janitor)
```

5. Define all variables in one section near the beginning of the script. Variable names should be descriptive

* All paths should refer to dirs and files within the repo, unless you have a multi-repo directory structure
* If you have a multi-repo directory structure, then you need to clearly indicate that a specific repo is needed with instructions of how to clone it

```r 
#### USER DEFINED VARIABLES ####
path_input_file = "../data/my_descriptively_named_data_file.tsv"
path_functions_script = "data_visualization_functions.R"
```

6. Source all scripts  in one section near the beginning of the script.

* All hard coding, such as specific file paths, should be saved into variables in the previous section

```r 
#### SOURCE SCRIPTS ####
source(path_functions_script)
```

7. Read in and wrangle your data using a human readable style

* All hard coding, such as specific file paths, should be saved into variables prior to here
* Never modify a variable and then save into the same variable to avoid confusion
* Read in and wrangle data in a single pipeline when possible
	* In a pipeline, add a `line feed` after every `<-` and comma
	* If there's more than one argument or option in a command, add a `line feed` after `command_name(`, every comma separating the arguments/options, and after the last argument/option to make it easy to comment out specific arguments/options

```r 
#### WRANGLE DATA ####
descriptive_variable_name <-
	read_tsv(
		path_input_file,
		skip = 1,
		# nmax = 50
	) %>%
	clean_names()
```

8. Continue with this style through the rest of the Script

* Separate code into descriptively names sections
* Rather than creating many versions of your data, aim for just 1 tibble that you can easily reformat in short pipelines that feed into `ggplot()` or statistical analysis commands

