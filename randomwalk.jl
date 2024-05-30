#１次元のランダムウォーク

x = 0

function update(x::Real, p::Real = 0.7)
    if rand() < p
        return x + one(x)
    else
        return x - one(x)
    end
end

function randomwalk(nsteps::Integer, prob::Real = 0.5)
    result = zeros(Int, nsteps + 1)
    x = 0
    positions = [x]
    for t in 1:nsteps
        x = update(x, prob)
        result[t + 1] = x
    end
    return result
end

nsteps = length(ARGS)>0 ? parse(Int, ARGS[1]) : 1000
prob = length(ARGS)>1 ? parse(Float64, ARGS[2]) : 0.7

result = randomwalk(nsteps, prob)

for (t, x) in enumerate(result)
    println("$(t-1) $x")
end