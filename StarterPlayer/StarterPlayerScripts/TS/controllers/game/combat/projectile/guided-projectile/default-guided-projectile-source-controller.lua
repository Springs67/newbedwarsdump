local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u4 = v1.import(script, script.Parent, "guided-projectile-source-controller").GuidedProjectileSourceController
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "DefaultGuidedProjectileSourceController"
    end,
    ["__index"] = u4
})
u5.__index = u5
function u5.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p8, ...)
    p8.Name = "DefaultGuidedProjectileSourceController"
end
function u5.isRelevantItem(_, p9) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return u3(p9.itemType).guidedProjectileSource ~= nil
end
function u5.onLaunch(_) --[[ Line: 29 ]] end
return {
    ["DefaultGuidedProjectileSourceController"] = v2.CreateController(u5.new())
}