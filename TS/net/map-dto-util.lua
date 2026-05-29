local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "MapDtoUtil"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_) --[[ Line: 16 ]] end
function u2.toMapDto(_, p5) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.entries(p5)
end
function u2.toMap(_, p6) --[[ Line: 21 ]]
    local v7 = {}
    for _, v8 in p6 do
        v7[v8[1]] = v8[2]
    end
    return v7
end
return {
    ["MapDtoUtil"] = u2
}