return {
    ["MAGNITUDE_HEURISTIC"] = function(p1, p2) --[[ Line: 3 ]]
        local v3 = math
        local v4 = (p1:getPosition() - p2).Magnitude
        return v3.round(v4)
    end,
    ["EUCLIDEAN_HEURISTIC"] = function(p5, p6) --[[ Line: 10 ]]
        local v7 = p5:getPosition()
        local v8 = p6.X - v7.X
        local v9 = math.pow(v8, 2)
        local v10 = p6.Z - v7.Z
        local v11 = v9 + math.pow(v10, 2)
        return math.sqrt(v11)
    end,
    ["TAXICAB_HEURISTIC"] = function(p12, p13) --[[ Line: 15 ]]
        local v14 = p12:getPosition()
        local v15 = p13.X - v14.X
        local v16 = math.abs(v15)
        local v17 = p13.Y - v14.Y
        return v16 + math.abs(v17)
    end
}