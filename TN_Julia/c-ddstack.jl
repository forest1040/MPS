#include("./MPS.jl")
#using .MPSforQuantum
using LinearAlgebra

pauliX = convert(Array{ComplexF64,2}, [0 1; 1 0])
pauliY = [0 -im; im 0]
pauliZ = convert(Array{ComplexF64,2}, [1 0; 0 -1])
Hadamard = convert(Array{ComplexF64,2}, [1 1; 1 -1] ./ sqrt(2))
pauliI = convert(Array{ComplexF64,2}, [1 0; 0 1])
zero = convert(Array{ComplexF64,2}, [0 0; 0 0])

test = [1+im 2-2im; 3+3im 4-4im]

function ddstack(operators)
    m = size(operators)[1]
    tmp2 = []
    for i = 1:m
        push!(tmp2, cat(operators[i]..., dims=4))
    end
    tmp3 = Tuple(tmp2)
    mpo = cat(tmp3..., dims=3)
    return mpo
end

x = ddstack([pauliX])
println("x: ", x)
# y = ddstack([pauliY])
# println("y: ", y)
# z = ddstack([pauliZ])
# println("z: ", z)
# i = ddstack([pauliI])
# println("i: ", i)
t = ddstack([test])
println("t: ", t)

operators = [test]

m = size(operators)[1]
tmp2 = []
for i = 1:m
    push!(tmp2, cat(operators[i]..., dims=4))
end
tmp3 = Tuple(tmp2)
mpo = cat(tmp3..., dims=3)
