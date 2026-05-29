local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u5 = v1.import(script, script.Parent, "block-fortifier").BlockFortifier
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "HammerController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    u3.constructor(p9, ...)
    p9.Name = "HammerController"
    p9.blockFortifier = u5.new()
end
function u6.KnitStart(p10) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p10)
end
function u6.isRelevantItem(_, p11) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4(p11.itemType).fortifiesBlock ~= nil
end
function u6.onEnable(p12, _) --[[ Line: 33 ]]
    p12.blockFortifier:disable()
    p12.blockFortifier:enable()
end
function u6.onDisable(p13) --[[ Line: 37 ]]
    p13.blockFortifier:disable()
end
return {
    ["HammerController"] = v2.CreateController(u6.new())
}