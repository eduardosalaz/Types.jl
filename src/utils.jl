using LaTeXStrings
function plot_instance(Instance, path::String)
    plot_font = "Computer Modern";
    default(fontfamily=plot_font,framestyle=:box, grid=false, tickfontsize=7)
    BU_coords = Instance.BU_coords
    S_coords = Instance.S_coords
    Sk = Instance.Sk
    S₁ = Sk[1]
    S₁_coords = S_coords[S₁, :]
    #Y₁_used = [(Y2[j] ? :red : :white) for j in S₁]
    S₂ = Sk[2]
    S₂_coords = S_coords[S₂, :]
    #Y₂_used = [(Y2[j] ? :red : :white) for j in S₂]
    S₃ = Sk[3]
    S₃_coords = S_coords[S₃, :]
    #Y₃_used = [(Y2[j] ? :red : :white) for j in S₃]
    S₄ = Sk[4]
    S₄_coords = S_coords[S₄, :]
    #Y₄_used = [(Y2[j] ? :red : :white) for j in S₄]
    S₅ = Sk[5]
    S₅_coords = S_coords[S₅, :]
   # Y₅_used = [(Y2[j] ? :red : :white) for j in S₅]
    Plots.scatter(
        BU_coords[:, 1],
        BU_coords[:, 2],
        markershape = :circle,
        markercolor = :blue,
        label = "BUs",
        size = (1200, 800),
    )
    Plots.scatter!(
        S₁_coords[:, 1],
        S₁_coords[:, 2],
        label = L"S_1",
        markershape = :hexagon,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
        dpi = 500
    )
    Plots.scatter!(
        S₂_coords[:, 1],
        S₂_coords[:, 2],
        label = L"S_2",
        markershape = :diamond,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
        dpi = 500
    )
    Plots.scatter!(
        S₃_coords[:, 1],
        S₃_coords[:, 2],
        label = L"S_3",
        markershape = :star5,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
        dpi = 500
    )
    Plots.scatter!(
        S₄_coords[:, 1],
        S₄_coords[:, 2],
        label = L"S_4",
        markershape = :pentagon,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
        dpi = 500
    )
    Plots.scatter!(
        S₅_coords[:, 1],
        S₅_coords[:, 2],
        label = L"S_5",
        markershape = :star4,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
        dpi = 500
    )
    png(path)
    @debug "Wrote plot and coords"
end

function plot_solution(Solution, path::String)
    Instance = Solution.Instance
    BU_coords = Instance.BU_coords
    S_coords = Instance.S_coords
    X = Solution.X
    S = Instance.S
    B = Instance.B
    Sk = Instance.Sk
    S₁ = Sk[1]
    S₁_coords = S_coords[S₁, :]
    #Y₁_used = [(Y2[j] ? :red : :white) for j in S₁]
    S₂ = Sk[2]
    S₂_coords = S_coords[S₂, :]
    #Y₂_used = [(Y2[j] ? :red : :white) for j in S₂]
    S₃ = Sk[3]
    S₃_coords = S_coords[S₃, :]
    #Y₃_used = [(Y2[j] ? :red : :white) for j in S₃]
    S₄ = Sk[4]
    S₄_coords = S_coords[S₄, :]
    #Y₄_used = [(Y2[j] ? :red : :white) for j in S₄]
    S₅ = Sk[5]
    S₅_coords = S_coords[S₅, :]
   # Y₅_used = [(Y2[j] ? :red : :white) for j in S₅]
    Plots.scatter(
        BU_coords[:, 1],
        BU_coords[:, 2],
        markershape = :circle,
        markercolor = :blue,
        label = nothing
    )
    Plots.scatter!(
        S₁_coords[:, 1],
        S₁_coords[:, 2],
        label = nothing,
        markershape = :hexagon,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
    )
    Plots.scatter!(
        S₂_coords[:, 1],
        S₂_coords[:, 2],
        label = nothing,
        markershape = :diamond,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
    )
    Plots.scatter!(
        S₃_coords[:, 1],
        S₃_coords[:, 2],
        label = nothing,
        markershape = :star5,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
    )
    Plots.scatter!(
        S₄_coords[:, 1],
        S₄_coords[:, 2],
        label = nothing,
        markershape = :pentagon,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
    )
    Plots.scatter!(
        S₅_coords[:, 1],
        S₅_coords[:, 2],
        label = nothing,
        markershape = :star4,
        markercolor = :red,
        markersize = 6,
        markerstrokecolor = :red,
        markerstrokewidth = 2,
    )

    for i in 1:S
        for j in 1:B
            if X[i,j] == 1
                Plots.plot!(
                    [BU_coords[j,1], S_coords[i,1]],
                    [BU_coords[j,2], S_coords[i,2]],
                    color = :black,
                    label = nothing,
                )
            end
        end
    end
    png(path)
    @debug "Wrote plot"

end

function read_instance(path::String)
    instancia = jldopen(path)
    instance = instancia["instance"]
    return instance
end

function write_instance(instance, path::String)
    jldsave(path; instance)
end

function read_solution(path::String)
    sol = jldopen(path)
    solution = sol["solution"]
    return solution
end

function write_solution(solution, path::String)
    instance = solution.Instance
    jldsave(path; solution, instance)
end


function dump_solution(path::String)
    sol = jldopen(path)
    solution = sol["solution"]
    open("dump_solution.txt", "w") do io
        writedlm(io, solution.X)
        writedlm(io, solution.Y)
        writedlm(io, solution.Weight)
    end
end