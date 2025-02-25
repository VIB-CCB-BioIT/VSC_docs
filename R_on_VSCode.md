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

Note: If these settings don't show up, make sure that the R extension is installed (also if you are connected to a compute node)


6. Enable httpgd plotting and bracketed paste

Enable the following two settings in VS Code settings (see previous point on how to open settings).
enable `r.plot.useHttpgd`  
enable `r.bracketedPaste`

7. Launch the R terminal in VS Code

You can launch the R terminal by clicking the small downward arrow next to the `+` sign or by going to the command palette (keybind mac: `command + shift + P`, windows/linux: `control + shift + P`) and searching for "Create R Terminal".
This terminal should then automatically be linked to your VS Code session and should allow you to send code from your R file to the terminal, similarly as in R Studio. It should also open a new plotting window. You can test this by running the following:
```
library(ggplot2)

# Sample data
data = data.frame(x = rnorm(100), y = rnorm(100))

# Create scatter plot
ggplot(data, aes(x = x, y = y)) +
  geom_point()
```

It should also open a separate window for viewing objects using `View()` or a help window when using `?functionName`.

## Common Errors:
1. When trying to launch R terminal, it almost immediately gives an error with exit code 1.

    If you try to run `radian` from your terminal and you receive the following:
    ```
    Traceback (most recent call last):
    File "/vsc-hard-mounts/leuven-data/366/vsc36671/micromamba/bin/radian", line 10, in <module>
      sys.exit(main())
               ^^^^^^
    File "/vsc-hard-mounts/leuven-data/366/vsc36671/micromamba/lib/python3.12/site-packages/radian/app.py", line 52, in main
      r_home = Rhome()
               ^^^^^^^
    File "/vsc-hard-mounts/leuven-data/366/vsc36671/micromamba/lib/python3.12/site-packages/rchitect/utils.py", line 89, in Rhome
      raise RuntimeError("Cannot determine R HOME.")
    RuntimeError: Cannot determine R HOME.
    ```
   I have experienced that sometimes you need to reload a new compute node for it to go into effect. Otherwise you can try the following:
   
   You need to add your R_Home to the VSCode settings.
   Go open the VS Code settings (but JSON) by going to the command palette (as explained in step 7) and searching for "USer Settings JSON" and open the user settings.
   There add the following (don't forget to add a comma to the previous setting):
   ```
   "terminal.integrated.env.linux": {
   "R_HOME": "/path/to/Rhome"
   }
   ```
   You can find your R home by running which R as previously and changing `bin` to `lib`
   For instance:
   ```
   $ which R
   /vsc-hard-mounts/leuven-data/asd/asdasd/software/micromamba/bin/R
   ```
   Would result in `/vsc-hard-mounts/leuven-data/asd/asdasd/software/micromamba/lib/R`
   
