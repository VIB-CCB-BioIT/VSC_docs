# R on Visual Studio Code

This document is a step-by-step walkthrough to set up R on Visual Studio Code. The main steps are already described [here](https://github.com/REditorSupport/vscode-R).

1. Optional* Install R on the VSC.

You can do this on the login node or on an interactive session. You can also simply use one of the modules available, but I prefer having more control over my R versions (and future updates) and the environment that it is installed.
For example, I have R installed in a specific conda environment.
Make sure you (created and) activated the environment where you want to install R and then you can run:
`conda install conda-forge::r-base` or in the case of (micro)mamba `micromamba install conda-forge::r-base` / `mamba install conda-forge::r-base`

2. Install languageserver and httpgd R packages

The `languageserver` package allows VSCode to communicate with R and allows autocompletion and a whole lot of other functionalities. The `httpgd` package improves the plotting functionality within VSCode.
To install these packages, open R (type `R` in terminal) and run: `install.packages(c("languageserver", "httpgd"))`.

3. Install VSCode extensions

Install the following two extensions on VS Code. Make sure you don't install other VSCode R extensions because they can (and in my experience, most likely will) interfere with eachother.
REditorSupport.r
RDebugger.r-debugger

4. Install radian

Radian is an alternative to the R terminal and brings many (much needed) improvements to the R terminal. You can install this in the same (or any other) conda environment that you have your R in. If you use the R module, you can install it in any environment you like, for instance your base environment. Installing can be done through `conda install conda-forge::radian`.
Or the (micro)mamba equivalent.

5. Set the terminal and radian path in VSCode

Open VSCode settings: `command + ,` in Mac, `control + ,` in Linux / Windows and adjust the following two settings.

Search for the setting `r.rterm`. You need to give the path to your radian location here. You can find the exact location by typing `which radian` in your terminal. In case you have radian installed in a conda environment, make sure you have activated the environment before typing `which radian`.

Search for the setting `r.rpath`. This is the path to your R installation. You can find the path by typing `which R`. Depending on if you use the module from VSC or if you installed R through conda make sure the module is loaded or the environment is activated.
