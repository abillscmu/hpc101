
F(x) = 4/(1+(x*x))

N = 10000000
Δx = 1/N
sum=let sum=Threads.Atomic{Float64}(0.0)
Threads.@threads for i in 1:N
	Threads.atomic_add!(sum,F((i-0.5)*Δx)*Δx)
end
println("π is $sum")
end



