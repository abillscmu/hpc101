#!/bin/bash
#SBATCH -p normal
#SBATCH -N 4
#SBATCH -n 4
#SBATCH --mem 1G
#SBATCH --output=out.txt
#SBATCH --error=err.txt
mpirun hostname
