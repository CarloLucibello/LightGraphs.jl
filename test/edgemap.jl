using Base.Test
srand(17)
n = 10
m = 10
g = Graph(n, m)

em = EdgeMap(Int, g)
em2 = EdgeMap(g, Dict{Edge, Int}())
em5 = ConstEdgeMap(g, 1)
# em = ConstEdgeMap(g, x)
#em = DefaultEdgeMap(Int)
@test_throws(ErrorException, em5[1,2] = 1)

@test eltype(em) == Pair{Edge,Int}
@test valtype(em) == Int
@test keytype(em) == Edge
i = 0
for e in edges(g)
    em[e] = (i+=1)
    em2[src(e), dst(e)] = em[e]
    @test em[e] == em2[e]
    @test  em2[src(e), dst(e)] == em[src(e), dst(e)]
end

# for (e, w) in em
#     @test typeof(e) == Edge
#     @test typeof(w) == Int
# end

em = EdgeMap(g, spzeros(Int, n, n))
@test eltype(em) == Pair{Edge,Int}
@test valtype(em) == Int
@test keytype(em) == Edge
i = 0
for e in edges(g)
    em[e] = (i+=1)
    em2[src(e), dst(e)] = em[e]
    @test em[e] == em2[e]
    @test  em2[src(e), dst(e)] == em[src(e), dst(e)]
end

# for (e, w) in em
#     @test typeof(e) == Edge
#     @test typeof(w) == Int
# end
