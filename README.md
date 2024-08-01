# VSC_docs
Guides, FAQ, and how-tos for VSC related activities

## Using the ssh config file
[The config file](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/config) should be added on your local computer/laptop (the one you use to connect to the VSC). This file contains all the dedicated and batch nodes from KU Leuven VSC and can be used as a template. You have to make specific changes to this file before you can use this.
Key changes to be made in each block are: vsc_id and, potentially the location of your `id_rsa` file.

## Daily workflow for setting up VS Code to work on the VSC
A step-by-step guide of how I use VS Code to work on the VSC is available [here](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/using_vsc_in_VScode.md)

## Custom .bashrc (credits to Gert Hulselmans)
It is highly recommended to use a custom `.bashrc` file on the VSC. These files are loaded when you open a new terminal and can make life a lot easier.
A .bashrc generated by Gert Hulselmans which contains many useful functions and sets some sensible defaults can be found here: `/data/leuven/software/biomed/configuration/connect_to_servers/hpc_biomed_bash_profile/biomed_bash_profile`, you can either select parts from this file or use it entirely, but to use it correctly, you should use the installation script here: `/data/leuven/software/biomed/configuration/connect_to_servers/hpc_biomed_bash_profile/install_biomed_bash_profile.sh`

## Installing micromamba
micromamba is an alternative to (mini)conda, and comes with a faster libsolver. You can also install conda with the mamba solver if you prefer. For more information check [here](https://docs.vscentrum.be/software/python_package_management.html).
Installing micromamba in your $VSC_DATA directory

```
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj ${VSC_DATA}/micromamba

# If using bash (default for most users).
${VSC_DATA}/micromamba shell init -s bash -p ~/micromamba

# Source the bashrc file
source ~/.bashrc
```

In the case you use `zsh` instead of `bash`, make the following two changes:
1. `-s bash` to `-s zsh`
2. `source ~/.bashrc` to `source ~/.zshrc` 

## Convenient command aliases
Some convenient aliases can be found [here](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/VSC_aliases). Simply add them to your `.bashrc` or `.zshrc` (and reload the terminal or source the script like `source ~/.bashrc`). You can then use these commands instead of typing out the full command. For instance `q` instead of `squeue --cluster wice`. To use the `bpeek` alias, which looks at the current output of a running job, you need to have the [bpeek.sh](https://github.com/VIB-CCB-BioIT/VSC_docs/blob/main/bpeek.sh) script located in your home folder (`~/bpeek.sh`).

## Dedicated BIG nodes
For information and guidelines on using the dedicated BIG nodes (or requesting access to them), go to the handbook [here](https://docs.google.com/document/d/1bMqhykatkkATmWkqIdaXqQRv8GnfUOX9qSdDuShfmCI/edit), credits to Kris Davie.

## Automatic SLURM emails
If you want to receive emails when your job starts and end (with exit code). You can include in your submission script the following lines:
```
#SBATCH --mail-type=ALL
#SBATCH --mail-user=FIRST.LASTNAME@kuleuven.be
```
If you're using outlook and you don't want SLURM emails to flood your inbox, you can move them automatically in a predefined folder.
1. Make a new folder in your outlook, for instance: SLURM
2. In outlook go to Tools --> Rules --> New Rule
3. Select the sender: From - slurm@hpc.kuleuven.be
4. Add the action: Move to --> SLURM

This will move all future emails from slurm@hpc.kuleuven.be automatically to your SLURM folder.
