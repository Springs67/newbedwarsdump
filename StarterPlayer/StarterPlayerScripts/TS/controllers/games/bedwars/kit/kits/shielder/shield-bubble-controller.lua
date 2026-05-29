local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ShieldBubbleController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10)
    p10.Name = "ShieldBubbleController"
end
function u7.KnitStart(u11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u2
    --]]
    u5.KnitStart(u11)
    u4:GetInstanceAddedSignal("ShielderBubble"):Connect(function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
        --]]
        if u11:isEnabled() then
            u2:setQueryIgnored(p12, false)
        end
    end)
end
function u7.isRelevantItem(_, p13) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v14 = u6(p13.itemType)
    return (v14.block or v14.breakBlock) and true or false
end
function u7.onEnable(p15, _, _) --[[ Line: 41 ]]
    p15:disableQuery()
end
function u7.onDisable(p16) --[[ Line: 44 ]]
    p16:enableQuery()
end
function u7.disableQuery(_) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    for v17, v18 in u4:GetTagged("ShielderBubble") do
        local _ = v17 - 1
        u2:setQueryIgnored(v18, true)
    end
end
function u7.enableQuery(_) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    for v19, v20 in u4:GetTagged("ShielderBubble") do
        local _ = v19 - 1
        u2:setQueryIgnored(v20, false)
    end
end
v3.CreateController(u7.new())
return nil