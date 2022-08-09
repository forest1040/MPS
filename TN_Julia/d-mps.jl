include("./MPS.jl")
using .MPSforQuantum
using LinearAlgebra

#N = 20
N = 10
#C0 = normalize!(rand(ComplexF64, 2^N)) # for random state
C0 = zeros(ComplexF64, 2^N)
C0[1] = 1 # '|000>'

# #D = 10
# eps = 1e-3
# mps = MPS(C0, eps)
# println("MPS's information")
# mps_size(mps)
# Hadamard = convert(Array{ComplexF64,2}, [1 1; 1 -1] ./ sqrt(2))
# mps = OneQubitGate(mps, Hadamard, 0) # -> '001' and '000'
# println(mps)

function MPS2(C::Array{ComplexF64,1}, param)
    # C = copy(C0)
    d = 2
    N = Int64(log2(size(C)[1]))
    arrs = []
    #eps = 1e-2
    #D = 550

    r = 1
    for i = 1:N-1
        C = reshape(C, d * r, d^(N - i))
        tmp_A, C = SVD(C, param)
        r = size(tmp_A, 2)
        col = convert(Int64, size(tmp_A, 1) / 2)
        push!(arrs, [tmp_A[1:col, :], tmp_A[(col+1):col*2, :]])
    end

    Ct = transpose(C)
    col2 = convert(Int64, size(C, 2) / 2)
    push!(arrs, [C[:, 1:col2], C[:, (col2+1):col2*2]])
    return arrs
end

eps = 1e-3
mps = MPS2(C0, eps)
println("MPS's information")
