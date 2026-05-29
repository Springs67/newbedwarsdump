local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "IgnisUtil"
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
function u2.isPlayerWithinBridgeRange(p5, p6, p7, p8) --[[ Line: 18 ]]
    local v9 = p8 == nil and Vector3.new(15, 6, 15) or p8
    for _, v10 in p7 do
        if p5:isPositionInBridgeSegment(p6, v10, v9) then
            return true
        end
    end
    return false
end
function u2.getContainingBridgeSegments(p11, p12, p13, p14) --[[ Line: 29 ]]
    local v15 = p14 == nil and Vector3.new(15, 6, 15) or p14
    local v16 = v15
    local v17 = 0
    local v18 = {}
    for v19, v20 in p13 do
        local _ = v19 - 1
        if p11:isPositionInBridgeSegment(p12, v20, v16) == true then
            v17 = v17 + 1
            v18[v17] = v20
        end
    end
    return v18
end
function u2.isPositionInBridgeSegment(_, p21, p22, p23) --[[ Line: 49 ]]
    local v24 = (p22.cframe - p22.cframe.Position):Inverse() * (p21 - p22.cframe.Position) + p22.cframe.Position
    local v25 = p22.size + p23
    local v26 = p22.cframe.Position - v25 / 2
    local v27 = p22.cframe.Position + (v25 / 2 + Vector3.new(0, 16, 0))
    return v24.X >= v26.X and (v24.Y >= v26.Y and (v24.Z >= v26.Z and (v24.X <= v27.X and (v24.Y <= v27.Y and v24.Z <= v27.Z))))
end
function u2.getBridgeLength(_, p28, p29) --[[ Line: 77 ]]
    local v30 = 0
    for _, v31 in p29 do
        local v32 = (v31.cframe.Position - p28).Magnitude
        if v30 < v32 then
            v30 = v32
        end
    end
    return v30
end
u2.MAX_BRIDGE_LIFETIME = v1.SPIRIT_BRIDGE_DURATION - v1.SPIRIT_ARMOR_DELAY
return {
    ["IgnisUtil"] = u2
}