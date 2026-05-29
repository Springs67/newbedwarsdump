local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u2 = v1.BlockEngine
local u3 = v1.PrefabBlockHandler
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "BlackMarketShopBlockHandler"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, ...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7, ...)
end
function u4.getContainedPositions(_, p8) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v9 = u2:getBlockPosition(p8.Position)
    return { v9, v9 + Vector3.new(0, 0, 1) }
end
return {
    ["BlackMarketShopBlockHandler"] = u4
}