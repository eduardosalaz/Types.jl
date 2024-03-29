module Types
using JLD2, DelimitedFiles, LaTeXStrings, Plots; gr()
include("utils.jl")
struct Instance
    B::Int64
    S::Int64
    K::Int64
    M::Int64
    P::Int64
    BU_coords::Matrix{Int64}
    S_coords::Matrix{Int64}
    D::Matrix{Int64}
    Sk::Vector{Vector{Int64}}
    Lk::Vector{Int64}
    Uk::Vector{Int64}
    V::Vector{Vector{Int64}}
    μ::Vector{Vector{Int64}}
    T::Vector{Float64}
    R::Vector{Int64}
    β::Vector{Int64}
end

struct Solution
    Instance::Instance
    X::Matrix{Int64}
    Y::Vector{Int64}
    Weight::Int64
    Time::Int64
end

export Instance, Solution
export plot_instance, plot_solution
export read_instance, write_instance
export read_solution, write_solution
export dump_solution


end
