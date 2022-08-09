a = [1 2 3]
println("a: ", a)
b = cat(a, a, dims=1)
println("b(dims=1): ", b)
b = cat(a, a, dims=2)
println("b(dims=2): ", b)
b = cat(a, a, dims=3)
println("b(dims=3): ", b)
# b = cat(a, a, dims=4)
# println("b(dims=4): ", b)

# a2 = [1 2 3; 4 5 6]
# b2 = cat(a2, a2, dims=3)
# println("b2(dims=3): ", b2)

a2 = [1 2]
b2 = cat(a2, a2, dims=3)
println("b2(dims=3): ", b2)
