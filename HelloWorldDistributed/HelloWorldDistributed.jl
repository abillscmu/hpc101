using Distributed
using ClusterManagers

addprocs_slurm(4)


@everywhere function getinfo()
    hostname = gethostname()
    proc_number = myid()
    return hostname,proc_number
end

pr = procs()
np = length(pr)

hostnames = pmap((p)->getinfo(),pr)
for (i,host) in enumerate(hostnames)
    hostname = host[1]
    proc_number = host[2]
    println("Hello from $hostname, I'm process number $proc_number of $np")
end

