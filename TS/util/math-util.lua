local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
return {
    ["MathUtil"] = {
        ["roundToDecimalPlaces"] = function(p2, p3) --[[ Name: roundToDecimalPlaces, Line 7 ]]
            local v4 = math.pow(10, p3)
            local v5 = p2 * v4
            return math.round(v5) / v4
        end,
        ["randomFloatMaxInclusive"] = function(p6, p7, p8) --[[ Name: randomFloatMaxInclusive, Line 12 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            if p8 == nil then
                p8 = false
            end
            local v9 = u1:lerp(p6, p7, math.random())
            if p8 then
                v9 = v9 * (math.random() > 0.5 and 1 or -1)
            end
            return v9
        end,
        ["convertRange"] = function(p10, p11, p12) --[[ Line: 23 ]]
            return (p10 - p11[1]) * (p12[2] - p12[1]) / (p11[2] - p11[1]) + p12[1]
        end,
        ["getRandomNumberFromNumberRange"] = function(p13) --[[ Name: getRandomNumberFromNumberRange, Line 27 ]]
            local v14 = math.random() * (p13.Max - p13.Min) + p13.Min
            return math.round(v14)
        end
    }
}