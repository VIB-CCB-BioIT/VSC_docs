## Different sbatch submission settings for commonly used nodes

### bigmem/hugemem
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --mem-per-cpu=111900M                                          # This is for hugemem, use 28000M for bigmem
#SBATCH --time=72:00:00
#SBATCH --account=lp_lvibccbeu
#SBATCH --partition=hugemem
#SBATCH --cluster=wice
#SBATCH --output=/staging/leuven/stg_00104/logs/%j.out                 # where to store the output ( %j is the JOBID )
#SBATCH --error=/staging/leuven/stg_00104/logs/%j.err                  # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=luuk.harbers@kuleuven.be
```

### (dedicated) GPU
```
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node=72
#SBATCH --mem=970G
#SBATCH --time=72:00:00
#SBATCH --account=lp_big_wice_gpu                                      # Use normal Account is using regular compute nodes
#SBATCH --partition=dedicated_big_gpu                                  # Use gpu_a100 or gpu_h100 if using regular compute nodes
#SBATCH --gpus-per-node=4
#SBATCH --cluster=wice
#SBATCH --output=/staging/leuven/stg_00104/logs/%j.out                 # Where to store the output ( %j is the JOBID )
#SBATCH --error=/staging/leuven/stg_00104/logs/%j.err                  # Where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=luuk.harbers@kuleuven.be
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
#SBATCH --output=/staging/leuven/stg_00104/logs/%j.out                 # where to store the output ( %j is the JOBID )
#SBATCH --error=/staging/leuven/stg_00104/logs/%j.err                  # where to store error messages
#SBATCH --mail-type=ALL
#SBATCH --mail-user=luuk.harbers@kuleuven.be
```

