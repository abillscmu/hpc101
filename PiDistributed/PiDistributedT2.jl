using Distributed
using ClusterManagers

addprocs_slurm(4)

@everywhere F(x) = 4/(1+(x*x))

@everywhere function F_chunk(x_arr)
    tot_sum = 0.0
    for x in x_arr
        tot_sum = tot_sum+F(x)
    end
    return tot_sum
end

NUM_SEGMENTS = 100000000
Δx = 1/NUM_SEGMENTS
dx = Δx/2:Δx:1-Δx/2

NUM_CHUNKS = 4
chunked_dx = reshape(dx, (NUM_CHUNKS, div(length(dx), NUM_CHUNKS)))
function slicematrix(A::AbstractMatrix{T}) where T
    m, n = size(A)
    B = Vector{T}[Vector{T}(undef, n) for _ in 1:m]
    for i in 1:m
        B[i] .= A[i, :]
    end
    return B
end
chunked_dx = slicematrix(chunked_dx)

y_arr = pmap(F_chunk,chunked_dx)
seg_vols = y_arr.*Δx
tot_sum = sum(seg_vols)

println("Pi is $tot_sum")