#!/bin/bash

#SBATCH -N 4
#SBATCH -n 4
#SBATCH -p normal
#SBATCH --time=15:00

/home/abills/julia-1.5.2/bin/julia HelloWorldDistributed.jl