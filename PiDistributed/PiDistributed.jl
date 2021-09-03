using Distributed
using ClusterManagers

addprocs_slurm(4)

@everywhere F(x) = 4/(1+(x*x))

NUM_SEGMENTS = 10
Δx = 1/NUM_SEGMENTS
dx = Δx/2:Δx:1-Δx/2

y_arr = pmap(F,dx)
seg_vols = y_arr.*Δx
tot_sum = sum(seg_vols)

println("Pi is $tot_sum")