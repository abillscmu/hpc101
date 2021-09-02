#!/bin/bash

#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=500
#SBATCH -p normal
#SBATCH --output=output-%A_%a.out
#SBATCH --error=error-%A_%a.out
#SBATCH --array=1-100
hostname
echo "This is task $SLURM_ARRAY_TASK_ID"
echo "bye"
