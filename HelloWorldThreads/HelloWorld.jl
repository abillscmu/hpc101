

Threads.@threads for i=1:4
	tid = Threads.threadid()
	println("Hello from thread number $tid")
end
