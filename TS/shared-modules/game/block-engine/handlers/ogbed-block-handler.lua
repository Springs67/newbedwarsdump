local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.PrefabBlockHandler
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "OgBedBlockHandler"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9, ...)
end
function u6.place(p10, p11, p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    local v13 = u4.place(p10, p11, p12)
    v13:FindFirstChild("Bed").Color = u5.hexColor(p12)
    return v13
end
function u6.getContainedPositions(_, p14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v15 = u3:getBlockPosition(p14.Position)
    return { v15, v15 + Vector3.new(0, 0, 1) }
end
return {
    ["OgBedBlockHandler"] = u6
}