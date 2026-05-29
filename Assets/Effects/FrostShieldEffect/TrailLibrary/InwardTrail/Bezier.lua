return {
    ["QuadBezier"] = function(p1, p2, p3, p4) --[[ Name: QuadBezier, Line 7 ]]
        local v5 = p2 + (p3 - p2) * p1
        return v5 + (p3 + (p4 - p3) * p1 - v5) * p1
    end
}