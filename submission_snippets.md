# Different sbatch submission settings for commonly used nodes

## VSC (Tier 2)

### batch
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=128G
#SBATCH --time=24:00:00
#SBATCH --account=lp_lvibccbeu
#SBATCH --partition=batch
#SBATCH --cluster=wice
#SBATCH --output=/path/to/directory/logs/%j.out              # where to store the output ( %j is the JOBID )
#SBATCH --error=/path/to/directory/logs/%j.err               # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@kuleuven.be
```

### bigmem / hugemem
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --mem-per-cpu=111900M                                # This is for hugemem, use 28000M for bigmem
#SBATCH --time=72:00:00
#SBATCH --account=lp_lvibccbeu
#SBATCH --partition=hugemem
#SBATCH --cluster=wice
#SBATCH --output=/path/to/directory/logs/%j.out              # where to store the output ( %j is the JOBID )
#SBATCH --error=/path/to/directory/logs/%j.err               # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@kuleuven.be
```

### Dedicated GPU
Changes required to submit to the non-dedicated GPU nodes is written after the relevant lines
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=72
#SBATCH --mem=970G
#SBATCH --time=72:00:00
#SBATCH --account=lp_big_wice_gpu                            # Use normal Account is using regular compute nodes
#SBATCH --partition=dedicated_big_gpu                        # Use gpu_a100 or gpu_h100 if using regular compute nodes
#SBATCH --gpus-per-node=4
#SBATCH --cluster=wice
#SBATCH --output=/path/to/directory/logs/%j.out              # Where to store the output ( %j is the JOBID )
#SBATCH --error=/path/to/directory/logs/%j.err               # Where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@kuleuven.be
```

### Dedicated CPU
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=500G
#SBATCH --time=24:00:00
#SBATCH --account=lp_big_wice_cpu
#SBATCH --partition=dedicated_big_bigmem
#SBATCH --cluster=wice
#SBATCH --output=/path/to/directory/logs/%j.out              # where to store the output ( %j is the JOBID )
#SBATCH --error=/path/to/directory/logs/%j.err               # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@kuleuven.be
```

### Array job
This example is to run an array job on multiple bam files on dedicated CPU nodes. This will spawn multiple slurm jobs (based on how large your array is), each with the specified resources requested.
Be sure to change the number of array jobs based on how many you need to spawn (i.e. number of files to run)
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=500G
#SBATCH --time=24:00:00
#SBATCH --account=lp_big_wice_cpu
#SBATCH --partition=dedicated_big_bigmem
#SBATCH --cluster=wice
#SBATCH --output=/path/to/directory/logs/%A_%a.out           # where to store the output ( %A is the JOBID while %a is the current array ID )
#SBATCH --error=/path/to/directory/logs/%A_%a.err            # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your.email@kuleuven.be
#SBATCH --array=0-9                                          # This needs to be altered based on number of array jobs you want to spawn


# Define directories or a files to loop over. For example bam files in a specific directory
BAMS=/some/dir/*bam

# Get the current sample to run based on the SLURM_ARRAY_TASK_ID
CURRENT_BAM=${BAMS[$SLURM_ARRAY_TASK_ID]}

# Do stuff with current bam
do_stuff($CURRENT_BAM)

################
# If instead you want to loop over rows of a file (for instance a file where each row is a chromosome)
CURRENT_ROW=$(sed -n "${SLURM_ARRAY_TASK_ID}p" < chroms.txt)

# Do stuff per chromosome
process_chrom($CURRENT_ROW)

###############
# Or loop over a list of manually defined files
# Make list of files to iterate over
files=(file1.txt
file2.txt
file15.txt)

process_file(${files[$SLURM_ARRAY_TASK_ID]})

```

## VIB Compute Cluster

### Interactive srun command

`srun -n 1 -c 8 --mem 100G --time=9:00:00  -p hmem_128C_256T_2TB --pty bash -l`
