#!/bin/bash
# take as input an argument - slurm job id - and save it into a variable
jobid=$1
# run scontrol show job $jobid and save the output into a variable
#find the string that starts with StdOut= and save it into a variable without the StdOut= part
stdout=$(scontrol show job $jobid --cluster wice | grep StdOut= | sed 's/StdOut=//')
#show last 10 rows of the file if no argument 2 is given
nrows=${2:-10}
tail -f -n $nrows $stdout
