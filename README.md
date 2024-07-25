# VSC_docs
Guides, FAQ, and how-tos for VSC related activities

## Using the ssh config file
[The config file](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/config) should be added on your local computer/laptop (the one you use to connect to the VSC). This file contains all the dedicated and batch nodes from KU Leuven VSC and can be used as a template. You have to make specific changes to this file before you can use this.
Key changes to be made in each block are: vsc_id and, potentially the location of your `id_rsa` file.

## Daily workflow for setting up VS Code to work on the VSC
A step-by-step guide of how I use VS Code to work on the VSC is available in this repository [here](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/using_vsc_in_VScode.md)

## Convenient command aliases
Some convenient aliases can be found here. Simply add them to your `.bashrc` or `.zshrc` (and reload the terminal or source the script like `source ~/.bashrc`)
