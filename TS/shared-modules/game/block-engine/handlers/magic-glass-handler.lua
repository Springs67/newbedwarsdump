local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.GreedyBlockHandler
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "MagicGlassHandler"
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
function u6.place(p10, p11, p12, _) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
    --]]
    local v13 = u4.createNewInstance(p10, p12)
    v13.CFrame = CFrame.new(u3:getWorldPosition(p11))
    v13:SetAttribute("IgnoreProjectileCollision", true)
    u5:AddTag(v13, "DontBlockSwordRaycast")
    u5:AddTag(v13, "DontBlockAbilityRaycast")
    u5:AddTag(v13, "DontBlockProjectileRaycast")
    v13.Transparency = 0.62
    return v13
end
return {
    ["MagicGlassHandler"] = u6
}