
include("./MPS.jl")
using .MPSforQuantum
using LinearAlgebra

pauliX = convert(Array{ComplexF64,2}, [0 1; 1 0])
pauliY = [0 -im; im 0]
pauliZ = convert(Array{ComplexF64,2}, [1 0; 0 -1])
Hadamard = convert(Array{ComplexF64,2}, [1 1; 1 -1] ./ sqrt(2))
pauliI = convert(Array{ComplexF64,2}, [1 0; 0 1])
zero = convert(Array{ComplexF64,2}, [0 0; 0 0])

### MPO
O = []
push!(O, dstack([pauliZ, pauliI]))
push!(O, ddstack([pauliZ, zero, zero, pauliZ]))
push!(O, dstack([pauliI, pauliZ]))

#println("pauliZ: ", O[1][:, :, 1]) # [site], [phys1, phys2, i(, j)]
#println("pauliI: ", O[1][:, :, 2]) # [site], [phys1, phys2, i(, j)]

println(O[0])
