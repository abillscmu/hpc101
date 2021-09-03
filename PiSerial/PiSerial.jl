F(x) = 4/(1+(x*x))

N = 10000000
Δx = 1/N
@time let sum=0.0
for i in 1:N
	sum=sum+(F((i-0.5)*Δx)*Δx)
end
println("π is $sum")


end



